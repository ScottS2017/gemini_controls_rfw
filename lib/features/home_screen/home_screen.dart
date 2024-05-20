import 'package:flutter/cupertino.dart';
import 'package:gemini_controls_rfw/backend/gemini_service.dart';
import 'package:gemini_controls_rfw/data/available_widget_library.dart';
import 'package:gemini_controls_rfw/data/widget_config_values.dart';
import 'package:gemini_controls_rfw/features/app/app.dart';
import 'package:gemini_controls_rfw/features/test_screen/test_screen.dart';
import 'package:gemini_controls_rfw/models/local_chat.dart';
import 'package:gemini_controls_rfw/utils/spacing_constants.dart';
import 'package:rfw/formats.dart' show parseLibraryFile;
import 'package:rfw/rfw.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Runtime _runtime = Runtime();
  final DynamicContent _data = DynamicContent();
  late LocalChat gemini;
  final _inputController = TextEditingController();
  final _inputFieldFocusNode = FocusNode();
  // FIXME currentWidgetValue is a workaround for the ValueListenableBuilder not rebuilding. Fix me.
  String currentWidgetValue = '';

  // The future used the the UI's [FutureBuilder].
  Future<void>? _futureResponse;

  static const LibraryName materialLibraryName = LibraryName(<String>['material', 'widgets']);
  static const LibraryName coreLibraryName = LibraryName(<String>['core', 'widgets']);
  static const LibraryName localLibraryName = LibraryName(<String>['local']);
  static const LibraryName remoteLibraryName = LibraryName(<String>['remote']);

  void _handleSubmit() {
    setState(() {
      // Process the prompt, then change the value of [_futureResponse], which triggers the [FutureBuilder].
      // SECTION DONE TO HERE.
      _futureResponse = GeminiService.handleSubmit(userInput: _inputController.text, gemini: gemini);
      _inputController.clear();
      // Set focus back to input field.
      _inputFieldFocusNode.requestFocus();
    });
  }

  /// Handles changing the widgets.
  void _update() {
    _runtime.update(materialLibraryName, createMaterialWidgets());
    _runtime.update(coreLibraryName, createCoreWidgets());
    _runtime.update(localLibraryName, AvailableWidgetLibraries.localWidgetLibrary());
    // _runtime.update(remoteLibraryName, parseLibraryFile(widgets[gemini.currentWidget.value]!));
    _runtime.update(remoteLibraryName,
        parseLibraryFile('import core.widgets; widget root = ${gemini.rfwString.value};'));
  }

  /// Used with hot reloads/restarts. This function has no effect in production.
  @override
  void reassemble() {
    super.reassemble();
    _update();
  }

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
                  // Section: Input field.
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
                  // SECTION: Reset Button.
                  ElevatedButton(
                    onPressed: () {
                      gemini.chatHistoryContent
                          .removeRange(1, gemini.chatHistoryContent.length - 1);
                      gemini.messageHistory.removeRange(1, gemini.messageHistory.length - 1);
                    },
                    child: const SizedBox(
                      height: 50.0,
                      width: 150.0,
                      child: Center(
                        child: Text('Reset the Context'),
                      ),
                    ),
                  ),
                  horizontalMargin8,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestScreen(),
                        ),
                      );
                    },
                    child: const SizedBox(
                      height: 50.0,
                      width: 100.0,
                      child: Center(
                        child: Text('Test Screen'),
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
                    return const SizedBox(
                      width: double.infinity,
                      height: 200.0,
                      child: Placeholder(),
                    );
                    // return const CircularProgressIndicator();
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
