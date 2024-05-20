import 'package:flutter/material.dart' show debugPrint, ValueNotifier;
import 'package:gemini_controls_rfw/data/local_chat_parameters.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gemini_controls_rfw/backend/api_key.dart';

/// An individual chat, with a personality, situation, and chat history.
class LocalChat {
  LocalChat({
    required this.name,
    required this.personality,
    required this.situation,
  });

  /// The name associated with this chat.
  String name;

  /// The personality characteristics associated with this chat.
  String personality;

  /// The situation given to this chat. EG: Personal assistant,
  /// coding partner, etc.
  String situation;

  /// A list that holds the history of text only messages.
  final messageHistory = <CustomChatMessage>[];

  /// The chat history of this chat.
  final chatHistoryContent = <Content>[];

  /// Used to prevent a second message from being sent by the user before
  /// a response to the previous message has been received.
  bool awaitingResponse = false;

  /// This is the widget tree shown on app initialization.
  final ValueNotifier<String> _rfwString = ValueNotifier<String>('''
  Center(
    child: Column(
  children: [
  Container(
  width: 200.0,
  height: 200.0,
  decoration: {
  type: "box",
    color: 0xFFFF7700,
    border: [
      {
        color: 0xFFFF00FF,
        width: 5.0,
      },
    ],
    borderRadius:
          [
            {x: 20.0, y: 20.0},
            {x: 20.0, y: 20.0},
            {x: 20.0, y: 20.0},
            {x: 20.0, y: 20.0},
          ],
  },
),
SizedBox(height: 16.0,),
    SizedBox(
      width: 100.0,
      height: 4.0,
      child: ColoredBox(
      // Colors are just the hex value of the color, don't use the Color or Colors constructors.
        color: 0xFF0000FF, 
      ),
    ),
    Icon(
    // Icons are passed in with their #, not an Icon constructor.
      icon: 0xE2A0,
      // Don't forget the family.
      fontFamily: "MaterialIcons",
      color: 0xFFFF00FF,
      size: 30.0,
    ),
    // FYI: You write Container but what actually gets used is an AnimatedContainer.
    Container(
      width: 300.0,
      height: 250.0,
      decoration: {
        color: 0xFFFFFF00,
        // New parameter.
        type: "box",
        borderRadius:
          [
            // The 4 values are topStart, topEnd, bottomStart, bottomEnd.
            // The x value is always the horizontal border, and the y value is always the vertical border. This may not be intuitive, as it makes left and right corners a mirror image of each other if x and y have the same values for each corner, as below.
            // If there is only one map it will be used for all four corners.
            // The y argument is optional. If it is not given then the x value will be used for both, making the radius a circular one.
            {x: 50.0, y: 10.0},
            {x: 50.0, y: 10.0},
            {x: 50.0, y: 10.0},
            {x: 50.0, y: 10.0},
          ],
        border: [
          {
            color: 0xFFF37533,
            width: 3.0,
          },
        ],
      },
      padding: [16.0,10.0,6.0,10.0,], // Padding is just four doubles. The order is LTRB.
      child: Text(
        text: ["Hello World"], // The text parameter is named, and is a list of strings.
        textDirection: "ltr",
        // The style parameter is a map. The keys TextStyle parameters. Note the values like color are still used without the Color or Colors constructors.
        style: {
          'color': 0xFF00FF00,
          'fontSize': 24.0,
        },
      ),
    ),
  ],
)
  )''');
  ValueNotifier<String> get rfwString => _rfwString;

  /// The index of the widget currently displayed by RFW
  final ValueNotifier<String> _currentWidget = ValueNotifier<String>('Gradient');
  ValueNotifier<String> get currentWidget => _currentWidget;

  // The most recent text response from the model. Used to display the most recent response in the large font, [SelectableText] in the middle of the screen.
  final ValueNotifier<String> _latestResponseFromModel = ValueNotifier<String>('');
  ValueNotifier<String> get latestResponseFromModel => _latestResponseFromModel;

  // For text-only input, use the gemini-pro model
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  /// The chat needs to be initialized with one message from each side to get
  /// it kicked off. You provide these, but they don't get displayed.
  void initChat() {
    updateChatHistory(
        who: 'user',
        latestMessage: LocalChatParameters.initializingPrompt +
            LocalChatParameters.rfw_examples +
            LocalChatParameters.coreWidgetsDocs +
            LocalChatParameters.selectedClassesSourceCode);
    updateChatHistory(who: 'model', latestMessage: "Sounds good. I'll do my best.");
  }

  /// Handled changing the current widget on a command from Gemini.
  // TODO: Refactor this to use a String from Gemini instead of a simplistic swap command.
  void swapCurrentWidget() {
    if (_currentWidget.value == 'TestConfig') {
      _currentWidget.value = 'TestLibraryWidget';
    } else {
      _currentWidget.value = 'TestConfig';
    }
  }

  /// Process a Remote Flutter Widgets command
  void processRFW(String response) {
    debugPrint('_processRFW() called LocalChat line 105');
    // Remove "RFWEXEC: From the front of the text string.
    final newString = response.substring(8, response.length);
    debugPrint('processRFW called with $newString');
    _rfwString.value = newString;
  }

  /// Update the chat history.
  void updateChatHistory({required String who, required String latestMessage}) {
    debugPrint('_updateChatHistory() called LocalChat line 185');
    if (who == 'user') {
      chatHistoryContent.add(Content.text(latestMessage));
      messageHistory.add(CustomChatMessage(who: 'user', message: latestMessage));
    } else {
      chatHistoryContent.add(
        Content.model([TextPart(latestMessage)]),
      );
    }
  }
}

/// Represents a single message sent by either the user or the AI.
class CustomChatMessage {
  CustomChatMessage({
    required this.who,
    required this.message,
  });

  /// Who the text message was from.
  String who;

  /// What the text message was.
  String message;
}
