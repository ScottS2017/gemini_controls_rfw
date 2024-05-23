import 'package:flutter/material.dart';

class GreenBoxWithDashIcon extends StatelessWidget {
  const GreenBoxWithDashIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(
          color: Colors.black,
          width: 5.0,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.dashboard,
          color: Colors.black,
          size: 250.0,
        ),
      ),
    );
  }
}
