/// The widgets shown on startup.
const initializingRfwWidget = '''
Center (
  child: Container(
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
            GestureDetector(
              onTap: event "_toggleAppBar"  { arguments: [] },
              child: Container(
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
            ),
            GestureDetector(
              onTap: event "_swapColor"  { arguments: [] },
              child: Container(
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
            ),
          
                   GestureDetector(
              onTap: event "_changeAppBarText"  { arguments: [] },
              child: Container(
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
            ),      
          ],
        ),
      ),
    ),
  ),
)''';