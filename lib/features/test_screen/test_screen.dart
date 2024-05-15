import 'package:flutter/cupertino.dart';
import 'package:gemini_controls_rfw/data/available_widget_library.dart';
import 'package:gemini_controls_rfw/data/widget_config_values.dart';
import 'package:gemini_controls_rfw/features/app/app.dart';
import 'package:gemini_controls_rfw/models/local_chat.dart';
import 'package:gemini_controls_rfw/utils/spacing_constants.dart';
import 'package:rfw/formats.dart' show parseLibraryFile;
import 'package:rfw/rfw.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Test Screen'),
        ),
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 100.0,
                width: 100.0,
               child: ColoredBox(color: Colors.green),
              ),
            ),
            Row(
              children: [
                for (var i = 0; i <= 10; i++)
                  Icon(
                    Icons.home,
                    color: Color.lerp(Colors.red, Colors.green, i / 10),
                    size: 10.0 + (i * 10.0),
                  ),
              ],
            ),
          ],
        ));
  }
}
