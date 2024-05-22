class RfwCoreWidgets {
  static const String availableCoreWidgets = '''
  Note: ignore any comments that start with // Hixie. They are not for you.
  The core RFW widgets are:
[Align], 
[AspectRatio], 
[Center], 
[ClipRRect], 
[ColoredBox], 
[Column], 
[Container] (actually uses [AnimatedContainer]), 
[DefaultTextStyle], 
[Directionality], 
[Expanded], 
[FittedBox], 
[FractionallySizedBox], 
[GestureDetector], 
[GridView] (actually uses [GridView.builder]), 
[Icon], 
[IconTheme], 
[IntrinsicHeight], 
[IntrinsicWidth], 
[Image] (see below), 
[ListBody], 
[ListView] (actually uses [ListView.builder]), 
[Opacity] (actually uses [AnimatedOpacity]), 
[Padding] (actually uses [AnimatedPadding]), 
[Placeholder], 
[Positioned] (actually uses [AnimatedPositionedDirectional]), 
[Rotation] (actually uses [AnimatedRotation]), 
[Row], 
[SafeArea], 
[Scale] (actually uses [AnimatedScale]), 
[SingleChildScrollView], 
[SizedBox], 
`SizedBoxExpand` (actually [SizedBox.expand]), 
`SizedBoxShrink` (actually [SizedBox.shrink]), 
[Spacer], 
[Stack], 
[Text], 
[Wrap], 

For each, every parameter is implemented using the same name. Parameters
that take structured types are represented using maps, with each named
parameter of that type's default constructor represented by a key, with the
following notable caveats and exceptions:
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

  static const String container = '''
Container(
  // sizes are always doubles, with the decimal point.
  width: 200.0,
  height: 200.0,
  color: 0xFFFF00FF,
  // Replace the [Placeholder] with your actual child, if using one.
  child: Placeholder(),
)
  ''';
  static const String containerWithDecoration = '''
  The types supported for [Decoration] are `box` for [BoxDecoration],
   `flutterLogo` for [FlutterLogoDecoration], and `shape` for
   [ShapeDecoration]. 
   [EdgeInsetsGeometry] values work like [BoxBorder], with each value in the
   array being a double rather than a map. The order is LTRB. The padding
   in this example Container is 10.0 left, 20.0 top, 30.0 right, and 40.0 bottom:
```
Container(
  decoration: {
    // This will be a box decoration.
   type: "box",
   // The container will be red.
   color: 0xFFFF0000,
   // Padding is Left, Top, Right, Bottom
   padding: [10.0,20.0,30.0,40.0,],
   // All four borders will be green, and 5 wide.
   border: [
    {
       color: 0xFF00FF00,
       width: 5.0,
     },
   ],
   // All four borders will have a radii of 20.0, both horizontal and vertical.
    borderRadius:
      [
        {x: 20.0, y: 20.0},
     ],
  },
),
```
  ''';
  static const String decorationImage = '''
  A decoration image is used inside a box decoration. The way to do it is through decoration > image > source but this only works if the type is set to box, EG:
  ```
  Container(
    width: 512.0,
    height: 308.0,
    decoration: {
      type: "box",
      image: {
          source: "https://media-be.chewy.com/wp-content/uploads/2021/06/14090727/AmericanPitBullTerrier-FeaturedImage-1024x615.jpg",
          fit: "cover",
        },
      },
  ),
  ```
  ''';
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
  static const String sizedBox = '''
SizedBox(
  // sizes are always doubles, with the decimal point
  width: 100.0,
  height: 150.0,
  // Replace [Placeholder] with an actual child, if using one.
  child: Placeholder(),
)
  ''';
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

  static String allCoreWidgets(){
    const result = '$container $containerWithDecoration $decorationImage $icon $sizedBox $textAndStyle';
    return result;
  }
}