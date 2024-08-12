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
  late LocalChat _gemini;

  /// The [GeminiService] singleton provided via the context.
  late GeminiService _geminiService;

  final _inputController = TextEditingController();
  final _inputFieldFocusNode = FocusNode();

  // Used to determine if the RFW widget has changed, if so call update().
  String _currentWidgetValue = '';

  // The width and height of the outer border surrounding the working area.
  final double _width = 1080.0;
  final double _height = 900.0;

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

  bool _useAnAppBar = true;

  Color _appBarColor = const Color(0xFF800080);

  String _appBarText = '1';

  // Sends the input to [GeminiService] and updates [_futureResponse].
  void _handleSubmit(String input) {
    setState(() {
      // Process the prompt.
      _futureResponse = _geminiService.handleSubmit(
          userInput: input, gemini: _gemini, geminiService: _geminiService);
      // Set focus back to the input field for the next input, then clear the text.
      _inputFieldFocusNode.requestFocus();
      _inputController.clear();
    });
  }

  void _undoToLastWidget() {
    setState(() {
      // Process the prompt.
      _futureResponse = _geminiService.handleSubmit(
          userInput: _geminiService.undoWidget, gemini: _gemini, geminiService: _geminiService);
      // Set focus back to the input field for the next input, then clear the text.
      _inputFieldFocusNode.requestFocus();
      _inputController.clear();
    });
  }

  // Handles changing the widgets.
  void _update() {
    _runtime.update(coreLibraryName, createCoreWidgets());
    _runtime.update(materialLibraryName, createMaterialWidgets());
    var rfwStringFromGemini = _geminiService.rfwString.value;
    _runtime.update(
        remoteLibraryName,
        // parseLibraryFile() takes a single string of all imports. The last is our rfwString.
        parseLibraryFile(
            'import core.widgets; import material.widgets; widget root = $rfwStringFromGemini;'));
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
    _gemini = App.providedLocalChatOf(context);
    _geminiService = App.providedGeminiServiceOf(context);
    _gemini.initChat();
  }

  int _currentColor = 0;
  final _colorChoices = const [
    Color(0xFF800080),
    Color(0xFF550000),
    Color(0xFF005500),
    Color(0xFF000055),
    Color(0xFF333333),
  ];

  int _currentAppBarText = 0;
  final _numberToShow = const ['1', '2', '3', '4', '5'];

  void _toggleAppBar() {
    setState(() {
      _useAnAppBar = !_useAnAppBar;
    });
  }

  void _changeAppBarText() {
    setState(() {
      _currentAppBarText = (_currentAppBarText + 1) % 5;
      _appBarText = _numberToShow[_currentAppBarText];
    });
  }

  void _changeAppBarColor() {
    setState(() {
      _currentColor = (_currentColor + 1) % 5;
      _appBarColor = _colorChoices[_currentColor];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: const Color(0xFFF7F3F3),
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
                        if (_geminiService.awaitingResponse) return;
                        _handleSubmit(_inputController.text);
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
                  // SECTION: Undo Button.
                  ElevatedButton(
                    onPressed: () {
                      _undoToLastWidget();
                    },
                    child: const SizedBox(
                      height: 50.0,
                      width: 80.0,
                      child: Center(
                        child: Text(
                          'Undo',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalMargin16,
              // SECTION: RFW Widget.
              Container(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF333333),
                      blurRadius: 4.0,
                      offset: Offset(3.0, 3.0),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: ValueListenableBuilder(
                      // When [rfwString] changes, check to see if it's different than before and run update if it is.
                      valueListenable: _geminiService.rfwString,
                      builder: (BuildContext context, String value, _) {
                        if (_currentWidgetValue != _geminiService.rfwString.value) {
                          _currentWidgetValue = _geminiService.rfwString.value;
                          _update();
                        }
                        return Center(
                          child: Scaffold(
                            appBar: _useAnAppBar
                                ? AppBar(
                                    backgroundColor: _appBarColor,
                                    title: Center(
                                      child: Text(
                                        'Heyyyyyy Flutter!     We can change this AppBar! ($_appBarText)',
                                        style: const TextStyle(
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  )
                                : null,
                            body: RemoteWidget(
                              runtime: _runtime,
                              data: _data,
                              widget: const FullyQualifiedWidgetName(remoteLibraryName, 'root'),
                              onEvent: (String name, DynamicMap arguments) {
                                if (name == '_changeAppBarText') {
                                  _changeAppBarText();
                                } else if (name == "_toggleAppBar") {
                                  _toggleAppBar();
                                } else if (name == "_swapColor") {
                                  _changeAppBarColor();
                                }
                              },
                            ),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 64.0,
              ),
              FutureBuilder<void>(
                future: _futureResponse,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    // SECTION: The most recent message from the model, displayed in selectable text.
                    return SizedBox(
                      width: double.infinity,
                      height: 100.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: FutureBuilder<void>(
                          future: _futureResponse,
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.connectionState == ConnectionState.done) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                child: SingleChildScrollView(
                                  // Rebuilds on an updated response from the model.
                                  child: ValueListenableBuilder<String>(
                                    valueListenable: _geminiService.latestResponseFromModel,
                                    builder: (BuildContext context, String value, _) {
                                      return SelectableText(
                                        _geminiService.latestResponseFromModel.value ?? '',
                                        maxLines: 1000,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                    );
                  } else {
                    // TODO: Replace placeholder with something permanent.
                    return Container(
                      width: double.infinity,
                      height: 300.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
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
