/// The widgets shown on startup.
const initializingRfwWidget = '''
Container(
  width: 400.0,
  height: 700.0,
 decoration: {
  type: "box",
    border: [
      {
        color: 0xFFDDDDDD,
        width: 2.0,
      },
    ],
  },
  child: Scaffold(
    appBar: AppBar(
    backgroundColor: 0xFFFF0000,
      title: Text(
        text: ['RFW'],
        textDirection: "ltr",
        style: {
          fontFamily: 'Arial',
          color: 0xFFFFFFFF, 
        },
      ),
    ),
    body: SizedBoxExpand(
      child: ColoredBox(
        color: 0xFFEEEEEE,
        child: Center(
          child: Column(
          mainAxisAlignment: "spaceAround",
            children: [
            
            Container(
              width: 200.0,
              height: 200.0,
              decoration: {
                type: "box",
                gradient: {
                  type: "radial",
                  center: {x: 0.5, y: 0.0},
                  radius: 0.8,
                  colors: [
                    0xFF0000FF,
                    0xFF00FF00,
                    0xFFFF0000,
                  ],
                  stops: [
                  0.0,
                  0.5,
                  1.0,
                  ],
                  focal: {x:0.0, y:0.0},
                  focalRadius: 0.4,
                },
                border: [
                {
                   color: 0xFF00FF00,
                   width: 5.0,
                 },
               ],
               // All four corners will have a radii of 20.0, both horizontal and vertical.
                borderRadius:
                  [
                    {x: 20.0, y: 20.0},
                 ],
                // This is how a drop shadow is done in RFW. Each map entry is one shadow.
                boxShadow: [
                  {
                    color: 0x7F000000,
                    offset: { x: 4.0, y: 4.0 },
                    blurRadius: 4.0,
                  },
                 ],
               },              ),
            ],
          ),
        ),
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