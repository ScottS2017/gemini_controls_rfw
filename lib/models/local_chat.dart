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

  /// The index of the widget currently displayed by RFW
  final ValueNotifier<String> _currentWidget = ValueNotifier<String>('Gradient');
  ValueNotifier<String> get currentWidget => _currentWidget;

  // The most recent text response from the model. Used to display the most recent response in the large font, [SelectableText] in the middle of the screen.
  final ValueNotifier<String> _latestResponseFromModel = ValueNotifier<String>('');
  ValueNotifier<String> get latestResponseFromModel => _latestResponseFromModel;

  // For text-only input, use the gemini-pro model
  final _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  /// The chat needs to be initialized with one message from each side to get
  /// it kicked off. You provide these, but they don't get displayed.
  void initChat() {
    _updateChatHistory(who: 'user', latestMessage: LocalChatParameters.initializingPrompt);
    _updateChatHistory(who: 'model', latestMessage: "Sounds good. I'll do my best.");
  }

  /// Handled changing the current widget on a command from Gemini.
  // TODO: Refactor this to use a String from Gemini instead of a simplistic swap command.
  void swapCurrentWidget() {
    if (_currentWidget.value == 'Gradient') {
      _currentWidget.value = 'Hello';
    } else {
      _currentWidget.value = 'Gradient';
    }
  }

  /// Processes the outgoing messages.
  Future<void> processSend({required String prompt}) async {
    debugPrint('processSend() called LocalChat line 64');
    // A message is in progress, prevent another from being sent.
    awaitingResponse = true;

    // Add the current chat message from the user to the list of the google_generative_ai [Content] objects.
    _updateChatHistory(who: 'user', latestMessage: prompt);
    // Create a list of [Content] with current active chat history and all messages before it.
    List<Content> content = chatHistoryContent;
    // Declare a response object.
    GenerateContentResponse
        response; // Send the current list of [Content] (with the last user message) to the AI in the cloud.
    try {
      response = await _model.generateContent(content);
      _processReceive(response: response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Processes the incoming messages.
  void _processReceive({required GenerateContentResponse response}) {
    debugPrint('_processReceive() called LocalChat line 84');
    // Create a variable for the model's [TextPart] response. This is _not_ the text itself. It is an object that extends [Part]. The [Content] contains [Part] objects and it does not differentiate between [TextPart] and [DataPart], so we need to cast this as a [TextPart] before we can use it.
    final resultantTextPart = response.candidates.last.content.parts[0] as TextPart;
    // Now that it's been cast, the text can be extracted from it.
    final responseText = resultantTextPart.text;
    // Processing has finished, now it's safe to allow a new message to be sent.
    awaitingResponse = false;
    // Add the response message from the user to the list of the google_generative_ai [Content] objects.
    _updateChatHistory(who: 'model', latestMessage: responseText);
    debugPrint('Response was: $responseText');
    // Does the message start with the code for an RFW Command?
    if (responseText.startsWith('RFWEXEC')) {
      debugPrint('Processed as RFW command');
      _processRFW(responseText);
    } else {
      debugPrint('Should be displaying text');
      // Display this text in the box that shows the latest message from Gemini.
      _latestResponseFromModel.value = responseText;
    }
  }

  /// Process a Remote Flutter Widgets command
  void _processRFW(String response) {
    debugPrint('_processRFW() called LocalChat line 105');
    // Remove "RFWEXEC: From the front of the text string.
    final rfwString = response.substring(8, response.length);
    debugPrint('processRFW called with $rfwString');
    _currentWidget.value = rfwString;
  }

  /// Update the chat history.
  void _updateChatHistory({required String who, required String latestMessage}) {
    debugPrint('_updateChatHistory() called LocalChat line 112');
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

  /// Whe the text message was from.
  String who;

  /// What the text message was.
  String message;
}
