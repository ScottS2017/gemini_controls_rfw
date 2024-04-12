import 'package:flutter/material.dart';
import 'package:rfw/formats.dart';
import 'package:rfw/rfw.dart';

class AvailableWidgetLibrary{

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