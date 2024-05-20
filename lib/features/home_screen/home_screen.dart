import 'package:gemini_controls_rfw/backend/gemini_service.dart';
import 'package:gemini_controls_rfw/features/app/app.dart';
import 'package:gemini_controls_rfw/models/local_chat.dart';
import 'package:gemini_controls_rfw/utils/spacing_constants.dart';
import 'package:rfw/formats.dart' show parseLibraryFile;
import 'package:rfw/rfw.dart';
import 'package:flutter/material.dart';

/// The main screen of the app.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  /// Title string for use in the [AppBar].
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  /// Contains the logic that builds and maintains Remote Flutter Widgets.
  final Runtime _runtime = Runtime();

  /// Configuration data from the remote widgets.
  final DynamicContent _data = DynamicContent();

  /// An individual chat, with a personality, situation, and chat history.
  late LocalChat gemini;

  final _inputController = TextEditingController();
  final _inputFieldFocusNode = FocusNode();
  // FIXME currentWidgetValue is a workaround for the ValueListenableBuilder not rebuilding. Fix me.
  String currentWidgetValue = '';

  // The future used the the UI's [FutureBuilder].
  Future<void>? _futureResponse;

  /// The widget library of material widgets.
  static const LibraryName materialLibraryName = LibraryName(<String>['material', 'widgets']);

  /// The widget library of core widgets.
  static const LibraryName coreLibraryName = LibraryName(<String>['core', 'widgets']);

  /// The widget library of local custom widgets.
  static const LibraryName localLibraryName = LibraryName(<String>['local']);

  /// The widget library of local custom widgets.
  static const LibraryName remoteLibraryName = LibraryName(<String>['remote']);

  // Sends the input to [GeminiService] and updates the [FutureBuilder]'s future.
  void _handleSubmit() {
    // SECTION _handleSubmit() refactor complete.
    setState(() {
      // Process the prompt and use the return for the [FutureBuilder] in the widget tree.
      _futureResponse = GeminiService.handleSubmit(userInput: _inputController.text, gemini: gemini);
      // Set focus back to the input field for the next input, then clear the text.
      _inputFieldFocusNode.requestFocus();
      _inputController.clear();
    });
  }

  // Handles changing the widgets.
  void _update() {
    _runtime.update(materialLibraryName, createMaterialWidgets());
    _runtime.update(coreLibraryName, createCoreWidgets());
    _runtime.update(remoteLibraryName,
        parseLibraryFile('import core.widgets; widget root = ${gemini.rfwString.value};'));
  }

  /// Used with hot reloads/restarts. This function has no effect in production.
  @override
  void reassemble() {
    super.reassemble();
    _update();
  }

  /// Initializes this widget's [State].
  @override
  void initState() {
    super.initState();
    gemini = App.providedLocalChatOf(context);
    gemini.initChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: allPadding16,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SECTION: Text Input.
                  Expanded(
                    child: TextField(
                      controller: _inputController,
                      focusNode: _inputFieldFocusNode,
                      onSubmitted: (_) {
                        if (gemini.awaitingResponse) return;
                        _handleSubmit();
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Me:',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  horizontalMargin16,
                  // SECTION: Reset Context Button.
                  ElevatedButton(
                    onPressed: () {
                      gemini.chatHistoryContent
                          .removeRange(1, gemini.chatHistoryContent.length - 1);
                      gemini.messageHistory.removeRange(1, gemini.messageHistory.length - 1);
                    },
                    child: const SizedBox(
                      height: 50.0,
                      width: 80.0,
                      child: Center(
                        child: Text('Reset the Context',
                        textAlign: TextAlign.center,),
                      ),
                    ),
                  ),

                ],
              ),
              verticalMargin16,
              // SECTION: RFW Widget.
              ValueListenableBuilder(
                  valueListenable: gemini.rfwString,
                  builder: (BuildContext context, String value, _) {
                    if (currentWidgetValue != gemini.rfwString.value) {
                      currentWidgetValue = gemini.rfwString.value;
                      _update();
                    }
                    return Center(
                      child: RemoteWidget(
                        runtime: _runtime,
                        data: _data,
                        widget: const FullyQualifiedWidgetName(remoteLibraryName, 'root'),
                        onEvent: (String name, DynamicMap arguments) {
                          debugPrint('user triggered event "$name" with data: $arguments');
                        },
                      ),
                    );
                  }),
              const Spacer(),
              // SECTION: FutureBuilder.
              FutureBuilder<void>(
                future: _futureResponse,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    // Section: Most recent message from the model.
                    return SizedBox(
                      width: double.infinity,
                      height: 200.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          child: SingleChildScrollView(
                            // Rebuilds on an updated response from the model.
                            child: ValueListenableBuilder<String>(
                                valueListenable: gemini.latestResponseFromModel,
                                builder: (BuildContext context, String value, _) {
                                  return SelectableText(
                                    gemini.latestResponseFromModel.value ?? '',
                                    maxLines: 1000,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    );
                  } else {
                    // TODO: Replace placeholder with something permanent.
                    return const SizedBox(
                      width: double.infinity,
                      height: 200.0,
                      child: Placeholder(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
