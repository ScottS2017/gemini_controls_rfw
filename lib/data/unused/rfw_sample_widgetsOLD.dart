class RfwMasterKey {
  static const String testNetworkImage = 'These are URLs for an images we will be using for testing. If I say to use the first test image, it is at: "https://assets3.thrillist.com/v1/image/3082123/792x446/scale;webp=auto;jpeg_quality=60;progressive.jpg". The second one is at "https://image.petmd.com/files/styles/863x625/public/2023-03/pit-bull.jpg", and the third one is at "https://kenneltocouch.org/wp-content/uploads/2019/09/iStock-1143880146-1080x675.jpg"';
  static const String align = '''
  // The easiest way to use an align is with x, y like this:
   ```
  Align(
    // Alignment top center:
    alignment: {x: 0.0, y:-1.0},
    child: Placeholder(),
  ),
  ```
  or
  ```
   Align(
    // Alignment top center:
    alignment: {x: 0.5, y:0.5},
    child: Container(),
  ),
  ```
  ''';
  static const String alignment = '''
  // ALL Alignments must be maps with keys x and y. This value is center left:
  ```alignment: {x: -1.0, y:0.0},```
  and this value is top center:
  ```alignment: {x: -1.0, y:0.0},```''';
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
  static const String backgroundAndColorBlendMode = '''
    // backgroundBlendMode and colorBlendMode values are the same as the BlendMode values in painting.dart . Choices are: clear, src, dst, srcOver, dstOver, srcIn, dstIn, srcOut, dstOut, srcATop, dstATop, xor, plus, modulate, screen, overlay, darken, lighten,  colorDodge, colorBurn, hardLight, softLight, difference, exclusion, multiply, hue, saturation, color, and luminosity. This is an optional parameter, rarely used, and defaults to "srcOver". The BoxDecoration has an assert that must be complied with: ```assert( backgroundBlendMode == null || color != null || gradient != null, "backgroundBlendMode applies to BoxDecoration's background color or " 'gradient, but no color or gradient was provided.',);```
  ```backgroundBlendMode: "srcOver",```
    ''';
  static const String backgroundColor = '''
    ```backgroundColor: 0xFFFF0000,```
    ''';
  static const String borderOnForeground = '''
    ```borderOnForeground: false,```
    ''';
  static const String border = '''
  // border is a list is a list of values as interpreted by [borderSide].
  An empty or missing list results in a null return value. The list should 
  have one through four items. Extra items are ignored.
  The values are interpreted as follows:
    * start: first value.
    * top: second value, defaulting to same as start.
    * end: third value, defaulting to same as start.
    * bottom: fourth value, defaulting to same as top.
  The following would make a green border 5 wide, all around:
   ```border: [
     {
       color: 0xFF00FF00,
       width: 5.0,
     },
   ],```
   or 
   ```border: [
     {
       color: 0xFF00FF92,
       width: 2.0,
     },
     {
       color: 0xFF99FF92,
       width: 1.0,
     },
     {
       color: 0xFF00FF92,
       width: 5.0,
     },
     {
       color: 0xFFCCFF92,
       width: 1.0,
     },
   ],```
    ''';
  static const String borderRadius = '''
   // borderRadius is a list of maps. An
  empty or missing list results in a null return value. The list should have one
  or four items, if only one is present then it will be applied to all four corners. The values are interpreted
  as follows:
    * topStart: first value.
    * topEnd: second value, defaulting to same as topStart.
    * bottomStart: third value, defaulting to same as topStart.
    * bottomEnd: fourth value, defaulting to same as topEnd.
  This will create top corners with a 20.0 radius and bottom ones with a 30.0
   radius:
   ```borderRadius:
     [
       {x: 20.0, y: 20.0},
       {x: 20.0, y: 20.0},
       {x: 30.0, y: 30.0},
       {x: 30.0, y: 30.0},
     ],```
     This will be 10 on all four corners:
     ```
     [
       {x: 10.0, y: 10.0}
     ],
    ''';
  // TODO MATERIAL: ButtonBar / OverflowBar P3.
  // TODO add shape to card.
  static const String callbacks = '''
  // RFW handles callbacks differently. The method is located in the page that hosts the RFW text widget tree, and therefore has to be referred to during an event. Arguments may be passed to the event handler by adding the arg to the list of arguments. arguments is a required parameter, if there are no args then pass in an empty list. The syntax for handling a method is 'event "METHOD NAME" { arguments: [ARGS HERE IF ANY]}'. The following example calls a method named testPrint, and that method has to be in the page that displays the RFW widget tree:
  onPressed: event "testPrint"  { arguments: ["Print these words"] },
  ''';
  static const String card = '''
  Card(
    color: 0xFFFF00FF,
    shadowColor: 0xFFFF00FF,
    elevation: 4.0,
    borderOnForeground: false,
    margin: [10.0,20.0,10.0,20.0,],
    clipBehavior: "none",
    semanticContainer: true,
    child: Placeholder(),
  ),
  ''';
  static const String centerSlice = '''
  Returns a Rect.fromLTWH:
    ```
    centerSlice: {x: 0.0, y: 0.0, w: 100.0, h: 200.0},
    ```''';
  static const String circularProgressIndicator = '''
  CircularProgressIndicator(
    // Value is a double between 0.0 and 1.0 representing progress towards completion, in percent.
    value: 0.75,
    color: 0xFF0000FF,
    backgroundColor: 0xFFFF0000,
    strokeWidth: 4.0,
    semanticsLabel: "Percent of Loading Complete",
    // This will be used in conjunction with the [semanticsLabel] by screen reading software to identify the widget, and is primarily intended for use with determinate progress indicators to announce how far along they are. For determinate progress indicators, this will be defaulted to [ProgressIndicator.value] expressed as a percentage, i.e. `0.1` will become '10%'.
    semanticsValue: '0.1',
  ),
  ''';
  static const String clipAndClipBehavior = '''
  // clip and clipBehavior both take an enum value. Choices are none, hardEdge, antiAlias, and antiAliasWithSaveLayer. Defaults to none.
  ```clipBehavior: "none",```
  ''';
  static const String clipRRect = '''
  ClipRRect(
    borderRadius:
      [
        {x: 20.0, y: 20.0},
      ],
    clipBehavior: "none",
    child: Container(
      color: 0xFF0000FF,
    ),
  ),  
  ''';
  static const String color = '''
      // All Colors are just hex literal integers, formatted ARGB:
 ```color: 0xFFFF00FF,``` or ```color: 0xF7FF3645,```
  ''';
  static const String column = '''
Column(
  // Use enums by putting the name of the desired value in quotes, like this:
  mainAxisSize: "max",
  mainAxisAlignment: "center",
  crossAxisAlignment: "stretch",
  // mainAxisSize, mainAxisAlignment, and crossAxisAlignment can ONLY be used with Rows, Columns, or Flexes. Putting them in anything else causes the app to crash. The values must be the names of the appropriate enums for each parameter or it wil make the app crash. In the past using enum values for MainAxisSize where we needed ones for MainAxisAlignment made the app crash. Don't make the app crash.
  mainAxisSize: "min",
  mainAxisAlignment: "spaceAround",
  crossAxisAlignment: "stretch"
  textDirection: "ltr",
  children: [
   ...
  ],
),
  ''';
  static const String container = '''
Actually returns an AnimatedContainer. To create a border or border radius
you MUST use a decoration. It is not optional. When you use a decoration
you MUST specify a type, it is not optional. A Container's color and
decoration parameters are mutually exclusive. You can use one or the other,
but never both.
```Container(
  // sizes are always doubles, with the decimal point.
  width: 200.0,
  height: 200.0,
  // Padding and Margin are both listed Left, Top, Right, Bottom
  padding: [10.0,20.0,30.0,40.0,],
  margin: [50.0,20.0,30.0,40.0,],
  alignment:  {x: 0.0, y:0.0},
  clipBehavior: "none",
  // Use color OR decoration, not both.
  color: 0xFFFF00FF,
  // constraints is a map representing a BoxConstraints()
  constraints: {
    minWidth: 0.0,
    maxWidth: 500.0,
    minHeight: 0.0,
    maxHeight: 500.0,
  },
  curve: "linear",
  decoration: {borderRadius: [{x: 20.0, y: 20.0},],},
  // See decoration
  foregroundDecoration: {borderRadius: [{x: 20.0, y: 20.0},],},
  duration: 500,
  // SEE CALLBACKS
  onEnd: event "onEndMethodName"  { arguments: [] },
  // transform and transformAlignment are beyond the scope of this app, at present.
  child: Placeholder(),
)```
  ''';
  static const String curve = '''
    // Returns a [Curve] from the specified string. Choices are linear, decelerate, fastLinearToSlowEaseIn, ease, easeIn, easeInToLinear, easeInSine, easeInQuad, easeInCubic, easeInQuart, easeInQuint, easeInExpo, easeInCirc, easeInBack, easeOut, linearToEaseOut, easeOutSine, easeOutQuad, easeOutCubic, easeOutQuart, easeOutQuint, easeOutExpo, easeOutCirc, easeOutBack, easeInOut, easeInOutSine, easeInOutQuad, easeInOutCubic, easeInOutCubicEmphasized, easeInOutQuart, easeInOutQuint, easeInOutExpo, easeInOutCirc, easeInOutBack, fastOutSlowIn, slowMiddle, bounceIn, bounceOut, bounceInOut, elasticIn, elasticOut, and elasticInOut.
    ```curve: "linear",```
    ''';
  static const String decoration = '''
  decoration is a map describing a BoxDecoration. There are only three types supported
  for [Decoration]: `box` for [BoxDecoration], `flutterLogo` for
  [FlutterLogoDecoration], and `shape` for [ShapeDecoration]. These are the ONLY valid choices, you will lose 10 points for trying to use anything else.
  ```decoration: {
   border: [
     {
       color: 0xFF00FF00,
       width: 5.0,
     },
   ],
   borderRadius:
     [
       {x: 20.0, y: 20.0},
     ],
   boxShadow: [
     {
       color: 0x7F000000,
       offset: { x: 4.0, y: 4.0 },
       blurRadius: 4.0,
       spreadRadius: 2.0,
     },
   ],
   color: 0xFFFF0000,
   // <DecorationImage>
   image: {
     colorFilter: {
       // type choices are: linearToSrgbGamma, matrix, mode, srgbToLinearGamma.
       type: "mode",
       // fit values are fill, contain, cover, fitWidth, fitHeight, and none.
       fit: "cover",
       alignment: {x: 0.0, y:0.0},
     },
     // <ImageProvider>
     source: "https://assets3.thrillist.com/v1/image/3082123/792x446/scale;webp=auto;jpeg_quality=60;progressive.jpg",
     fit: "cover",
   },
   // **Make sure to include the type parameter, the app will crash without it. Choices are box (most often used), shape, and flutterLogo.
   type: "box",
 },```
  ''';
  static const String directionality = '''
  Directionality(
    textDirection: "ltr",
    child: Placeholder(),
  )
  ''';
  static const String divider = '''
  ```
  Divider(
    height: 2.0,
    thickness: 1.0,
    indent: 5.0,
    endIndent: 5.0,
    color: 0xFF000000,
  ),```
  ''';
  static const String dragStartBehavior = '''
  Use the name property of the desired DragStartBehavior enum value:
  ```scrollDirection: "start",```
  ''';
  static const String drawer = '''
    // 
    ```
   Drawer(
    elevation: 4.0.
    semanticLabel: "Semantics label for the Drawer".
    child: Placeholder().
   ),```
    ''';
  static const String drawerHeader = '''
  DrawerHeader(
    duration: 250.
    curve: "easeIn,
    decoration: {color: 0xFFFFFF66},
    margin: [10.0, 10.0, 10.0, 10.0,],
    padding: [10.0, 20.0, 10.0, 20.0,],
    child: Placeholder(),
  ),
  ''';
  // TODO MATERIAL: DropdownButton P3.
  static const String duration = '''
    // Returns a duration in milliseconds from the specified integer.
    ```duration: 500,```
    ''';
  static const String elevatedButton = '''
  ElevatedButton(
  // SEE CALLBACKS FOR EXPLANATION.
  onPressed: event "onPressMethodName"  { arguments: [] },
  onLongPress: event "onLongPressMethodName"  { arguments: [] },
  // autofocus defaults to false.
  autofocus: "false",
  child: Placeholder(),
  ),
  ''';
  static const String elevation = '''
  // elevation
  ```elevation: 4.0,```
  ''';
  static const String expanded = '''
  Expanded(
    flex: 2,
    child: Placeholder(),
  ),
  ''';
  static const String filterQuality = '''
  Use the name property of the desired FilterQuality enum value:
  ```
  filterQuality: "low",
  ```''';
  static const String fit = '''
   If this is the fit of an image or FittedBox use the name property of the desired BoxFit enum value:
  ```fit: "cover",```
  ''';
  static const String fittedBox = '''
    ```
    FittedBox(
      fit: "contain",
      alignment: {x: 0.0, y:0.2},
      clipBehavior: "none",
      child: Placeholder(),
    ),
    ```''';
  static const String floatingActionButton = '''
    ```
    FloatingActionButton(
      tooltip: "Tooltip Text Here",
      foregroundColor: 0xFF000000,
      backgroundColor: 0xFFFFFFFF,
      focusColor: 0xFF999999,
      hoverColor: 0xFFEEEEEE,
      splashColor: 0xFFBBBBBB,
      heroTag: "Hero Tag ID",
      elevation: 4.0,
      focusElevation: 4.0,
      hoverElevation: 4.0,
      highlightElevation: 4.0,
      disabledElevation: 0.0,
      // SEE CALLBACKS
      onPressed: event "testPrint"  { arguments: [] },
      mini: false,
      shape: "circle",
      clipBehavior: clipBehavior: "none",
      autofocus: false,
      materialTapTargetSize: "padded",
      isExtended: false,
      enableFeedback: true,
      child: Placeholder(),
    ),
    ```''';
  static const String foregroundDecoration = '''
  ```foregroundDecoration: {
   border: [
     {
       color: 0xFF00FF00,
       width: 5.0,
     },
   ],
   } ```
  ''';
  static const String fractionallySizedBox = '''
  ```FractionallySizedBox(
  widthFactor: 0.25,
  heightFactor: 0.5,
  alignment: {x: 0.0, y:-1.0},
    child: Container(
      color: 0xFF0000FF,
    ),
),```
  ''';
  static const String gestureDetector = '''
    ```
    GestureDetector(
      // SEE CALLBACKS FOR EXPLANATION.
      onTap: event "onTapMethodName"  { arguments: [] },
      onTapDown: event "onTapDownMethodName"  { arguments: [] },
      onTapUp: event "onTapUpMethodName"  { arguments: [] },
      onTapCancel: event "onTapCancelMethodName"  { arguments: [] },
      onDoubleTap: event "onDoubleTapMethodName"  { arguments: [] },
      onLongPress: event "onLongPressMethodName"  { arguments: [] },
      // Use the name property of the desired HitTestBehavior enum value:
      behavior: "deferToChild",
      child: Placeholder(),
    ),
    ```''';
  static const String gradients = '''
  // Linear Gradient:
  ```
  gradient: {
    // Enum value. Choices are linear, radial, and sweep.
    type: "linear",
    // Both begin and end alignments must use an Alignment enum value name.
    // In a linear gradient, the x and y values for begin and end range from -1 to 1. This means center is at 0.0.
    // Unless I say otherwise begin and end linear gradients at the edges of the container instead of the center. 
    // **Do not put the `begin` or `end` values of a linear gradient at the center of the container. The center of the container is `{x: 0.0, y: 0.0}`. Instead, use values between -1 and 1 to specify the position of the `begin` and `end` values. For example, to start the gradient at the left edge of the container, use `{x: -1.0, y: 0.0}` for the `begin` value.**
    begin: {x: 0.0, y: 1.0},
    end:  {x: 0.0, y: -1.0},
    colors: [
      0xFFFF0000,
      0xFF0000FF,
    ],
    stops: [
      0.0,
      1.0,
    ],
  },
  ```
  
  // Radial gradient. Note the radius and focalRadius both take doubles between 0.0 and 1.0, representing  a fraction of the shortest side of the paint box.
  //
  // For example, if a radial gradient is painted on a box that is
  // 100.0 pixels wide and 200.0 pixels tall, then a radius of 0.8
  // will place the 1.0 stop at 80.0 pixels from the [center].
  //
  // Unless I say otherwise make the center of the gradient be {x: 0.0, y: 0.0} and do not use a focal or focalRadius.
  ```
  gradient: {
    type: "radial",
    // Usually radial gradients will start at {x: 0.0, y: 0.0}.
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
  ```
                
  // Sweep Gradient
  ```
  gradient: {
  type: "sweep",
 // See alignment.
  center: {x: 0.5, y: 0.0},
  // Start and end angles are in radians and expressed as doubles
  startAngle: 0.0,
  endAngle: 1.9,
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
},
```
  ''';
  // TODO CORE: GridView P3.
  // TODO CORE: IconTheme P3.
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
  static const String image = '''
    ```
  Image(
    semanticLabel: "Semantics, good for alt tags",
    excludeFromSemantics: false,
    width: 600.0,
    height: 400.0,
    color: 0xFF0000FF,
    colorBlendMode: "srcOver",
    fit: "fitWidth",
    alignment: {x: 0.0, y:-0.3},
    repeat: "noRepeat",
    centerSlice: {x: 0.0, y: 0.0, w: 100.0, h: 50.0},
    matchTextDirection: false,
    gaplessPlayback: false,
    isAntiAlias: false,
    filterQuality: "medium",
  ),
    ```
    ''';
  // TODO MATERIAL: add customBorder to InkResponse and InkWell.
  static const String inkResponse = '''
    ```
    InkResponse(
      // SEE CALLBACKS
      onTap: event "testPrint"  { arguments: [] },
      onTapDown: event "testPrint"  { arguments: [] },
      onTapUp: event "testPrint"  { arguments: [] },
      onTapCancel: event "testPrint"  { arguments: [] },
      onDoubleTap: event "testPrint"  { arguments: [] },
      onLongPress: event "testPrint"  { arguments: [] },
      onSecondaryTap: event "testPrint"  { arguments: [] },
      onSecondaryTapUp: event "testPrint"  { arguments: [] },
      onSecondaryTapDown: event "testPrint"  { arguments: [] },
      onSecondaryTapCancel: event "testPrint"  { arguments: [] },
      onHighlightChanged: event "testPrint"  { arguments: [] },
      onHover: event "testPrint"  { arguments: [] },
      containedInkWell: false,
      highlightShape: "circle",
      // InkSplash radius
      radius: 20.0,
      borderRadius: [{x: 20.0, y: 20.0}],
      focusColor: 0xFFFF0000,
      hoverColor: 0xFFFF0000,
      highlightColor: 0xFFFF0000,
      splashColor: 0xFFFF0000,
      enableFeedback: true,
      excludeFromSemantics: false,
      canRequestFocus: true,
      onFocusChange: event "testPrint"  { arguments: [] },
      autofocus: false,
      hoverDuration: 250,
      child: Placeholder(),
    )
    ```''';
  static const String inkWell = '''
    ```
    InkWell(
    // SEE CALLBACKS
      onTap: event "testPrint"  { arguments: [] },
      onDoubleTap: event "testPrint"  { arguments: [] },
      onLongPress: event "testPrint"  { arguments: [] },
      onTapDown: event "testPrint"  { arguments: [] },
      onTapCancel: event "testPrint"  { arguments: [] },
      onSecondaryTap: event "testPrint"  { arguments: [] },
      onSecondaryTapUp: event "testPrint"  { arguments: [] },
      onSecondaryTapDown: event "testPrint"  { arguments: [] },
      onSecondaryTapCancel: event "testPrint"  { arguments: [] },
      onHighlightChanged: event "testPrint"  { arguments: [] },
      onHover: event "testPrint"  { arguments: [] },
      focusColor: 0xFFFF0000,
      hoverColor: 0xFFFF0000,
      highlightColor: 0xFFFF0000,
      splashColor: 0xFFFF0000,
      radius: 20.0,
      borderRadius: [{x: 20.0, y: 20.0}],
      enableFeedback: true,
      excludeFromSemantics: false,
      autofocus: false,
      child: Placeholder(),
    ),
    ```''';
  static const String intrinsicHeightAndWidth = '''
    Intrinsic height and width are similar:
    ```
    IntrinsicHeight(child: Placeholder(),),
    IntrinsicWidth(child: Placeholder(),),
    ```''';
  static const String keyboardDismissBehavior = '''
  Use the name property of the desired ScrollViewKeyboardDismissBehavior enum value:
  ```keyboardDismissBehavior: "manual",```
  ''';
  // TODO MATERIAL: LinearProgressIndicator
  // TODO CORE: ListBody
  // TODO MATERIAL: ListTile
  // TODO CORE: ListView
  static const String margin = '''
  // margin is a list of doubles representing Left, Top, Right, Bottom.
    ```margin: [10.0,20.0,10.0,20.0,],```
  ''';
  static const String material = '''
    ```
    Material(
      elevation: 4.0,
      color: 0xFFFFFFFF,
      shadowColor: 0x99000000,
      // surfaceTintColor is the color of the surface tint overlay applied to the material color to indicate elevation.
      surfaceTintColor: 0x99000000,
      textStyle: {
        fontSize: 12.0,
        fontFamily: 'Arial',
        color: 0xFF009900, 
      },
      borderRadius: [{x: 20.0, y: 20.0},],
      shape: "rectangle",
      borderOnForeground: "false",
      clipBehavior: "none",
      // animationDuration in milliseconds. 
      animationDuration: 500,
      child: Placeholder(),
    ),```
    ''';
  static const String materialTapTargetSize = '''
  Use the name property of the desired MaterialTapTargetSize enum value. Choices are padded and shrinkWrap:
  ```
  materialTapTargetSize: "padded",
  ```''';
  static const String offset = '''
  // offset is a map of x, y values.
  offset: { x: 4.0, y: 4.0 },
  ''';
  static const String opacity = '''
    // opacity is actually an AnimatedOpacity
    ```
    Opacity(
      duration: 250,
      curve: "linear",
      opacity: 1.0,
      // SEE CALLBACKS
      onEnd: event "onEndMethodName"  { arguments: [] },
      alwaysIncludeSemantics: "true",
      child: Placeholder(),
    ),```
    ''';
  static const String outlinedButton = '''
    ```
    OutlinedButton(,
      // SEE CALLBACKS FOR EXPLANATION.
      onPressed: event "onPressMethodName"  { arguments: [] },
      onLongPress: event "onLongPressMethodName"  { arguments: [] },
      autofocus: false,
      clipBehavior: "none",
      child: Placeholder(),
),
    ```''';
  static const String padding = '''
  Padding is just a list of four doubles.
  ``` Padding(
    // Padding is Left, Top, Right, Bottom
    padding: [10.0,20.0,30.0,40.0,],
    child: Placeholder(),
  ),```
  ''';
  static const String placeholder = '''
  Placeholder(
    color: 0xFFFF00FF,
    strokeWidth: 2.0,
    placeholderWidth: 100.0,
    placeholderHeight: 100.0,
  ),    
  ''';
  static const String positioned = '''
  // This actually uses an AnimatedPositioned under the hood.
  Positioned(
  // Duration is always an integer in milliseconds.
  duration: 1000,
  curve: "easeInToLinear",
  // Only two out of the three horizontal values ([start], [end], [width]) can be set. The third must be null.
  width: 100.0,
  // Only two out of the three vertical values ([top], [bottom], [height]) can
  // be set. The third must be null.
  height: 150.0,
  child: Placeholder(),
  // Other parameters: "start:" takes a double and is the offset of the child's start edge from the start of the stack. "top" is the offset of the child's top edge from the top of the stack.
  "end" is the offset of the child's end edge from the end of the stack. "bottom" is the offset of the child's bottom edge from the bottom of the stack. "onEnd" takes  void callback.
  ),
  ''';
static const String repeat = '''
  Use the name property of the desired ImageRepeat enum value:
  ```
  repeat: "noRepeat",
  ```''';
  static const String rotation = '''
    Returns and AnimatedRotation
    ```
    Rotation(
      duration: 250,
      curve: "easeIn",
      // turns docs say: "The animation that controls the rotation of the child. If the current value of the turns animation is v, the child will be rotated v * 2 * pi radians before being painted.
      turns: ,
      alignment: {x: 0.0, y: 0.0},
      filterQuality: "high",
      // SEE CALLBACKS FOR EXPLANATION OF onEnd.
      onEnd: event "onPressMethodName"  { arguments: [] },
      child: Placeholder(),
    ),
    ```''';
  static const String row = '''
Row(
  // Use enums by putting the name of the desired value in quotes, like this:
  mainAxisSize: "max",
  mainAxisAlignment: "center",
  crossAxisAlignment: "stretch",
  // mainAxisSize, mainAxisAlignment, and crossAxisAlignment can ONLY be used with Rows, Columns, or Flexes. Putting them in anything else causes the app to crash, don't make the app crash.
  mainAxisSize: "min",
  mainAxisAlignment: "spaceAround",
  crossAxisAlignment: "stretch"
  textDirection: "ltr",
  children: [
   ...
  ],
),
  ''';
  static const String safeArea = '''
    ```
    SafeArea(
      left: true,
      top: true,
      right: true,
      bottom: true,
      // minimum uses an EdgeInsetsDirectional.fromSTEB, the order of elements in the list is [S,T,E,B]:
      minimum: [16.0, 8.0, 16.0, 8.0],
      maintainBottomViewPadding: false,
      child: Placeholder(),
    ),
    ```''';
  // TODO add persistentFooterButtons, bottomNavigationBar, and bottomSheet to scaffold.
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
  floatingActionButton: [
    FloatingActionButton(
      tooltip: "Tooltip Text Here",
      foregroundColor: 0xFF000000,
      backgroundColor: 0xFFFFFFFF,
      // SEE CALLBACKS
      onPressed: event "testPrint"  { arguments: [] },  
      child: Icon(
        icon: 0xE2A0,
        fontFamily: "MaterialIcons",
        color: 0xFFFF00FF,
        size: 30.0,
      ),
    ),
  ],
  // Do not use persistentFooterButtons, bottomNavigationBar, bottomSheet
  drawer: Drawer(
    elevation: 4.0.
    semanticLabel: "Semantics label for the Drawer".
    child: Placeholder().
   ),
  endDrawer: Drawer(
    elevation: 4.0.
    semanticLabel: "Semantics label for the Drawer".
    child: Placeholder().
   ),
  backgroundColor: 0xFFFFFFFF,
  resizeToAvoidBottomInset: false,
  primary: true,
  drawerDragStartBehavior: "start",
  extendBody: false,
  extendBodyBehindAppBar: false,
  drawerScrimColor: 0x33000000,
  drawerEdgeDragWidth: 36.0,
  drawerEnableOpenDragGesture: true,
  endDrawerEnableOpenDragGesture: true,
  restorationId: "Restoration ID",
  body: Placeholder(),
)
  ''';
  static const String scale = '''
  // scale returns an AnimatedScale.
  Scale(
    duration: 500,
    curve: "linear",
    // The target scale. 1.0 is original size, 0.75 is 3/4 original size, etc.
    scale: 1.0,
    alignment: {x: 0.0, y:-0.5},
    // The filter quality with which to apply the transform as a bitmap operation. Takes an enum [FilterQuality] with values of none, low, medium, and high.
    filterQuality: "medium",
    // SEE CALLBACKS
    onEnd: event "onEndMethodName"  { arguments: [] },
    child: Placeholder(),
  )
  ''';
  static const String scrollDirection = '''
  Use the name property of the desired Axis enum value:
  ```scrollDirection: "vertical",```
  ''';
  static const String semanticsContainer = '''
  semanticsContainer is an optional bool that indicates whether this widget represents a single semantic container. If false, it's a collection of individual semantic nodes. Defaults to true.
  ```semanticsContainer: true,```
  ''';
  static const String semanticsLabel = '''
    // semanticsLabel indicates the purpose of the progress bar, and will be read out by screen readers to indicate the purpose of this progress indicator.
  ```semanticsLabel: "Percent of Loading Complete",```
  ''';
  static const String shadowColor = '''
  // shadowColor is used in a Card
  ```shadowColor: 0xFFFF00FF,```
      ''';
  static const String shape = '''
    // shape is an enumValue<BoxShape>, choices are rectangle and circle.
  ```shape: "rectangle",```
  ''';
  static const String singleChildScrollView = '''
  SingleChildScrollView(
    scrollDirection "vertical",
    reverse false,
    padding: [10.0,20.0,30.0,40.0,],
    primary true,
    dragStartBehavior: "start",
    clipBehavior: "none",
    restorationId: "A String serves as an ID",
    keyboardDismissBehavior: "manual",
    child: Placeholder(),
  ),
  ''';
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
  static const String sizedBoxExpand = '''
    This is how to use a SizedBox.expand() in RFW:
    ```
    SizedBoxExpand(),
    ```''';
  static const String sizedBoxShrink = '''
    This is how to use a SizedBox.shrink() in RFW:
    ```
    SizedBoxShrink(),
    ```''';
  static const String spacer = '''
    ```
    Spacer(
      flex: 2,
    ),
    ```''';
  // TODO try Stack.alignment with the enum strings such as "topStart" to see if they work.
  static const String stack = '''
    ```
    Stack(
      alignment: {x: 0.0, y:0.0},
      textDirection: "ltr",
      // fit takes a StackFit enum value. Choices are loose, expand, and passthrough.
      fit: "loose",
      clipBehavior: "none",
      children: [Placeholder(),],
    ),
    ```''';
  static const String strokeWidth = '''
  ```strokeWidth: 4.0,```
  ''';
  static const String textAndTextStyle = '''
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
  },
)
  ''';
  static const String textButton = '''
    ```
    // SEE CALLBACKS
    onPressed: event "testPrint"  { arguments: [] },
    onLongPress: event "testPrint"  { arguments: [] },
    autofocus: false,
    clipBehavior: "none",
    child: Placeholder(),
    ```''';
  static const String verticalDivider = '''
    ```
    VerticalDivider(
      width: 2.2,
      thickness: 2.2,
      indent: 5.0,
      endIndent: 5.0,
      color: 0xFF00FF00,
    ),
    ```''';
  static const String wrap = '''
    ```
    Wrap(
      direction: "horizontal",
      // Takes a [WrapAlignment] value.
      alignment: "start",
      // spacing in the main axis, in pixels.
      spacing: 8.0,
      // Takes a [WrapAlignment] value.
      runAlignment: "start",
      // How much space to place between the runs in the cross axis.
      runSpacing: 16.0,
      // Takes a [WrapCrossAlignment] value.
      crossAxisAlignment: "start",
      textDirection: "rtl",
      // Takes a [VerticalDirection] value.
      verticalDirection: "down",
      clipBehavior: "none",
      children: [Placeholder(), Placeholder()],
    ),
    ```''';

  // The string returned by allWidgets() is 8712 tokens long.
  static String allWidgets(){
    const result = '''
    A list of Widget and parameter examples for your reference: 
    $testNetworkImage 
    $align 
    $alignment 
    $appBar 
    $aspectRatio 
    $backgroundAndColorBlendMode 
    $backgroundColor 
    $borderOnForeground 
    $border 
    $borderRadius
    $callbacks
    $card 
    $centerSlice 
    $circularProgressIndicator 
    $clipAndClipBehavior 
    $clipRRect 
    $color 
    $column 
    $container 
    $curve 
    $decoration 
    $directionality 
    $divider 
    $dragStartBehavior  
    $drawer 
    $drawerHeader 
    $duration 
    $elevatedButton 
    $elevation 
    $expanded 
    $filterQuality 
    $fit 
    $fittedBox 
    $floatingActionButton 
    $foregroundDecoration 
    $fractionallySizedBox 
    $gestureDetector 
    $gradients 
    $icon 
    $image 
    $inkResponse 
    $inkWell 
    $intrinsicHeightAndWidth 
    $keyboardDismissBehavior 
    $margin 
    $material 
    $materialTapTargetSize 
    $offset 
    $opacity 
    $outlinedButton 
    $padding 
    $placeholder 
    $positioned 
    $repeat 
    $rotation 
    $row 
    $safeArea 
    $scaffold 
    $scale 
    $scrollDirection 
    $semanticsContainer 
    $semanticsLabel 
    $shadowColor 
    $shape 
    $singleChildScrollView 
    $sizedBox 
    $sizedBoxExpand 
    $sizedBoxShrink 
    $spacer 
    $stack 
    $strokeWidth 
    $textAndTextStyle 
    $textButton 
    $verticalDivider 
    $wrap 
    ''';
    return result;
  }
}