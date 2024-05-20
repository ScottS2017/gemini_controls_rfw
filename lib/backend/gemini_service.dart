import 'package:gemini_controls_rfw/models/local_chat.dart';

/// Handles communication with Gemini and processes results.
class GeminiService {
  /// Processes submission.
  // TODO: Decide if this is needed. It can be tested, but without any other functionality it may be able to be refactored out.
  static Future<void> handleSubmit({
    // SECTION new handleSubmit working.
    required String userInput,
    required LocalChat gemini,
  }) {
    Future<void>? result;
    result = gemini.processSend(prompt: userInput);
    return result;
  }
}
