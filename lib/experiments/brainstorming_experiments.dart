import 'package:flutter/material.dart';

class Experiment extends StatelessWidget {
  const Experiment({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 360.0,
        height: 720.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Scaffold(
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
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
// Handle the '_changeAppBarText' event.
                  },
                  child: Container(
                    width: 300.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.75),
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
// Handle the '_changeAppBarColor' event.
                  },
                  child: Container(
                    width: 300.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.75),
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
        ),
      ),
    );
  }
}
