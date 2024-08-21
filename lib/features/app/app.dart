import 'package:flutter/material.dart';
import 'package:gemini_controls_rfw/backend/gemini_service.dart';
import 'package:gemini_controls_rfw/data/local_chat_parameters.dart';
import 'package:gemini_controls_rfw/experiments/brainstorming_experiments.dart';
import 'package:gemini_controls_rfw/features/home_screen/home_screen.dart';
import 'package:gemini_controls_rfw/models/local_chat.dart';

/// The foundation widget for the app. It also exposes certain items via the
/// app's [BuildContext] using [findAncestorStateOfType]. Each of those
/// items will have a corresponding "Of" method, IE: [providedGeminiChatOf].
class App extends StatefulWidget {
  const App({super.key});

  /// A method that returns a singleton [LocalChat] object, providing it to
  /// the entire app via the context.
  static GeminiChat providedGeminiChatOf(BuildContext context) {
    final AppState state = context.findAncestorStateOfType<AppState>()!;
    return state._providedGeminiChat;
  }

  /// A method that returns a singleton [GeminiService] object, providing it to
  /// the entire app via the context.
  static GeminiService providedGeminiServiceOf(BuildContext context) {
    final AppState state = context.findAncestorStateOfType<AppState>()!;
    return state._providedGeminiService;
  }

  @override
  AppState createState() => AppState();
}

/// The [State] object for [AppState].
class AppState extends State<App> {
  /// The singleton [LocalChat] object returned by
  /// [widget.providedGeminiChatOf].
  late GeminiChat _providedGeminiChat;

  /// The singleton [GeminiService] object returned by
  /// [widget.providedGeminiServiceOf].
  late GeminiService _providedGeminiService;

  /// Initializes the [State].
  @override
  void initState() {
    super.initState();
    _providedGeminiService = GeminiService();
    _providedGeminiChat = GeminiChat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini Controls RFW',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Gemini Controls RFW'),
      // home: const Material(child: Experiments()),
    );
  }
}
