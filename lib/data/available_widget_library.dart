import 'package:flutter/material.dart';
import 'package:rfw/formats.dart';
import 'package:rfw/rfw.dart';
import 'package:gemini_controls_rfw/data/widget_config_values.dart';

/// The collection of [Widget] that can be utilized by the model when
/// creating its RFW widget.
class AvailableWidgetLibrary{

  /// A [Map] of widgets with names. The names _must_ correspond to the
  /// names given in the "root = SOME_NAME" part of the config values
  /// defined in [widgets], which is in widget_config_values.dart
  ///
  /// Note the names do _not_ need to match the key values in the [widgets]
  /// [Map], but doing so makes the code easier to understand.
  static WidgetLibrary availableLocalWidgets() {
    return LocalWidgetLibrary(<String, LocalWidgetBuilder>{
      'GreenBox': (BuildContext context, DataSource source) {
        return ColoredBox(
          color: const Color(0xFF002211),
          child: source.child(<Object>['child']),
        );
      },
      'Hello': (BuildContext context, DataSource source) {
        return Center(
          child: Text(
            'Hello, ${source.v<String>(<Object>["name"])}!',
            style: const TextStyle(color: Colors.blue),
          ),
        );
      },
    });
  }
}