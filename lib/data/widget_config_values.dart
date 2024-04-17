import 'package:gemini_controls_rfw/data/available_widget_library.dart';

/// The text configurations for widgets, either widgets or entire trees.
/// The "root = SOME_NAME" part of the config values must match the [Map] keys used in [AvailableWidgetLibraries.localWidgetLibrary].

/// Note the names do _not_ need to match the key values in the [widgets]
/// [Map], but doing so makes the code easier to understand.

void handleElevatedButtonClick() {
  print("Elevated Button Clicked!");
}

const widgets = <String, String>{
  'TestConfig': '''
  import core.widgets;
      widget root = Container(
        width: 100.0,
        color: 0xFFEEEEEE,
        child: Center(
          child: Column(
            children: [
        Center(
            child: Container(
              width: 100.0,
              height: 50.0,
              color: 0xFFFFFF00,
              child: Center(
                child: Text(
                  text: ["Child 2"],
                  textDirection: "ltr",
                  style: {
                    'color': 0xFF00FF00, // Green color
                    'fontSize': 24.0,
                  },
                ),
              ),
            ),
          ),
        //----
        SizedBox(
          width: 100.0,
          height: 4.0,
          child: ColoredBox(
            color: 0xFF00FF00,
          ),
        ),
      ],
    ),
  ),
);
    ''',
  'TestLibraryWidget': '''
      import local;
      widget root = TestLibraryWidget();
    ''',
  'Gradient': '''
      import local;
      widget root = Gradient();
    ''',
  'HiJill': '''
      import local;
      widget root = HiJill(name: "Jill"
      );
    '''
};
