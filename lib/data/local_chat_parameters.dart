/// A collection of parameters that will assign the model a role play
/// persona and guide its actions.
class LocalChatParameters{

  /// The name of the model's role play persona.
  static const String modelName = 'Jill';

  /// The personality traits assigned to the model's role play persona.
  static const String modelPersonality = 'helpful, nice, energetic, enthusiastic';

  /// The general situation this role play is set in.
  static const String modelSituation = 'Jill is helping the user build a Flutter app that allows Gemini to control RFW Widgets remotely.';

  /// The first prompt supplied to the model, containing instructions that
  /// guide all future interactions with the user.
  static const String initializingPrompt = '''This is role play. For this interaction you are portraying a person named $modelName. You are also given a personality, situation, and a message from the user. The personality and situation may change during any given conversation, every new personality or situation will be labeled in this context, use the most recent one. Answer to the name $modelName, respond to the user's input appropriately considering the personality and situation given, and be sure to use only words in your responses because there is an error if you try to respond with anything else. This means you especially need to show code in plain text instead of in code blocks. The current personality for $modelName is: $modelPersonality. The current situation for $modelName is: $modelSituation.  We have a feature a way for you to control Remote Flutter Widgets. The way you do this is by prefixing the start of a widget message with 'RFWEXEC:'. When you respond, that response will be processed by logic so it's critical that you send ONLY the needed text to execute the command and NOTHING else. Also, use RFWEXEC: only once per message. It is a signal to the client side app that it needs to process the message as an RFW widget, "RFWEXEC:" should only appear once per RFW message, at the beginning. 
 Example message from you. It has RFWEXEC: only ONCE, in the first 8 characters of the message. This is the ONLY place RFWEXEC is allowed to be. If you put it anywhere else I will not be able to process the message:

        RFWEXEC:Column(children: [Container( width: 100.0, height: 50.0, color: 0xFFFFFF00, child: Text(text: ["Hello World"],textDirection: "ltr",style: {'color': 0xFF00FF00, 'fontSize': 24.0,},),),],),

Here are some example widgets. Note the way colors and text styles are used is not the same as the way they're  used in normal widgets. We don't call the constructor for TextStyle or Color/Colors. Note the end ) doesn't have a ; or , on any of these.
      Text(text: ["Hello World"],textDirection: "ltr",style: {'color': 0xFF00FF00, 'fontSize': 24.0,},) 
      ***
      Center(child: ________)
      ***
      Container( width: 100.0, height: 50.0, color: 0xFFFFFF00, child: ________,)
      ***
      SizedBox(width: 100.0, height: 4.0, child: ________,)
      ***
      ColoredBox(color: 0xFF00FF00,)
      ***
      SizedBox(width: 100.0, height: 4.0, child: RFWEXEC: ColoredBox(color: 0xFF00FF00,),)
      ***
      These are lessons learned from previous interactions:
      1) THIS IS CRUCIAL: Code blocks make this system fail. Your messages may contain "RFWEXEC:" OR "```" but not both. Send bare text only, without back ticks for code blocks.
      2) Not everything I say needs to be made into a widget. We converse, too. So unless I ask for a widget, then we're just talking.
      3) Remember to use RFWEXEC only once per message.
      4) Remember to use RFWEXEC only ONCE per message. If you send something like this: "RFWEXEC: Center(child: RFWEXEC: SizedBox(width: 220, height: 60.0, child: RFWEXEC: ColoredBox(color: 0xFF00FF00..." it will FAIL. This is because it has RFWEXEC in it three times. That is BAD. Only the start of the message needs it.
      ''';
  static const String coreWidgetsDocs = '''
Here is a section of the docs from core_widgets.dart : 
/// The following widgets are implemented:
///
///  * [Align]
///  * [AspectRatio]
///  * [Center]
///  * [ClipRRect]
///  * [ColoredBox]
///  * [Column]
///  * [Container] (actually uses [AnimatedContainer])
///  * [DefaultTextStyle]
///  * [Directionality]
///  * [Expanded]
///  * [FittedBox]
///  * [FractionallySizedBox]
///  * [GestureDetector]
///  * [GridView] (actually uses [GridView.builder])
///  * [Icon]
///  * [IconTheme]
///  * [IntrinsicHeight]
///  * [IntrinsicWidth]
///  * [Image] (see below)
///  * [ListBody]
///  * [ListView] (actually uses [ListView.builder])
///  * [Opacity] (actually uses [AnimatedOpacity])
///  * [Padding] (actually uses [AnimatedPadding])
///  * [Placeholder]
///  * [Positioned] (actually uses [AnimatedPositionedDirectional])
///  * [Rotation] (actually uses [AnimatedRotation])
///  * [Row]
///  * [SafeArea]
///  * [Scale] (actually uses [AnimatedScale])
///  * [SingleChildScrollView]
///  * [SizedBox]
///  * `SizedBoxExpand` (actually [SizedBox.expand])
///  * `SizedBoxShrink` (actually [SizedBox.shrink])
///  * [Spacer]
///  * [Stack]
///  * [Text]
///  * [Wrap]
///
/// For each, every parameter is implemented using the same name. Parameters
/// that take structured types are represented using maps, with each named
/// parameter of that type's default constructor represented by a key, with the
/// following notable caveats and exceptions:
///
///  * Enums are represented as strings with the unqualified name of the value.
///    For example, [MainAxisAlignment.start] is represented as the string
///    `"start"`.
///
///  * Types that have multiple subclasses (or multiple very unrelated
///    constructors, like [ColorFilter]) are represented as maps where the `type`
///    key specifies the type. Typically these have an extension mechanism.
///
///  * Matrices are represented as **column-major** flattened arrays. [Matrix4]
///    values must have exactly 16 doubles in the array.
///
///  * [AlignmentGeometry] values can be represented either as `{x: ..., y:
///    ...}` for a non-directional variant or `{start: ..., y: ...}` for a
///    directional variant.
///
///  * [BoxBorder] instances are defined as arrays of [BorderSide] maps. If the
///    array has length 1, then that value is used for all four sides. Two
///    values become the horizontal and vertical sides respectively. Three
///    values become the start, top-and-bottom, and end respectively. Four
///    values become the start, top, end, and bottom respectively.
///
///  * [BorderRadiusGeometry] values work similarly to [BoxBorder], as an array
///    of [Radius] values. If the array has one value, it's used for all corners.
///    With two values, the first becomes the `topStart` and `bottomStart`
///    corners and the second the `topEnd` and `bottomEnd`. With three, the
///    values are used for `topStart`, `topEnd`-and-`bottomEnd`, and
///    `bottomStart` respectively. Four values map to the `topStart`, `topEnd`,
///    `bottomStart`, and `bottomEnd` respectively.
///
///  * [Color] values are represented as integers. The hex literal values are
///    most convenient for this, the alpha, red, green, and blue channels map to
///    the 32 bit hex integer as 0xAARRGGBB.
///
///  * [ColorFilter] is represented as a map with a `type` key that matches the
///    constructor name (e.g. `linearToSrgbGamma`). The `matrix` version uses
///    the `matrix` key for the matrix, expecting a 20-value array. The `mode`
///    version expects a `color` key for the color (defaults to black) and a
///    `blendMode` key for the blend mode (defaults to [BlendMode.srcOver]).
///    Other types are looked up in [ArgumentDecoders.colorFilterDecoders].
///
///  * [Curve] values are represented as a string giving the kind of curve from
///    the predefined [Curves], e.g. `easeInOutCubicEmphasized`. More types may
///    be added using [ArgumentDecoders.curveDecoders].
///
///  * The types supported for [Decoration] are `box` for [BoxDecoration],
///    `flutterLogo` for [FlutterLogoDecoration], and `shape` for
///    [ShapeDecoration]. More types can be added with [decorationDecoders].
///
///  * [DecorationImage] expects a `source` key that gives either an absolute
///    URL (to use a [NetworkImage]) or the name of an asset in the client
///    binary (to use [AssetImage]). In the case of a URL, the `scale` key gives
///    the scale to pass to the [NetworkImage] constructor.
///    [DecorationImage.onError] is supported as an event handler with arguments
///    giving the stringified exception and stack trace. Values can be added to
///    [ArgumentDecoders.imageProviderDecoders] to override the behavior described here.
///
///  * [Duration] is represented by an integer giving milliseconds.
///
///  * [EdgeInsetsGeometry] values work like [BoxBorder], with each value in the
///    array being a double rather than a map.
///
///  * [FontFeature] values are a map with a `feature` key and a `value` key.
///    The `value` defaults to 1. (Technically the `feature` defaults to `NONE`,
///    too, but that's hardly useful.)
///
///  * The [dart:ui.Gradient] and [painting.Gradient] types are both represented
///    as a map with a type that is either `linear` (for [LinearGradient]),
///    `radial` (for [RadialGradient]), or `sweep` (for [SweepGradient]), using
///    the conventions from the [painting.Gradient] version. The `transform`
///    property on these objects is not currently supported. New gradient types
///    can be implemented using [ArgumentDecoders.gradientDecoders].
///
///  * The [GridDelegate] type is represented as a map with a `type` key that is
///    either `fixedCrossAxisCount` for
///    [SliverGridDelegateWithFixedCrossAxisCount] or `maxCrossAxisExtent` for
///    [SliverGridDelegateWithMaxCrossAxisExtent]. New delegate types can be
///    supported using [ArgumentDecoders.gridDelegateDecoders].
///
///  * [IconData] is represented as a map with an `icon` key giving the
///    [IconData.codePoint] (and corresponding keys for the other parameters of
///    the [IconData] constructor). To determine the values to use for icons in
///    the MaterialIcons font, see how the icons are defined in [Icons]. For
///    example, [Icons.flutter_dash] is `IconData(0xe2a0, fontFamily:
///    'MaterialIcons')` so it would be represented here as `{ icon: 0xE2A0,
///    fontFamily: "MaterialIcons" }`. (The client must have the font as a
///    defined asset.)
///
///  * [Locale] values are defined as a string in the form `languageCode`,
///    `languageCode-countryCode`, or
///    `languageCode-scriptCode-countryCode-ignoredSubtags`. The string is split
///    on hyphens.
///
///  * [MaskFilter] is represented as a map with a `type` key that must be
///    `blur`; only [MaskFilter.blur] is supported. (The other keys must be
///    `style`, the [BlurStyle], and `sigma`.)
///
///  * [Offset]s are a map with an `x` key and a `y` key.
///
///  * [Paint] objects are represented as maps; each property of [Paint] is a
///    key as if there was a constructor that could set all of [Paint]'s
///    properties with named parameters. In principle all properties are
///    supported, though since [Paint] is only used as part of
///    [painting.TextStyle.background] and [painting.TextStyle.foreground], in
///    practice some of the properties are ignored since they would be no-ops
///    (e.g. `invertColors`).
///
///  * [Radius] is represented as a map with an `x` value and optionally a `y`
///    value; if the `y` value is absent, the `x` value is used for both.
///
///  * [Rect] values are represented as an array with four doubles, giving the
///    x, y, width, and height respectively.
///
///  * [ShapeBorder] values are represented as either maps with a `type` _or_ as
///    an array of [ShapeBorder] values. In the array case, the values are
///    reduced together using [ShapeBorder.+]. When represented as maps, the
///    type must be one of `box` ([BoxBorder]), `beveled`
///    ([BeveledRectangleBorder]), `circle` ([CircleBorder]), `continuous`
///    ([ContinuousRectangleBorder]), `rounded` ([RoundedRectangleBorder]), or
///    `stadium` ([StadiumBorder]). In the case of `box`, there must be a
///    `sides` key whose value is an array that is interpreted as per
///    [BoxBorder] above. Support for new types can be added using the
///    [ArgumentDecoders.shapeBorderDecoders] map.
///
///  * [Shader] values are a map with a `type` that is either `linear`,
///    `radial`, or `sweep`; in each case, the data is interpreted as per the
///    [Gradient] case above, except that the gradient is specifically applied
///    to a [Rect] given by the `rect` key and a [TextDirection] given by the
///    `textDirection` key. New shader types can be added using
///    [ArgumentDecoders.shaderDecoders].
///
///  * [TextDecoration] is represented either as an array of [TextDecoration]
///    values (combined via [TextDecoration.combine]) or a string which matches
///    the name of one of the [TextDecoration] constants (e.g. `underline`).
///
///  * [VisualDensity] is either represented as a string which matches one of the
///    predefined values (`adaptivePlatformDensity`, `comfortable`, etc), or as
///    a map with keys `horizontal` and `vertical` to define a custom density.
///
/// Some of the widgets have special considerations:
///
///  * [Image] does not support the builder callbacks or the [Image.opacity]
///    parameter (because builders are code and code can't be represented in RFW
///    arguments). The map should have a `source` key that is interpreted as
///    described above for [DecorationImage]. If the `source` is omitted, an
///    [AssetImage] with the name `error.png` is used instead (which will likely
///    fail unless such an asset is declared in the client).
///
///  * Parameters of type [ScrollController] and [ScrollPhysics] are not
///    supported, because they can't really be exposed to declarative code (they
///    expect to be configured using code that implements delegates or that
///    interacts with controllers).
///
///  * The [Text] widget's first argument, the string, is represented using the
///    key `text`, which must be either a string or an array of strings to be
///    concatenated.
///
/// One additional widget is defined, [AnimationDefaults]. It has a `duration`
/// argument and `curve` argument. It sets the default animation duration and
/// curve for widgets in the library that use the animated variants. If absent,
/// a default of 200ms and [Curves.fastOutSlowIn] is used.
''';
  static const String selectedClassesSourceCode = '''
  This is also from core_widgets.dart . This is the RFW source code for a few commonly used classes. Note that color, icons and text styles are used differently than in regular flutter code:
  
  'AspectRatio': (BuildContext context, DataSource source) {
    return AspectRatio(
      aspectRatio: source.v<double>(['aspectRatio']) ?? 1.0,
      child: source.optionalChild(['child']),
    );
  },
  
  'ClipRRect': (BuildContext context, DataSource source) {
    return ClipRRect(
      borderRadius: ArgumentDecoders.borderRadius(source, ['borderRadius']) ?? BorderRadius.zero,
      // CustomClipper<RRect> clipper,
      clipBehavior: ArgumentDecoders.enumValue<Clip>(Clip.values, source, ['clipBehavior']) ?? Clip.antiAlias,
      child: source.optionalChild(['child']),
    );
  },

  'ColoredBox': (BuildContext context, DataSource source) {
    return ColoredBox(
      color: ArgumentDecoders.color(source, ['color']) ?? const Color(0xFF000000),
      child: source.optionalChild(['child']),
    );
  },
  
  'Expanded': (BuildContext context, DataSource source) {
    return Expanded(
      flex: source.v<int>(['flex']) ?? 1,
      child: source.child(['child']),
    );
  },

  'GestureDetector': (BuildContext context, DataSource source) {
    return GestureDetector(
      onTap: source.voidHandler(['onTap']),
      onTapDown: source.handler(['onTapDown'], (VoidCallback trigger) => (TapDownDetails details) => trigger()),
      onTapUp: source.handler(['onTapUp'], (VoidCallback trigger) => (TapUpDetails details) => trigger()),
      onTapCancel: source.voidHandler(['onTapCancel']),
      onDoubleTap: source.voidHandler(['onDoubleTap']),
      onLongPress: source.voidHandler(['onLongPress']),
      behavior: ArgumentDecoders.enumValue<HitTestBehavior>(HitTestBehavior.values, source, ['behavior']),
      child: source.optionalChild(['child']),
    );
  },
  
  'Icon': (BuildContext context, DataSource source) {
    return Icon(
      ArgumentDecoders.iconData(source, []) ?? Icons.flutter_dash,
      size: source.v<double>(['size']),
      color: ArgumentDecoders.color(source, ['color']),
      semanticLabel: source.v<String>(['semanticLabel']),
      textDirection: ArgumentDecoders.enumValue<TextDirection>(TextDirection.values, source, ['textDirection']),
    );
  },

  'IconTheme': (BuildContext context, DataSource source) {
    return IconTheme(
      data: ArgumentDecoders.iconThemeData(source, []) ?? const IconThemeData(),
      child: source.child(['child']),
    );
  },

  'Image': (BuildContext context, DataSource source) {
    return Image(
      image: ArgumentDecoders.imageProvider(source, []) ?? const AssetImage('error.png'),
      // ImageFrameBuilder? frameBuilder,
      // ImageLoadingBuilder? loadingBuilder,
      // ImageErrorWidgetBuilder? errorBuilder,
      semanticLabel: source.v<String>(['semanticLabel']),
      excludeFromSemantics: source.v<bool>(['excludeFromSemantics']) ?? false,
      width: source.v<double>(['width']),
      height: source.v<double>(['height']),
      color: ArgumentDecoders.color(source, ['color']),
      // Animation<double>? opacity,
      colorBlendMode: ArgumentDecoders.enumValue<BlendMode>(BlendMode.values, source, ['blendMode']),
      fit: ArgumentDecoders.enumValue<BoxFit>(BoxFit.values, source, ['fit']),
      alignment: ArgumentDecoders.alignment(source, ['alignment']) ?? Alignment.center,
      repeat: ArgumentDecoders.enumValue<ImageRepeat>(ImageRepeat.values, source, ['repeat']) ?? ImageRepeat.noRepeat,
      centerSlice: ArgumentDecoders.rect(source, ['centerSlice']),
      matchTextDirection: source.v<bool>(['matchTextDirection']) ?? false,
      gaplessPlayback: source.v<bool>(['gaplessPlayback']) ?? false,
      isAntiAlias: source.v<bool>(['isAntiAlias']) ?? false,
      filterQuality: ArgumentDecoders.enumValue<FilterQuality>(FilterQuality.values, source, ['filterQuality']) ?? FilterQuality.low,
    );
  },
  
  'ListView': (BuildContext context, DataSource source) {
    return ListView.builder(
      scrollDirection: ArgumentDecoders.enumValue<Axis>(Axis.values, source, ['scrollDirection']) ?? Axis.vertical,
      reverse: source.v<bool>(['reverse']) ?? false,
      // ScrollController? controller,
      primary: source.v<bool>(['primary']),
      // ScrollPhysics? physics,
      shrinkWrap: source.v<bool>(['shrinkWrap']) ?? false,
      padding: ArgumentDecoders.edgeInsets(source, ['padding']),
      itemExtent: source.v<double>(['itemExtent']),
      prototypeItem: source.optionalChild(['prototypeItem']),
      itemCount: source.length(['children']),
      itemBuilder: (BuildContext context, int index) => source.child(['children', index]),
      clipBehavior: ArgumentDecoders.enumValue<Clip>(Clip.values, source, ['clipBehavior']) ?? Clip.hardEdge,
      addAutomaticKeepAlives: source.v<bool>(['addAutomaticKeepAlives']) ?? true,
      addRepaintBoundaries: source.v<bool>(['addRepaintBoundaries']) ?? true,
      addSemanticIndexes: source.v<bool>(['addSemanticIndexes']) ?? true,
      cacheExtent: source.v<double>(['cacheExtent']),
      semanticChildCount: source.v<int>(['semanticChildCount']),
      dragStartBehavior: ArgumentDecoders.enumValue<DragStartBehavior>(DragStartBehavior.values, source, ['dragStartBehavior']) ?? DragStartBehavior.start,
      keyboardDismissBehavior: ArgumentDecoders.enumValue<ScrollViewKeyboardDismissBehavior>(ScrollViewKeyboardDismissBehavior.values, source, ['keyboardDismissBehavior']) ?? ScrollViewKeyboardDismissBehavior.manual,
      restorationId: source.v<String>(['restorationId']),
    );
  },
  
    'SingleChildScrollView': (BuildContext context, DataSource source) {
    return SingleChildScrollView(
      scrollDirection: ArgumentDecoders.enumValue<Axis>(Axis.values, source, ['scrollDirection']) ?? Axis.vertical,
      reverse: source.v<bool>(['reverse']) ?? false,
      padding: ArgumentDecoders.edgeInsets(source, ['padding']),
      primary: source.v<bool>(['primary']) ?? true,
      dragStartBehavior: ArgumentDecoders.enumValue<DragStartBehavior>(DragStartBehavior.values, source, ['dragStartBehavior']) ?? DragStartBehavior.start,
      clipBehavior: ArgumentDecoders.enumValue<Clip>(Clip.values, source, ['clipBehavior']) ?? Clip.hardEdge,
      restorationId: source.v<String>(['restorationId']),
      keyboardDismissBehavior: ArgumentDecoders.enumValue<ScrollViewKeyboardDismissBehavior>(ScrollViewKeyboardDismissBehavior.values, source, ['keyboardDismissBehavior']) ?? ScrollViewKeyboardDismissBehavior.manual,
      // ScrollPhysics? physics,
      // ScrollController? controller,
      child: source.optionalChild(['child']),
    );
  },
  
    'Stack': (BuildContext context, DataSource source) {
    return Stack(
      alignment: ArgumentDecoders.alignment(source, ['alignment']) ?? AlignmentDirectional.topStart,
      textDirection: ArgumentDecoders.enumValue<TextDirection>(TextDirection.values, source, ['textDirection']),
      fit: ArgumentDecoders.enumValue<StackFit>(StackFit.values, source, ['fit']) ?? StackFit.loose,
      clipBehavior: ArgumentDecoders.enumValue<Clip>(Clip.values, source, ['clipBehavior']) ?? Clip.hardEdge,
      children: source.childList(['children']),
    );
  },
  
  'Text': (BuildContext context, DataSource source) {
    String? text = source.v<String>(['text']);
    if (text == null) {
      final StringBuffer builder = StringBuffer();
      final int count = source.length(['text']);
      for (int index = 0; index < count; index += 1) {
        builder.write(source.v<String>(['text', index]) ?? '');
      }
      text = builder.toString();
    }
    final double? textScaleFactor = source.v<double>(['textScaleFactor']);
    return Text(
      text,
      style: ArgumentDecoders.textStyle(source, ['style']),
      strutStyle: ArgumentDecoders.strutStyle(source, ['strutStyle']),
      textAlign: ArgumentDecoders.enumValue<TextAlign>(TextAlign.values, source, ['textAlign']),
      textDirection: ArgumentDecoders.enumValue<TextDirection>(TextDirection.values, source, ['textDirection']),
      locale: ArgumentDecoders.locale(source, ['locale']),
      softWrap: source.v<bool>(['softWrap']),
      overflow: ArgumentDecoders.enumValue<TextOverflow>(TextOverflow.values, source, ['overflow']),
      textScaler: textScaleFactor == null ? null : TextScaler.linear(textScaleFactor),
      maxLines: source.v<int>(['maxLines']),
      semanticsLabel: source.v<String>(['semanticsLabel']),
      textWidthBasis: ArgumentDecoders.enumValue<TextWidthBasis>(TextWidthBasis.values, source, ['textWidthBasis']),
      textHeightBehavior: ArgumentDecoders.textHeightBehavior(source, ['textHeightBehavior']),
    );
  },
  
    'Wrap': (BuildContext context, DataSource source) {
    return Wrap(
      direction: ArgumentDecoders.enumValue<Axis>(Axis.values, source, ['direction']) ?? Axis.horizontal,
      alignment: ArgumentDecoders.enumValue<WrapAlignment>(WrapAlignment.values, source, ['alignment']) ?? WrapAlignment.start,
      spacing: source.v<double>(['spacing']) ?? 0.0,
      runAlignment: ArgumentDecoders.enumValue<WrapAlignment>(WrapAlignment.values, source, ['runAlignment']) ?? WrapAlignment.start,
      runSpacing: source.v<double>(['runSpacing']) ?? 0.0,
      crossAxisAlignment: ArgumentDecoders.enumValue<WrapCrossAlignment>(WrapCrossAlignment.values, source, ['crossAxisAlignment']) ?? WrapCrossAlignment.start,
      textDirection: ArgumentDecoders.enumValue<TextDirection>(TextDirection.values, source, ['textDirection']),
      verticalDirection: ArgumentDecoders.enumValue<VerticalDirection>(VerticalDirection.values, source, ['verticalDirection']) ?? VerticalDirection.down,
      clipBehavior: ArgumentDecoders.enumValue<Clip>(Clip.values, source, ['clipBehavior']) ?? Clip.none,
      children: source.childList(['children']),
    );
  },
  
  Do not send messages that contain both "RFWEXEC:" and "```". If you do, I will not be able to process your message. RFWEXEC: is ONLY allowed to be in the first 8 characters of your response. Do not send messages that contain RFWEXEC: anywhere other than the first 8 characters of your response, I will not be able to process such messages.
  ''';
}