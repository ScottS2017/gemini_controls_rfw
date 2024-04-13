import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:gemini_controls_rfw/data/available_widget_library.dart';
import 'package:gemini_controls_rfw/data/local_chat_parameters.dart';
import 'package:gemini_controls_rfw/data/widget_config_values.dart';
import 'package:gemini_controls_rfw/features/app/app.dart';
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

  static const LibraryName localName = LibraryName(<String>['local']);
  static const LibraryName remoteName = LibraryName(<String>['remote']);

  void _handleSubmit() {
    debugPrint('_handleSubmit() called Home line 37');
    // If we don't have a response from the previous message yet, don't do anything because there will be an error if Gemini gets a List<Content> that contains two messages in a row from either the user or itself.
    if (gemini.awaitingResponse) return;
    setState(() {
      // Process the prompt, then change the value of [_futureResponse], which triggers the [FutureBuilder].
      _futureResponse = gemini.processSend(prompt: _inputController.text);
      _inputController.clear();
      // Set focus back to input field.
      _inputFieldFocusNode.requestFocus();
    });
  }

  /// Handles changing the widgets.
  void _update() {
    debugPrint('_update() called HomeScreen line 50');
    _runtime.update(localName, AvailableWidgetLibrary.availableLocalWidgets());
    _runtime.update(remoteName, parseLibraryFile(widgets[gemini.currentWidget.value]!));
    // TODO Implement the ability of the app to use the string provided by Gemini instead of using a map or any other pre-set string that is client-side. Use the following method call:
    // _runtime.update(remoteName, parseLibraryFile(NAME_OF_GEMINI_RETURNED_WIDGET_STRING));
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Section: Input field.
                  Expanded(
                    child: TextField(
                      controller: _inputController,
                      focusNode: _inputFieldFocusNode,
                      onSubmitted: (_) => _handleSubmit(),
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
                ],
              ),
              verticalMargin16,
              // SECTION: RFW Widget.
              SizedBox(
                width: 500.0,
                height: 100.0,
                child: ValueListenableBuilder(
                    valueListenable: gemini.currentWidget,
                    builder: (BuildContext context, String value, _) {
                      if (currentWidgetValue != gemini.currentWidget.value) {
                        currentWidgetValue = gemini.currentWidget.value;
                        _update();
                      }
                      return RemoteWidget(
                        runtime: _runtime,
                        data: _data,
                        widget: const FullyQualifiedWidgetName(remoteName, 'root'),
                        onEvent: (String name, DynamicMap arguments) {
                          debugPrint('user triggered event "$name" with data: $arguments');
                        },
                      );
                    }),
              ),
              verticalMargin16,
              // SECTION: Swap RFW Widget Button.
              ElevatedButton(
                onPressed: () {
                  gemini.swapCurrentWidget();
                },
                child: const SizedBox(
                  height: 50.0,
                  width: 150.0,
                  child: Center(
                    child: Text('Swap the RFW Widget'),
                  ),
                ),
              ),
              verticalMargin16,
              // SECTION: FutureBuilder.
              FutureBuilder<void>(
                future: _futureResponse,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    // Section: Most recent message from the model.
                    return Expanded(
                      flex: 3,
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
                      width: 300.0,
                      height: 300.0,
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
