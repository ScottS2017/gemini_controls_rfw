/// The widgets shown on startup.
const initializingRfwWidget = '''
Container(
  width: 500.0,
  height: 800.0,
  color: 0xFFF0F0F0,
  child: Center(
    child: SizedBox(
      width: 400.0,
      height: 700.0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: 0xFF0000FF,
          title: Center(
            child: Text(
              text: ['hi there'],
              style: {
                color: 0xFFFFFFFF,
              },
            ),
          ),
        ),
        body: Row(
          mainAxisAlignment: "spaceBetween",
          crossAxisAlignment: "stretch",
          children: [
            Container(
              width: 50.0,
              color: 0xFF00FFFFF,
            ),
            Column(
             mainAxisAlignment: "spaceEvenly",
             crossAxisAlignment: "center",
              children: [
                ElevatedButton(
                onPressed: event "rfwTestPrint"  { arguments: ["Test String in args"] },
                child: Container(
                  width: 225.0,
                  height: 120.0,
                  color: 0xFFFFFF00,
                ),
                ),
                Container(
                  width: 225.0,
                  height: 120.0,
                  decoration: {
                  type: "box",
                    image: {
                      source: "https://assets3.thrillist.com/v1/image/3082123/792x446/scale;webp=auto;jpeg_quality=60;progressive.jpg",
                      fit: "cover",
                    },
                    borderRadius: [
                      {
                        x: 50.0,
                        y: 50.0,
                      },
                    ],
                    boxShadow: [
                      {
                        color: 0x7F000000,
                        offset: {
                          x: 4.0,
                          y: 4.0,
                        },
                        blurRadius: 4.0,
                      },
                    ],
                  },
                ),
                Container(
                  width: 225.0,
                  height: 120.0,
                  decoration: {
                  type: "box",
                    image: {
                      source: "https://assets3.thrillist.com/v1/image/3082123/792x446/scale;webp=auto;jpeg_quality=60;progressive.jpg",
                      fit: "cover",
                    },
                    borderRadius: [
                      {
                        x: 50.0,
                        y: 50.0,
                      },
                    ],
                    boxShadow: [
                      {
                        color: 0x7F000000,
                        offset: {
                          x: 4.0,
                          y: 4.0,
                        },
                        blurRadius: 4.0,
                      },
                    ],
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ),
)
''';

const TESTinitializingRfwWidget = '''


Scaffold(
  backgroundColor: 0xFFFFFFFF,
  appBar: AppBar(
    backgroundColor: 0xFFFFFFFF,
    title: Text(
      text: ["Project Team"],
      style: {
        fontSize: 24.0,
        fontWeight: "bold",
        color: 0xFF000000,
      },
    ),
  ),
  body: 
  SizedBoxExpand(
  child: Column(
    children: [
      SizedBox(
        height: 10.0,
      ),
      Expanded(
      child: Row(
        mainAxisAlignment: "spaceBetween",
        children: [
          Text(
            text: ["2 0"],
            style: {
              color: 0xFF000000,
            },
          ),
          Image(
            source: "https://st3.depositphotos.com/1192109/35237/i/450/depositphotos_352372118-stock-photo-beauty-portrait-young-brunette-classic.jpg",
            width: 50.0,
            height: 50.0,
          ),
        ],
      ),
      ),
      // SizedBox(
      //   height: 20.0,
      // ),
      // Row(
      //   mainAxisAlignment: "spaceBetween",
      //   children: [
      //     Text(
      //       text: ["2 0"],
      //       style: {
      //         color: 0xFF000000,
      //       },
      //     ),
      //     Image(
      //       source: "https://st3.depositphotos.com/8935838/35907/i/450/depositphotos_359071356-stock-photo-beautiful-young-woman-long-eyelashes.jpg",
      //       width: 50.0,
      //       height: 50.0,
      //     ),
      //   ],
      // ),
      // SizedBox(
      //   height: 20.0,
      // ),
    ],
  ),
), )''';

String asfdasd = '''
Show me a sized box that is 700 high by 500 wide. Place a scaffold inside of it and make the background color of the scaffold light gray. Add an app bar that is purple and has the words "Starting Point" in it, in white.

Add a 100 by 300 container that has the corners rounded by 50 and make it blue. 

Instead of a color use a decoration and use this picture: https://st3.depositphotos.com/1192109/35237/i/450/depositphotos_352372118-stock-photo-beauty-portrait-young-brunette-classic.jpg

Put that Container in a column and add a second one just like it but with this picture: https://st3.depositphotos.com/8935838/35907/i/450/depositphotos_359071356-stock-photo-beautiful-young-woman-long-eyelashes.jpg

Add a two pixels wide black border around both and give them each or drop shadow. Make the main axis alignment of the column space between.
 
Reduce the size of the images to 200 by 200 and add a caption under each one . Under the first one should say Mary and the caption under the bottom one should say Jill

''';