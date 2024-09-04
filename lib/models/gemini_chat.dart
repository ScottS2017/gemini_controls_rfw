import 'package:gemini_controls_rfw/data/prompts/local_chat_parameters.dart';
import 'package:gemini_controls_rfw/data/prompts/reminders.dart';
import 'package:gemini_controls_rfw/data/prompts/rfw_sample_widgets.dart';
import 'package:gemini_controls_rfw/models/custom_chat_message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// An individual chat, with a personality, situation, and chat history.
class GeminiChat {

  /// A list that holds the history of text only messages.
  final _messageHistory = <CustomChatMessage>[];

  /// The chat history of this chat.
  final chatHistoryContent = <Content>[];

  /// Counter to tell when to resend the examples.
  int _messagesSent = 1;

  String systemPrompt =  LocalChatParameters.introBlurb +
      RfwMasterKey.allWidgets() + Reminders.allReminders;

  /// The chat needs to be initialized with one message from each side to get
  /// it kicked off. You provide these, but they don't get displayed.
  void initChat() {
    updateChatHistory(
        who: 'user',
        latestMessage: systemPrompt);
    updateChatHistory(who: 'model', latestMessage: "Sounds good. I'll do my best.");
  }

  /// Update the chat history.
  // FIXME find another way to keep the prompt updated with the widget info. This is wasteful.
  void updateChatHistory({required String who, required String latestMessage}) {
    _messagesSent += 1;
    if (who == 'user') {
      if(_messagesSent % 25 == 0){
        var messageToSend = LocalChatParameters.introBlurb +
            RfwMasterKey.allWidgets() + latestMessage + Reminders.allReminders;
        chatHistoryContent.add(Content.text(messageToSend));
        _messageHistory.add(CustomChatMessage(who: 'user', message: messageToSend));
      } else {
        chatHistoryContent.add(Content.text(latestMessage));
        _messageHistory.add(CustomChatMessage(who: 'user', message: latestMessage));
      }
    } else {
      chatHistoryContent.add(
        Content.model([TextPart(latestMessage)]),
      );
    }
  }
}
