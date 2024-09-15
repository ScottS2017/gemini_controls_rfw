import 'package:flutter/material.dart';

class Experiment extends StatelessWidget {
  const Experiment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(
          child: Text(
            'Hello Flutter!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: 'Arial',
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
// TODO: Implement _changeAppBarText event.
              },
              child: Container(
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
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://assets3.thrillist.com/v1/image/3082123/792x446/scale;webp=auto;jpeg_quality=60;progressive.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
// TODO: Implement _changeAppBarColor event.
              },
              child: Container(
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
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://kenneltocouch.org/wp-content/uploads/2019/09/iStock-1143880146-1080x675.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
