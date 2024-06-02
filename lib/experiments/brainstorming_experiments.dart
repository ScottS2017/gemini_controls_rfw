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
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF800080),
        title: Text(
          'Testing',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://st3.depositphotos.com/1192109/35237/i/450/depositphotos_352372118-stock-photo-beauty-portrait-young-brunette-classic.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.75),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
            ),
            Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://st3.depositphotos.com/8935838/35907/i/450/depositphotos_359071356-stock-photo-beautiful-young-woman-long-eyelashes.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.75),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
