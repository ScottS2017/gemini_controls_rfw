import 'package:flutter/material.dart';

class Experiments extends StatelessWidget {
  const Experiments({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400.0,
        height: 800.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF000000),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),

        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350.0,
                height: 300.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF800080),
                      Color(0xFF000000),
                    ],
                    stops: [
                      0.0,
                      1.0,
                    ],
                  ),
                  border: Border.all(
                    color: const Color(0xFFC0C0C0),
                    width: 10.0,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Pitties Rule",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 100.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                width: 350.0,
                height: 300.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF800080),
                      Color(0xFF000000),
                    ],
                    stops: [
                      0.0,
                      1.0,
                    ],
                  ),
                  border: Border.all(
                    color: const Color(0xFFC0C0C0),
                    width: 10.0,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Pitties Rule",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 100.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}