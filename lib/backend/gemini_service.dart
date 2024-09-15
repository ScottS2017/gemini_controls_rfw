import 'package:flutter/foundation.dart' show ValueNotifier, debugPrint;
import 'package:gemini_controls_rfw/backend/api_key.dart';
import 'package:gemini_controls_rfw/data/initial_widget.dart';
import 'package:gemini_controls_rfw/data/prompts/local_chat_parameters.dart';
import 'package:gemini_controls_rfw/data/prompts/reminders.dart';
import 'package:gemini_controls_rfw/data/prompts/rfw_sample_widgets.dart';
import 'package:gemini_controls_rfw/models/gemini_chat.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// Handles communication with Gemini and processes results.
class GeminiService {

  /// Used to prevent a second message from being sent by the user before
  /// a response to the previous message has been received.
  bool awaitingResponse = false;

  /// The most recent text response from the model. Used to display the most recent response in the large font, [SelectableText] in the middle of the screen.
  final ValueNotifier<String> _latestResponseFromModel = ValueNotifier<String>('');
  ValueNotifier<String> get latestResponseFromModel => _latestResponseFromModel;

  /// An instance of the gemini-pro model.
  final _model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: apiKey,
    generationConfig: GenerationConfig(
      // Not used.
      // stopSequences: ["red"],
      // Set an absurdly high limit to ensure the UI code isn't cut off.
      maxOutputTokens: 20000,
      // Lower temp from 0.9 to prevent "creative" replies because we need consistency in the generated RFW code.
      temperature: 0.1,
      topP: 0.1,
      topK: 16,
    ),
  );

  /// This is the widget tree sent from RFW.
  final ValueNotifier<String> _rfwString =
      ValueNotifier<String>(initializingRfwWidget);
  ValueNotifier<String> get rfwString => _rfwString;

  /// Processes submission.
  Future<void> handleSubmit({
    required String userInput,
    required GeminiChat gemini,
    required GeminiService geminiService,
  }) {
    awaitingResponse = true;
    Future<void>? result;
    result = _processSend(gemini: gemini, prompt: userInput, geminiService: geminiService);
    awaitingResponse = false;
    return result;
  }

  /// Processes the outgoing messages.
  Future<void> _processSend({
    required GeminiChat gemini,
    required String prompt,
    required GeminiService geminiService,
  }) async {
    // Workaround for the fact that the LLM keeps forgetting to use a type parameter in decorations.
    const dontForgetType = "When using a decoration, make sure to include the type parameter.";
    var messageToSend = LocalChatParameters.introBlurb +
        RfwMasterKey.allWidgets() + Reminders.allReminders + dontForgetType;
    // Add the current chat message from the user to the list of the google_generative_ai [Content] objects.
    gemini.updateChatHistory(who: 'user', latestMessage: prompt + dontForgetType );
    // Create a list of [Content] with current active chat history and all messages before it.
    List<Content> content = [Content.text(messageToSend)] + gemini.chatHistoryContent;
    // Declare a response object.
    GenerateContentResponse response;
    try {
      // Get the response.
      response = await _model.generateContent(content);
      // Send the response to be processed.
      _processReceive(gemini: gemini, response: response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Processes the incoming messages.
  void _processReceive({
    required GeminiChat gemini,
    required GenerateContentResponse response,
  }) {
    debugPrint('_processReceive() called LocalChat line 151');
    // Create a variable for the model's [TextPart] response. This is _not_ the text itself. It is an object that extends [Part]. The [Content] contains [Part] objects and it does not differentiate between [TextPart] and [DataPart], so we need to cast this as a [TextPart] before we can use it.
    final resultantTextPart = response.candidates.last.content.parts[0] as TextPart;
    // Now that it's been cast, the text can be extracted from it.
    final responseText = resultantTextPart.text;

    // Add the response message from the user to the list of the google_generative_ai [Content] objects.
    gemini.updateChatHistory(who: 'model', latestMessage: responseText);
    _latestResponseFromModel.value = responseText;
    debugPrint('Response was: $responseText');
    // Does the message start with the code for an RFW Command?
    if (responseText.contains('RFWEXEC')) {
      debugPrint('Processed as RFW command');
      _processRFW(gemini: gemini, response: responseText);
    } else {
      debugPrint('Should be displaying text');
      // Display this text in the box that shows the latest message from Gemini.
      _latestResponseFromModel.value = responseText;
    }
  }

  /// Process a Remote Flutter Widgets command
  void _processRFW({
    required GeminiChat gemini,
    required String response,
  }) {
    debugPrint('_processRFW input string:\n$response\n\n');
    // Remove "RFWEXEC: From the front of the text string.
    var result = '';
    int cutLocation = response.indexOf('RFWEXEC');
    int cutOutTo = cutLocation + 8;
    String frontTrimmed = response.replaceRange(0, cutOutTo, '');
    debugPrint('frontTrimmed string is:\n$frontTrimmed\n\n');
    // Sometimes Gemini adds code ticks (```). Remove them if necessary.
    if(frontTrimmed.contains('```')) {
      cutLocation = frontTrimmed.indexOf('```');
      debugPrint('FIRST ``` IS AT $cutLocation');
      // TODO regex with global search
      cutOutTo = cutLocation + 4;
      String frontTicksRemoved = frontTrimmed.replaceRange(0, cutLocation + 4, '');
      debugPrint('Front ticks were removed:\n$frontTicksRemoved\n\n');
      cutLocation = frontTicksRemoved.indexOf('```');
      debugPrint('SECOND ``` IS AT $cutLocation');
      String backTicksRemoved = frontTicksRemoved.replaceRange(frontTicksRemoved.length - 4, frontTicksRemoved.length, '');
      debugPrint('Back ticks were removed:\n$backTicksRemoved\n\n');
      result = backTicksRemoved;
    } else {
      result = frontTrimmed;
    }
    debugPrint('processRFW changed _rfwString.value to\n$result\n\n');
    _rfwString.value = result;
  }
}
