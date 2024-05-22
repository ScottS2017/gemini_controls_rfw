import 'package:gemini_controls_rfw/data/local_chat_parameters.dart';
import 'package:gemini_controls_rfw/data/rfw_core_widgets.dart';
import 'package:gemini_controls_rfw/data/rfw_rules.dart';
import 'package:gemini_controls_rfw/models/custom_chat_message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

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

  /// The chat needs to be initialized with one message from each side to get
  /// it kicked off. You provide these, but they don't get displayed.
  void initChat() {
    updateChatHistory(
        who: 'user',
        latestMessage: LocalChatParameters.initializingPrompt +
            LocalChatParameters.rfw_examples +
            LocalChatParameters.coreWidgetsDocs +
            LocalChatParameters.selectedClassesSourceCode +
            RfwCoreWidgets.availableCoreWidgets + RfwRules.allRules() + RfwCoreWidgets.allCoreWidgets());
    updateChatHistory(who: 'model', latestMessage: "Sounds good. I'll do my best.");
  }

  /// Update the chat history.
  void updateChatHistory({required String who, required String latestMessage}) {
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
