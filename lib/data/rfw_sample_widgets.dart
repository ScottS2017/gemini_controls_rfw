class RfwSampleWidgets {
  static const String testNetworkImage = 'This is a URL for an image we will be using for testing. If I say to use the test image, it is at: "https://assets3.thrillist.com/v1/image/3082123/792x446/scale;webp=auto;jpeg_quality=60;progressive.jpg"';
  static const String rulesAndGuidelines = '''
For each widget, every parameter is implemented using the same name as its normal Flutter counterpart. Parameters that take structured types are represented using maps, with each named parameter of that type's default constructor represented by a key, with the following notable caveats and exceptions:
 
 * Enums are represented as strings with the unqualified name of the value.
   For example, [MainAxisAlignment.start] is represented as the string
   `"start"`.
   
   // EXAMPLE NEEDED
   
 * Types that have multiple subclasses (or multiple very unrelated
   constructors, like [ColorFilter]) are represented as maps where the `type`
   key specifies the type. Typically these have an extension mechanism.
   
   // EXAMPLE NEEDED
   
 * Matrices are represented as **column-major** flattened arrays. [Matrix4]
   values must have exactly 16 doubles in the array.
   
   // EXAMPLE NEEDED
   
 * [AlignmentGeometry] values can be represented either as `{x: ..., y:
   ...}` for a non-directional variant or `{start: ..., y: ...}` for a
   directional variant.
   
   // EXAMPLE NEEDED
   
 * [BoxBorder] instances are defined as arrays of [BorderSide] maps. If the
   array has length 1, then that value is used for all four sides. Two
   values become the horizontal and vertical sides respectively. Three
   values become the start, top-and-bottom, and end respectively. Four
   values become the start, top, end, and bottom respectively. EG:
   ```
   border: [
      {
        color: 0xFFFF00FF,
        width: 5.0,
      },
    ],
    ```
 * [BorderRadiusGeometry] values work similarly to [BoxBorder], as an array
   of [Radius] values. If the array has one value, it's used for all corners.
   With two values, the first becomes the `topStart` and `bottomStart`
   corners and the second the `topEnd` and `bottomEnd`. With three, the
   values are used for `topStart`, `topEnd`-and-`bottomEnd`, and
   `bottomStart` respectively. Four values map to the `topStart`, `topEnd`,
   `bottomStart`, and `bottomEnd` respectively. Note the horizontal and
   vertical components of any given corner do not have to be the same. The
   corner can have different radii for horizontal and vertical sides. The x is
   always the horizontal part and the y is always the vertical part. EG This
   will create top corners with a 20.0 radius and bottom ones with a 30.0
   radius:
   ```
   borderRadius:
     [
       {x: 20.0, y: 20.0},
       {x: 20.0, y: 20.0},
       {x: 30.0, y: 30.0},
       {x: 30.0, y: 30.0},
     ],
   ```
 * [Color] values are represented as integers. The hex literal values are
   most convenient for this, the alpha, red, green, and blue channels map to
   the 32 bit hex integer as 0xAARRGGBB. EG: Solid green is:
   ```
   0xFF00FF00
   ```
 * [ColorFilter] is represented as a map with a `type` key that matches the
   constructor name (e.g. `linearToSrgbGamma`). The `matrix` version uses
   the `matrix` key for the matrix, expecting a 20-value array. The `mode`
   version expects a `color` key for the color (defaults to black) and a
   `blendMode` key for the blend mode (defaults to [BlendMode.srcOver]).
   Other types are looked up in [ArgumentDecoders.colorFilterDecoders].
   
   // EXAMPLE NEEDED
   
 * [Curve] values are represented as a string giving the kind of curve from
   the predefined [Curves], e.g. `easeInOutCubicEmphasized`. More types may
   be added using [ArgumentDecoders.curveDecoders].
   
   // EXAMPLE NEEDED
   
 
 * [DecorationImage] expects a `source` key that gives either an absolute
   URL (to use a [NetworkImage]) or the name of an asset in the client
   binary (to use [AssetImage]). In the case of a URL, the `scale` key gives
   the scale to pass to the [NetworkImage] constructor.
   [DecorationImage.onError] is supported as an event handler with arguments
   giving the stringified exception and stack trace. Values can be added to
   [ArgumentDecoders.imageProviderDecoders] to override the behavior described here.
   
   // EXAMPLE NEEDED
   
 * [Duration] is represented by an integer giving milliseconds.
 
 // EXAMPLE NEEDED

 * [FontFeature] values are a map with a `feature` key and a `value` key.
   The `value` defaults to 1. (Technically the `feature` defaults to `NONE`,
   too, but that's hardly useful.)
   
   // EXAMPLE NEEDED
   
 * The [dart:ui.Gradient] and [painting.Gradient] types are both represented
   as a map with a type that is either `linear` (for [LinearGradient]),
   `radial` (for [RadialGradient]), or `sweep` (for [SweepGradient]), using
   the conventions from the [painting.Gradient] version. The `transform`
   property on these objects is not currently supported. New gradient types
   can be implemented using [ArgumentDecoders.gradientDecoders].
   
   // EXAMPLE NEEDED
   
 * The [GridDelegate] type is represented as a map with a `type` key that is
   either `fixedCrossAxisCount` for
   [SliverGridDelegateWithFixedCrossAxisCount] or `maxCrossAxisExtent`
   for [SliverGridDelegateWithMaxCrossAxisExtent]. New delegate types
   can be supported using [ArgumentDecoders.gridDelegateDecoders].
   
   // EXAMPLE NEEDED
   
 
 * [Locale] values are defined as a string in the form `languageCode`,
   `languageCode-countryCode`, or `languageCode-scriptCode-countryCode-ignoredSubtags`.
   The string is split on hyphens.
   
   // EXAMPLE NEEDED
   
 * [MaskFilter] is represented as a map with a `type` key that must be
   `blur`; only [MaskFilter.blur] is supported. (The other keys must be
   `style`, the [BlurStyle], and `sigma`.)
   
   // EXAMPLE NEEDED
   
 * [Offset]s are a map with an `x` key and a `y` key.
 
 // EXAMPLE NEEDED
 
 * [Paint] objects are represented as maps; each property of [Paint] is a
   key as if there was a constructor that could set all of [Paint]'s
   properties with named parameters. In principle all properties are
   supported, though since [Paint] is only used as part of
   [painting.TextStyle.background] and [painting.TextStyle.foreground], in
   practice some of the properties are ignored since they would be no-ops
   (e.g. `invertColors`).
   
   // EXAMPLE NEEDED

 * [Rect] values are represented as an array with four doubles, giving the
   x, y, width, and height respectively.
   
   // EXAMPLE NEEDED
   
 * [ShapeBorder] values are represented as either maps with a `type` _or_
   as an array of [ShapeBorder] values. In the array case, the values are
   reduced together using [ShapeBorder.+]. When represented as maps, the
   type must be one of `box` ([BoxBorder]), `beveled`
   ([BeveledRectangleBorder]), `circle` ([CircleBorder]), `continuous`
   ([ContinuousRectangleBorder]), `rounded` ([RoundedRectangleBorder]), or
   `stadium` ([StadiumBorder]). In the case of `box`, there must be a
   `sides` key whose value is an array that is interpreted as per
   [BoxBorder] above. Support for new types can be added using the
   [ArgumentDecoders.shapeBorderDecoders] map.
   
   // EXAMPLE NEEDED
   
 * [Shader] values are a map with a `type` that is either `linear`,
   `radial`, or `sweep`; in each case, the data is interpreted as per the
   [Gradient] case above, except that the gradient is specifically applied
   to a [Rect] given by the `rect` key and a [TextDirection] given by the
   `textDirection` key. New shader types can be added using
   [ArgumentDecoders.shaderDecoders].
   
   // EXAMPLE NEEDED
   
 * [TextDecoration] is represented either as an array of [TextDecoration]
   values (combined via [TextDecoration.combine]) or a string which matches
   the name of one of the [TextDecoration] constants (e.g. `underline`).
   
   // EXAMPLE NEEDED
   
 * [VisualDensity] is either represented as a string which matches one of the
   predefined values (`adaptivePlatformDensity`, `comfortable`, etc), or as
   a map with keys `horizontal` and `vertical` to define a custom density.
Some of the widgets have special considerations:

// EXAMPLE NEEDED

 * [Image] does not support the builder callbacks or the [Image.opacity]
   parameter (because builders are code and code can't be represented in
   RFW arguments). The map should have a `source` key that is 
   interpreted as described above for [DecorationImage]. If the `source`
   is omitted, an [AssetImage] with the name `error.png` is used instead
   (which will likely fail unless such an asset is declared in the client).
   
   // EXAMPLE NEEDED
   
Parameters of type [ScrollController] and [ScrollPhysics] are not
supported, because they can't really be exposed to declarative code (they
expect to be configured using code that implements delegates or that
interacts with controllers).
   
One additional widget is defined, [AnimationDefaults]. It has a `duration`
argument and `curve` argument. It sets the default animation duration and
curve for widgets in the library that use the animated variants. If absent,
a default of 200ms and [Curves.fastOutSlowIn] is used.
  ''';
  // Individual Widgets
  // TODO MATERIAL: AboutListTile
  static const String align = '''
  // The easiest way to use an align is with x, y like this:
  Align(
    // Alignment top center:
    alignment: {x: 0.0, y:-1.0},
    child: Placeholder(),
  ),          
  ''';
  static const String appBar = '''
AppBar(
  backgroundColor: 0xFFFF0000,
  title: Text(
    text: ['AppBar Sample'],
    textDirection: "ltr",
    style: {
      fontFamily: 'Arial',
      color: 0xFFFFFFFF, 
    },
  ),
)
  ''';
  static const String aspectRatio = '''
  // aspectRatio takes a double.
  AspectRatio(
    aspectRatio: 3.0,
    child: Container(
      color: 0xFF0000FF,
    ),
  ),
  ''';
  // TODO MATERIAL: ButtonBar / OverflowBar
  // TODO MATERIAL: Card
  static const String circularProgressIndicator = '''
  CircularProgressIndicator(
    // Value is a double between 0.0 and 1.0 representing progress towards completion, in percent.
    value: 0.75,
    color: 0xFF0000FF,
    backgroundColor: 0xFFFF0000,
    // Width of the line that goes around.
    strokeWidth: 4.0,
    // semanticsLabel indicates the purpose of the progress bar, and will be read out by screen readers to indicate the purpose of this progress indicator.
    semanticsLabel: "Percent of Loading Complete",
    // This will be used in conjunction with the [semanticsLabel] by screen reading software to identify the widget, and is primarily intended for use with determinate progress indicators to announce how far along they are. For determinate progress indicators, this will be defaulted to [ProgressIndicator.value] expressed as a percentage, i.e. `0.1` will become '10%'.
    semanticsValue: '0.1',
  ),
  ''';
  static const String clipRRect = '''
  ClipRRect(
  // Rounds the corners of the Container by 20:
    borderRadius:
      [
        {x: 20.0, y: 20.0},
      ],
    child: Container(
      color: 0xFF0000FF,
    ),
  ),  
  ''';
  static const String column = '''
Column(
  // Use enums by putting the name of the desired value in quotes, like this:
  mainAxisSize: "max",
  mainAxisAlignment: "center",
  crossAxisAlignment: "stretch",
  // mainAxisSize, mainAxisAlignment, and crossAxisAlignment can ONLY be used with Rows, Columns, or Flexes. Putting them in anything else causes the app to crash, don't make the app crash.
  children: [
   ...
  ],
),
  ''';
  static const String containerWithoutDecoration = '''
Container(
  // sizes are always doubles, with the decimal point.
  width: 200.0,
  height: 200.0,
  // Padding is Left, Top, Right, Bottom
  padding: [10.0,20.0,30.0,40.0,],
  // Margin, like padding, is also Left, Top, Right, Bottom
  margin: [50.0,20.0,30.0,40.0,],
  color: 0xFFFF00FF,
  // Replace the [Placeholder] with your actual child, if using one.
  child: Placeholder(),
)
  ''';
  static const String containerWithDecoration = '''
  To create a border or border radius you MUST use a decoration. It is not
  optional. When you use a decoration you MUST specify a type, it is not optional.
  A Container's color and decoration parameters are mutually exclusive. You can use one or the other, but never both.
  The types supported for [Decoration] are `box` for [BoxDecoration],
   `flutterLogo` for [FlutterLogoDecoration], and `shape` for
   [ShapeDecoration]. 
   [EdgeInsetsGeometry] values work like [BoxBorder], with each value in the
   array being a double rather than a map. The order is LTRB. The padding
   in this example Container is 10.0 left, 20.0 top, 30.0 right, and 40.0 bottom:
```
Container(
// Since we're using a decoration, we cannot use the Container's color parameter.
  decoration: {
    // This will be a box decoration.
   type: "box",
   // The container will be red.
   color: 0xFFFF0000,
   // All four borders will be green, and 5 wide.
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
    // Decoration Image example:
    image: {
      source: "https://assets3.thrillist.com/v1/image/3082123/792x446/scale;webp=auto;jpeg_quality=60;progressive.jpg",
      fit: "cover",
    },
  },
),
```
  ''';
  static const String directionality = '''
  Directionality(
    textDirection: "ltr",
    child: Placeholder(),
  )
  ''';
  // TODO MATERIAL: Divider
  // TODO MATERIAL: Drawer
  // TODO MATERIAL: DrawerHeader
  // TODO MATERIAL: DropdownButton
  // TODO MATERIAL: ElevatedButton
  static const String expanded = '''
  Expanded(
    flex: 2,
    child: Placeholder(),
  ),
  ''';
  // TODO CORE: FittedBox
  // TODO MATERIAL: FloatingActionButton
  static const String fractionallySizedBox = '''
  FractionallySizedBox(
  widthFactor: 0.25,
  heightFactor: 0.5,
  alignment: {x: 0.0, y:-1.0},
    child: Container(
      color: 0xFF0000FF,
    ),
),
  ''';
  // TODO CORE: GestureDetector
  // TODO CORE: GridView
  // TODO CORE: IconTheme
  static const String icon = '''
Icon(
  // Icons are passed in with their #, not an Icon constructor.
    icon: 0xE2A0,
    // Don't forget MaterialIcons family is updated to Material 3.
    fontFamily: "MaterialIcons",
    // color is just the AGB hex number
    color: 0xFFFF00FF,
    // sizes are always doubles, with the decimal point
    size: 30.0,
)
  ''';
  // TODO MATERIAL: InkResponse
  // TODO MATERIAL: InkWell
  // TODO CORE: IntrinsicHeight
  // TODO CORE: IntrinsicWidth
  // TODO CORE: Image
  // TODO MATERIAL: LinearProgressIndicator
  // TODO CORE: ListBody
  // TODO MATERIAL: ListTile
  // TODO CORE: ListView
  // TODO MATERIAL: Material
  // TODO CORE: Opacity
  // TODO MATERIAL: OutlinedButton
  static const String padding = '''
  Padding(
    // Padding is Left, Top, Right, Bottom
    padding: [10.0,20.0,30.0,40.0,],
    child: Placeholder(),
  ),    
  ''';
  static const String placeholder = '''
  Placeholder(
    color: 0xFFFF00FF,
    strokeWidth: 2.0,
    placeholderWidth: 100.0,
    placeholderHeight: 100.0,
  ),    
  ''';
  // TODO CORE: Positioned
  static const String positioned = '''
  // This actually uses an AnimatedPositioned under the hood.
  Positioned(
  // Duration is always an integer in milliseconds.
  duration: 1000,
  ),
  ''';

  // TODO CORE: Rotation
  // TODO CORE: Row
  // TODO CORE: SafeArea
  // FIXME add more to scaffold
  static const String scaffold = '''
Scaffold(
  appBar: AppBar(
  backgroundColor: 0xFF00F0F0,
    title: Text(
      text: ['Scaffold Sample'],
      textDirection: "ltr",
      style: {
        fontFamily: 'Arial',
        color: 0xFF000000, 
      },
    ),
  ),
  body: Placeholder(),
)
  ''';
  // TODO CORE: Scale
  // TODO CORE: SingleChildScrollView
  static const String sizedBox = '''
SizedBox(
  // sizes are always doubles, with the decimal point
  width: 100.0,
  height: 150.0,
  // Replace [Placeholder] with an actual child, if using one.
  child: Placeholder(),
)
// SizedBox.expand() in RFW widgets is:
SizedBoxExpand()
  ''';
  // TODO CORE: SizedBoxExpand
  // TODO CORE: SizedBoxShrink
  // TODO CORE: Spacer
  // TODO CORE: Stack
  static const String textAndStyle = '''
Text(
  // RFW [Text.text] takes a list of strings.
  text: ['hello'],
  // Direction is mandatory. ltr = Left to Right.
  textDirection: "ltr",
  // Enums are used by their names in quotes. Here, TextAlign.center is just "center".
  textAlign: "center",
  // Instead of using a TextStyle constructor, RFW uses a map for the parameters.
  style: {
    fontSize: 12.0,
    fontFamily: 'Arial',
    // color is just the AGB hex number
    color: 0xFF009900, 
    'fontSize': 36.0,
  },
)
  ''';
  // TODO MATERIAL: TextButton
  // TODO MATERIAL: VerticalDivider
  // TODO CORE: Wrap

  static String allWidgets(){
    const result = '''
    $testNetworkImage 
    $rulesAndGuidelines 
    $appBar 
    $column 
    $containerWithoutDecoration 
    $containerWithDecoration 
    $icon 
    $scaffold 
    $sizedBox 
    $textAndStyle''';
    return result;
  }
}

String testString = '''



Align(
  alignment: {x: 0.0, y:-1.0},
  child: Container(
    width: 100,
    height: 100,
    child: ColoredBox(
      color: 0xFF0000FF,
    ),
  ),
),


Show me a container that is 500 wide by 800 high and is light grey. Inside the container, center a sized box that is 400 wide by 700 high and put a scaffold inside of it, using a blue AppBar. Inside the app bar for the title use a text widget that says hi there in white text, and wrap it in a center so it's centered in the AppBar. Inside the scaffold put a row with its main axis alignment set to space between and its cross axis alignment to stretch. Inside the row, the first child is going to be a green box that is 50 pixels wide. The second child is a column with the column's main axis alignment set to spaceEvenly and cross axis alignment set to center. Put three container's in the column. Each container should be  225 wide and 120 high, and put the test image in it . Round the corners of those image's containers by 50 and give them each a drop shadow. For all borders, images and radii make sure you use your decoration parameter properly. The last child of the row should be a red box, just like the green one.

''';