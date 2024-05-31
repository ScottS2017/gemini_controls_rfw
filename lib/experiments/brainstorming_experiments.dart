import 'package:flutter/material.dart';

class Experiments extends StatelessWidget {
  const Experiments({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            gradient: const
            RadialGradient(
              center: Alignment(0.5, 0.0),
              radius: 0.8,
              colors: [
                Color(0xFF0000FF),
                Color(0xFF00FF00),
                Color(0xFFFF0000),
              ],
              stops: [
                0.0,
                0.5,
                1.0,
              ],
              focal: Alignment.center,
              focalRadius: 0.4,
            ),
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(
              color: Colors.black,
              width: 5.0,
            ),
          ),
        ),
      ),
    );
  }
}
