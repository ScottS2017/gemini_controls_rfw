/// The widgets shown on startup.
const initializingRfwWidget = '''
SizedBox(
  width: 400.0,
  height: 700.0,
  child: Scaffold(
    appBar: {
      title: Text(
        text: ['RFW'],
        textDirection: "ltr",
        style: {
          fontFamily: 'Arial',
          color: 0xFF000000, 
        },
      ),
    },
    body: SizedBoxExpand(
      child: ColoredBox(
        color: 0xFFEEEEEE,
      ),  
    ),  
  ),
)
''';

const oldInitString = '''


  Center(
    child: Column(
  children: [
  Container(
  width: 200.0,
  height: 50.0,
  decoration: {
  type: "box",
    color: 0xFFFF7700,
    border: [
      {
        color: 0xFFFF00FF,
        width: 5.0,
      },
    ],
    borderRadius:
          [
            {x: 20.0, y: 20.0},
            {x: 20.0, y: 20.0},
            {x: 20.0, y: 20.0},
            {x: 20.0, y: 20.0},
          ],
  },
),
SizedBox(height: 16.0,),
    Container(
      width: 512.0,
      height: 308.0,
      decoration: {
        type: "box",
        borderRadius:
          [
            {x: 20.0, y: 20.0},
            {x: 20.0, y: 20.0},
            {x: 20.0, y: 20.0},
            {x: 20.0, y: 20.0},
          ],
        image: {
            source: "https://media-be.chewy.com/wp-content/uploads/2021/06/14090727/AmericanPitBullTerrier-FeaturedImage-1024x615.jpg"
          },
        },
    ),
    SizedBox(height: 16.0,),
    Icon(
    // Icons are passed in with their #, not an Icon constructor.
      icon: 0xE2A0,
      // Don't forget the family.
      fontFamily: "MaterialIcons",
      color: 0xFFFF00FF,
      size: 60.0,
    ),
    SizedBox(height: 16.0,),
    Container(
      width: 300.0,
      height: 150.0,
      decoration: {
        color: 0xFFFFFF00,
        // New parameter.
        type: "box",
        borderRadius:
          [
            // The 4 values are topStart, topEnd, bottomStart, bottomEnd.
            // The x value is always the horizontal border, and the y value is always the vertical border. This may not be intuitive, as it makes left and right corners a mirror image of each other if x and y have the same values for each corner, as below.
            // If there is only one map it will be used for all four corners.
            // The y argument is optional. If it is not given then the x value will be used for both, making the radius a circular one.
            {x: 10.0, y: 10.0},
            {x: 20.0, y: 80.0},
            {x: 90.0, y: 30.0},
            {x: 100.0, y: 100.0},
          ],
        border: [
          {
            color: 0xFFF37533,
            width: 3.0,
          },
        ],
      },
      padding: [16.0,10.0,6.0,10.0,], // Padding is just four doubles. The order is LTRB.
      child: Text(
        text: ["Hello World"], // The text parameter is named, and is a list of strings.
        textAlign: "center",
        textDirection: "ltr",
        // The style parameter is a map. The keys TextStyle parameters. Note the values like color are still used without the Color or Colors constructors.
        style: {
          'color': 0xFF00FF00,
          'fontSize': 24.0,
        },
      ),
    ),
  ],
)
  )''';