import 'package:flutter/material.dart';
import 'package:rfw/rfw.dart';

/// The collection of [Widget] that can be utilized by the model when
/// creating its RFW widget.
class AvailableWidgetLibraries {
  /// Creates the base widgets for use with RFW.

  /// A [Map] of widgets with names. The names _must_ correspond to the
  /// names given in the "root = SOME_NAME" part of the config values
  /// defined in [widgets], which is in widget_config_values.dart
  ///
  /// Note the names do _not_ need to match the key values in the [widgets]
  /// [Map], but doing so makes the code easier to understand.
  static WidgetLibrary localWidgetLibrary() {
    return LocalWidgetLibrary(<String, LocalWidgetBuilder>{
      'TestLibraryWidget': (BuildContext context, DataSource source) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: 10.0,
              color: Colors.green.shade600,
            ),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Center(
            child: Column(
              children: [

                Text(
                  'Test Library Widget',
                  style: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                Text(
                  'Test Library Widget',
                  style: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        );
      },
      // --------------------------
      'Gradient': (BuildContext context, DataSource source) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: 3.0,
              color: Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.circular(16.0),
            gradient: const LinearGradient(
              colors: [
                Colors.green,
                Colors.yellow,
                Colors.red,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 0.5, 1.0],
            ),
          ),
        );
      },
      'HiJill': (BuildContext context, DataSource source) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: 10.0,
              color: Colors.green.shade600,
            ),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Center(
            child: Text(
              'HiJill, ${source.v<String>(<Object>["name"])}!',
              style: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.w700),
            ),
          ),
        );
      },
    });
  }
}
