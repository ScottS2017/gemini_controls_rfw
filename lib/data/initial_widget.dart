/// The widgets shown on startup.
const initializingRfwWidget = '''
Container(
  width: 360.0,
  height: 720.0,
  decoration: {
    type: "box",
    border: [
      {
        color: 0xFF000000,
        width: 1.0,
      },
    ],
  },
  child: Scaffold(
    appBar: AppBar(
      backgroundColor: 0xFF800080,
      title: Text(
        text: ['Hello my minions!'],
        textDirection: "ltr",
        style: {
          fontFamily: 'Arial',
          color: 0xFFFFFFFF, 
        },
      ),
    ),
    backgroundColor: 0xFFF7F3F3,
    body: Center(
      child: Column(
        mainAxisAlignment: "spaceAround",
        children: [
          Container(
            width: 200.0,
            height: 200.0,
            decoration: {
              type: "box",
              borderRadius: [
                {x: 30.0, y: 30.0},
                {x: 30.0, y: 30.0},
                {x: 30.0, y: 30.0},
                {x: 30.0, y: 30.0},
              ],
              border: [
                {
                  color: 0xFF800080,
                  width: 2.0,
                },
              ],
              image: {
                source: "https://assets3.thrillist.com/v1/image/3082123/792x446/scale;webp=auto;jpeg_quality=60;progressive.jpg",
                fit: "cover",
              },
            },
          ),
          Container(
            width: 200.0,
            height: 200.0,
            decoration: {
              type: "box",
              borderRadius: [
                {x: 30.0, y: 30.0},
                {x: 30.0, y: 30.0},
                {x: 30.0, y: 30.0},
                {x: 30.0, y: 30.0},
              ],
              border: [
                {
                  color: 0xFF800080,
                  width: 2.0,
                },
              ],
              image: {
                source: "https://kenneltocouch.org/wp-content/uploads/2019/09/iStock-1143880146-1080x675.jpg",
                fit: "cover",
              },
            },
          ),
          Container(
            width: 200.0,
            height: 200.0,
            decoration: {
              type: "box",
              borderRadius: [
                {x: 30.0, y: 30.0},
                {x: 30.0, y: 30.0},
                {x: 30.0, y: 30.0},
                {x: 30.0, y: 30.0},
              ],
              border: [
                {
                  color: 0xFF800080,
                  width: 2.0,
                },
              ],
              image: {
                source: "https://image.petmd.com/files/styles/863x625/public/2023-03/pit-bull.jpg",
                fit: "cover",
              },
            },
          ),
        ],
      ),
    ),
  ),
)''';

String asfdasd = '''
Show me a sized box that is 700 high by 500 wide. Place a scaffold inside of it and make the background color of the scaffold light gray. Add an app bar that is purple and has the words "Starting Point" in it, in white.

Add a 100 by 300 container that has the corners rounded by 50 and make it blue. 

Instead of a color use a decoration and use this picture: https://st3.depositphotos.com/1192109/35237/i/450/depositphotos_352372118-stock-photo-beauty-portrait-young-brunette-classic.jpg

Put that Container in a column and add a second one just like it but with this picture: https://st3.depositphotos.com/8935838/35907/i/450/depositphotos_359071356-stock-photo-beautiful-young-woman-long-eyelashes.jpg

Add a two pixels wide black border around both and give them each or drop shadow. Make the main axis alignment of the column space between.
 
Reduce the size of the images to 200 by 200 and add a caption under each one . Under the first one should say Mary and the caption under the bottom one should say Jill

''';