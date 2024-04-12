import 'package:gemini_controls_rfw/data/available_widget_library.dart';

/// The text configurations for widgets, either widgets or entire trees.
/// The "root = SOME_NAME" part of the config values must match the [Map] keys used in [AvailableWidgetLibrary.availableLocalWidgets].

/// Note the names do _not_ need to match the key values in the [widgets]
/// [Map], but doing so makes the code easier to understand.
const widgets = <String, String>{
  'GreenBox' : '''
      import local;
      widget root = GreenBox(
        child: Hello(name: "Bob"),
      );
    ''',
  'Hello' :
  '''
      import local;
      widget root = Hello(name: "Jill"
      );
    '''};