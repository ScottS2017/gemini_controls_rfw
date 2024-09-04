import 'package:gemini_controls_rfw/backend/gemini_service.dart';
import 'package:gemini_controls_rfw/features/app/app.dart';
import 'package:gemini_controls_rfw/models/gemini_chat.dart';
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
  final _inputController = TextEditingController();
  final _inputFieldFocusNode = FocusNode();
  bool _useAnAppBar = true;
  Color _appBarColor = const Color(0xFF800080);
  String _appBarText = 'Heyyyyyy Flutter!     We can change this AppBar!';

  // Contains the logic that builds and maintains Remote Flutter Widgets.
  final Runtime _runtime = Runtime();

  // Configuration data from the remote widgets.
  final DynamicContent _data = DynamicContent();

  // An individual chat instance. Having more than one is possible, but beyond the scope of this talk.
  late GeminiChat _gemini;

  // The [GeminiService] singleton provided via the context.
  late GeminiService _geminiService;

  // Used to determine if the RFW widget has changed, if so call update().
  String _currentWidgetValue = '';

  // The width and height of the outer border surrounding the working area.
  final double _width = 1080.0;
  final double _height = 900.0;

  // The future used the the UI's [FutureBuilder].
  Future<void>? _futureResponse;

  // NOTE: In RFW the library "parts" are the parts of a name sepearated by periods. The below 'material', 'widgets' is used in update() as 'material.widgets'.
  /// The widget library of material widgets.
  static const LibraryName materialLibraryName = LibraryName(<String>['material', 'widgets']);

  /// The widget library of core widgets.
  static const LibraryName coreLibraryName = LibraryName(<String>['core', 'widgets']);

  /// The widget library of local custom widgets.
  static const LibraryName localLibraryName = LibraryName(<String>['local', 'widgets']);

  /// The widget library of local custom widgets.
  static const LibraryName remoteLibraryName = LibraryName(<String>['remote']);

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

  // FIXME Undo needs re-implemented.
  // void _undoToLastWidget() {
  //   setState(() {
  //     // Process the prompt.
  //     _futureResponse = _geminiService.handleSubmit(
  //         userInput: _geminiService.undoWidget, gemini: _gemini, geminiService: _geminiService);
  //     // Set focus back to the input field for the next input, then clear the text.
  //     _inputFieldFocusNode.requestFocus();
  //     _inputController.clear();
  //   });
  // }

  // Handles changing the widgets.
  void _update() {
    _runtime.update(coreLibraryName, createCoreWidgets());
    _runtime.update(materialLibraryName, createMaterialWidgets());
    var rfwStringFromGemini = _geminiService.rfwString.value;
    _runtime.update(
        remoteLibraryName,
        // parseLibraryFile() takes a single string of all imports. The last is our rfwString.
        // The imports below are the library files, EG:  LibraryName(<String>['material', 'widgets']); = material.widgets
        parseLibraryFile(
            'import core.widgets; import material.widgets; import local.widgets; widget root = $rfwStringFromGemini;'));
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
    _gemini = App.providedGeminiChatOf(context);
    _geminiService = App.providedGeminiServiceOf(context);
    _gemini.initChat();
  }

  // Variables and methods for controlling the [AppBar].
  // ------------
  int _currentColor = 0;
  final _colorChoices = const [
    Color(0xFF800080),
    Color(0xFF550000),
    Color(0xFF005500),
    Color(0xFF000055),
    Color(0xFF333333),
  ];
  int _currentAppBarText = 0;
  final _textToShow = const [
    'Heyyyyyy Flutter!     We can change this AppBar!',
    'Like this.',
    'Or like this.',
    'Are you tired of this yet?',
    'How about now?',
  ];

  void _toggleAppBar() {
    setState(() {
      _useAnAppBar = !_useAnAppBar;
    });
  }

  void _changeAppBarText() {
    setState(() {
      _currentAppBarText = (_currentAppBarText + 1) % 5;
      _appBarText = _textToShow[_currentAppBarText];
    });
  }

  void _changeAppBarColor() {
    setState(() {
      _currentColor = (_currentColor + 1) % 5;
      _appBarColor = _colorChoices[_currentColor];
    });
  }
  // ------------
  // End variables and methods for controlling the [AppBar].

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
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
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
                      //_undoToLastWidget();
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
                                        _appBarText,
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
                                } else if (name == "_changeAppBarColor") {
                                  _changeAppBarColor();
                                }
                              },
                            ),
                          ),
                        );
                      }),
                ),
              ),
              verticalMargin16,
              FutureBuilder<void>(
                future: _futureResponse,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    // SECTION: The most recent message from the model, displayed in selectable text.
                    return Expanded(
                      child: SizedBox(
                        width: double.infinity,
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
                      ),
                    );
                  } else {
                    // TODO: Replace placeholder with something permanent.
                    return Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
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

const String instructions = '''
1) Show me a center and inside of it place a container that is 360 by 720 with a black border of one pixel. 

2) Inside of this container place a scaffold with a purple app bar . In the title of the app bar place a center and inside of that center place white text that says hello Flutter. Capitalize the H in hello and the F in flutter and put an exclamation point on the end . 

3) For the body of this scaffold I want you to use a center and then inside of that place a column. We will have two children in this column and the top one will be a container that is 300 by 300 with the corners rounded by 50 and a black border of one. Give that container a drop shadow and in its decoration place a decoration image that is the first test image. For the second child I want you to create a container that is the same except the image should be the 3rd test image . 

4) Set the column's main access alignment to space around 

5) I want you to place each one of these containers inside of a gesture detector because we're going to turn them into buttons.  For the events on each I want you to use these events :. Neither gets any arguments.

6) I want to be able to use this in a regular flutter app that will be run on an Android device. To do that I need you to give me all of this code in a format that can be used by a regular flutter application. Remember that the rules are going to be different. Text has to be done in a different way as do colors , borders , padding , and corner radii. Also, remember that decorations don't take a type in a regular flutter widget. Name the widget experiment.
''';