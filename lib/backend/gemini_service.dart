import 'package:flutter/foundation.dart' show ValueNotifier, debugPrint;
import 'package:gemini_controls_rfw/backend/api_key.dart';
import 'package:gemini_controls_rfw/data/initial_widget.dart';
import 'package:gemini_controls_rfw/data/local_chat_parameters.dart';
import 'package:gemini_controls_rfw/models/local_chat.dart';
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
  final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: apiKey,
    generationConfig: GenerationConfig(
      // Not used.
      // stopSequences: ["red"],
      // Set an absurdly high limit to ensure the UI code isn't cut off.
      maxOutputTokens: 10000,
      // Lower temp from 0.9 to prevent "creative" replies because we need consistency in the generated RFW code.
      temperature: 0.5,
      topP: 0.1,
      topK: 16,
    ),
  );

  /// This is the widget tree sent from RFW.
  final ValueNotifier<String> _rfwString =
      ValueNotifier<String>(initializingRfwWidget);
  ValueNotifier<String> get rfwString => _rfwString;

  /// Processes submission.
  // TODO: Decide if this is needed. It can be tested, but without any other functionality it may be able to be refactored out.
  Future<void> handleSubmit({
    required String userInput,
    required LocalChat gemini,
    required GeminiService geminiService,
  }) {
    awaitingResponse = true;
    Future<void>? result;
    result = processSend(gemini: gemini, prompt: userInput, geminiService: geminiService);
    awaitingResponse = false;
    return result;
  }

  /// Processes the outgoing messages.
  Future<void> processSend({
    required LocalChat gemini,
    required String prompt,
    required GeminiService geminiService,
  }) async {
    // Workaround for the fact that the LLM keeps forgetting to use a type parameter in decorations.
    const dontForgetType = "When using a decoration, make sure to include the type parameter.";
    // Add the current chat message from the user to the list of the google_generative_ai [Content] objects.
    gemini.updateChatHistory(who: 'user', latestMessage: prompt + dontForgetType );
    // Create a list of [Content] with current active chat history and all messages before it.
    List<Content> content = gemini.chatHistoryContent;
    // Declare a response object.
    GenerateContentResponse response;
    try {
      response = await model.generateContent(content);
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
    if (responseText.contains('RFWEXEC')) {
      debugPrint('Processed as RFW command');
      processRFW(gemini: gemini, response: responseText);
    } else {
      debugPrint('Should be displaying text');
      // Display this text in the box that shows the latest message from Gemini.
      latestResponseFromModel.value = responseText;
    }
  }

  /// Process a Remote Flutter Widgets command
  void processRFW({
    required LocalChat gemini,
    required String response,
  }) {
    // Remove "RFWEXEC: From the front of the text string.
    // FIXME erroring if a good widget is sent.  Out of range error.
    var result = '';
    final execLocation = response.indexOf('RFWEXEC');
    final cutOutTo = execLocation + 8;
    final frontTrimmed = response.replaceRange(0, cutOutTo, '');
    if(frontTrimmed.contains('```')) {
      final ticksLocation = frontTrimmed.indexOf('```');
      result = frontTrimmed.replaceRange(ticksLocation, frontTrimmed.length, '');
    } else {
      result = frontTrimmed;
    }
    debugPrint('processRFW called with\n$result');
    rfwString.value = result;
  }
}
