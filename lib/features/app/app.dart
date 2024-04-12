import 'package:flutter/material.dart';
import 'package:gemini_controls_rfw/data/local_chat_parameters.dart';
import 'package:gemini_controls_rfw/features/home_screen/home_screen.dart';
import 'package:gemini_controls_rfw/models/local_chat.dart';
import 'package:rfw/formats.dart' show parseLibraryFile;
import 'package:rfw/rfw.dart';

/// The foundation widget for the app. It also exposes certain items via the
/// app's [BuildContext] using [findAncestorStateOfType]. Each of those
/// items will have a corresponding "Of" method, IE: [providedLocalChatOf].
class App extends StatefulWidget {
  const App({super.key});
  static LocalChat providedLocalChatOf(BuildContext context) {
    final AppState state = context.findAncestorStateOfType<AppState>()!;
    return state._providedLocalChat;
  }

  @override
  AppState createState() => AppState();
}

/// The [State] object for [AppState].
class AppState extends State<App> {

  /// Used as part of exposing a singleton [LocalChat] object via
  /// [BuildContext].
  late LocalChat _providedLocalChat;

  @override
  void initState() {
    super.initState();
    _providedLocalChat =  LocalChat(
      name: LocalChatParameters.modelName,
      personality: LocalChatParameters.modelPersonality,
      situation: LocalChatParameters.modelSituation,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gemini Controls RFW',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(title: 'Gemini Controls RFW'),

    );
  }
}