import 'package:flutter/foundation.dart' show ValueNotifier, debugPrint;
import 'package:gemini_controls_rfw/data/local_chat_parameters.dart';
import 'package:gemini_controls_rfw/models/local_chat.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// Handles communication with Gemini and processes results.
class GeminiService {

  /// This is the widget tree shown on app initialization.
final ValueNotifier<String> _rfwString = ValueNotifier<String>(LocalChatParameters.initialRfwString);
  ValueNotifier<String> get rfwString => _rfwString;

  /// Processes submission.
  // TODO: Decide if this is needed. It can be tested, but without any other functionality it may be able to be refactored out.
  Future<void> handleSubmit({
    required String userInput,
    required LocalChat gemini,
    required GeminiService geminiService,
  }) {
    gemini.awaitingResponse = true;
    Future<void>? result;
    result = processSend(gemini: gemini, prompt: userInput, geminiService: geminiService);
    gemini.awaitingResponse = false;
    return result;
  }

  /// Processes the outgoing messages.
  Future<void> processSend({
    required LocalChat gemini,
    required String prompt,
    required GeminiService geminiService,
  }) async {
    // Add the current chat message from the user to the list of the google_generative_ai [Content] objects.
    gemini.updateChatHistory(who: 'user', latestMessage: prompt);
    // Create a list of [Content] with current active chat history and all messages before it.
    List<Content> content = gemini.chatHistoryContent;
    // Declare a response object.
    GenerateContentResponse response;
    try {
      response = await gemini.model.generateContent(content);
      processReceive(gemini: gemini, response: response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Processes the incoming messages.
  void processReceive({
    required LocalChat gemini,
    required GenerateContentResponse response,
  }) {
    debugPrint('_processReceive() called LocalChat line 151');
    // Create a variable for the model's [TextPart] response. This is _not_ the text itself. It is an object that extends [Part]. The [Content] contains [Part] objects and it does not differentiate between [TextPart] and [DataPart], so we need to cast this as a [TextPart] before we can use it.
    final resultantTextPart = response.candidates.last.content.parts[0] as TextPart;
    // Now that it's been cast, the text can be extracted from it.
    final responseText = resultantTextPart.text;

    // Add the response message from the user to the list of the google_generative_ai [Content] objects.
    gemini.updateChatHistory(who: 'model', latestMessage: responseText);
    debugPrint('Response was: $responseText');
    // Does the message start with the code for an RFW Command?
    if (responseText.startsWith('RFWEXEC:')) {
      debugPrint('Processed as RFW command');
      processRFW(gemini: gemini,  response: responseText);
    } else {
      debugPrint('Should be displaying text');
      // Display this text in the box that shows the latest message from Gemini.
      gemini.latestResponseFromModel.value = responseText;
    }
  }

  /// Process a Remote Flutter Widgets command
  void processRFW({
    required LocalChat gemini,
    required String response,
  }) {
    debugPrint('_processRFW() called LocalChat line 105');
    // Remove "RFWEXEC: From the front of the text string.
    final newString = response.substring(8, response.length);
    debugPrint('processRFW called with $newString');
    rfwString.value = newString;
  }
}
