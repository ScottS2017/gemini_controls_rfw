import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        backgroundColor: const Color(0xFF9C27B0),
        title: const Center(
          child: Text(
            'RFW Testing',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-1.0, -1.0),
            radius: 2.0,
            colors: [
              Color(0xFF00BFFF),
              Color(0xFFFFFFFF),
            ],
            stops: [
              0.0,
              1.0,
            ],
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 200.0,
                height: 100.0,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(-1.0, -1.0),
                    end: Alignment(1.0, 1.0),
                    colors: [
                      Color(0xFFFF0000),
                      Color(0xFF00FF00),
                    ],
                    stops: [
                      0.0,
                      1.0,
                    ],
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFF424242),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x77000000),
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
              ),
              Container(
                width: 200.0,
                height: 100.0,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://assets3.thrillist.com/v1/image/3082123/792x446/scale;webp=auto;jpeg_quality=60;progressive.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFF424242),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x77000000),
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
