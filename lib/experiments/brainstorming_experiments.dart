import 'package:flutter/material.dart';

class Experiments extends StatelessWidget {
  const Experiments({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 360.0,
        height: 720.0,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox.expand(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.orangeAccent,
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 36.0,),
                  Container(
                    width: 300.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage("https://image.petmd.com/files/styles/863x625/public/2023-03/pit-bull.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "They call it",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.brown,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Puppy Love",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.brown,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}