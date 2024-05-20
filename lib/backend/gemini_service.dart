import 'package:flutter/foundation.dart' show debugPrint;
import 'package:gemini_controls_rfw/models/local_chat.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// Handles communication with Gemini and processes results.
class GeminiService {
  /// Processes submission.
  // TODO: Decide if this is needed. It can be tested, but without any other functionality it may be able to be refactored out.
  Future<void> handleSubmit({
    // SECTION new handleSubmit working.
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
    GenerateContentResponse
        response; // Send the current list of [Content] (with the last user message) to the AI in the cloud.
    try {
      response = await gemini.model.generateContent(content);
      gemini.processReceive(response: response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
