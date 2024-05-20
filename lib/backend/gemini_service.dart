import 'package:gemini_controls_rfw/models/local_chat.dart';

class GeminiService {

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
