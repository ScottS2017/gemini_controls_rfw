# gemini_controls_rfw

The closest thing to a guide found so far is rfw-1.0.26\lib\src\flutter\core_widgets.dart

Basic guide to the widgets and how they're used:

Column(
  children: [
    SizedBox(
      width: 100.0,
      height: 4.0,
      child: ColoredBox(
        color: 0xFF0000FF, // Colors are just the hex value of the color.
      ),
   ),
    Container(
      width: 100.0,
      height: 50.0,
      color: 0xFFFFFF00, // Colors are just the hex value of the color.
      padding: [16.0,10.0,6.0,10.0,], // Padding is just four doubles. The order is LTRB.
      child: Text(
        text: ["Hello World"], // The text parameter is named, and is a list of strings.
        textDirection: "ltr",
        // The style parameter is a map. The keys TextStyle parameters. Note the values like color are still used without the Color or Colors constructors.
        style: {
          'color': 0xFF00FF00, // Colors are just the hex value of the color.
          'fontSize': 24.0,
        },
      ),
    ),
    Icon(
      icon: 0xE2A0, // Icons are just the hex value of the icon, don't use the IconData constructor.
      fontFamily: "MaterialIcons", // Specify the icon font family.
      color: 0xFFFF00FF, // Colors are just the hex value of the color.
      size: 30.0,
    ),
  ],
),