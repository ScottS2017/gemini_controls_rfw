Map<String, String> rfwDocs = {
'animationDefaults' : 'The default duration that [ArgumentsDecoder.duration] defaults to 200ms:when this is null, and its default curve is fastOutSlowIn',
  'argumentDecodersClassInstructions' : '''
  The argument decoders in RFW decode structured values from a [DataSource]. These methods
  take a [DataSource] and a `key`. The `key` is a path to the
  part of the [DataSource] that the value should be read from. This may
  identify a map, a list, or a leaf value, depending on the needs of the
  method.
  ''',
  'border' : '''
   border is a list is a list of values as interpreted by [borderSide].
  An empty or missing list results in a null return value. The list should 
  have one through four items. Extra items are ignored.
  The values are interpreted as follows:
    * start: first value.
    * top: second value, defaulting to same as start.
    * end: third value, defaulting to same as start.
    * bottom: fourth value, defaulting to same as top.
  ''',
  'borderRadius' : '''
  borderRadius is a list is a list of values as interpreted by [radius]. An
  empty or missing list results in a null return value. The list should have one
  through four items. Extra items are ignored. The values are interpreted
  as follows:
    * topStart: first value.
    * topEnd: second value, defaulting to same as topStart.
    * bottomStart: third value, defaulting to same as topStart.
    * bottomEnd: fourth value, defaulting to same as topEnd.
  ''',
'Color' : "Color is always the ARGB hex number.",
'Colors' : "Colors are always their ARGB hex number.",
  'Column' : 'mainAxisSize, mainAxisAlignment, and crossAxisAlignment are enums, and in RFW need to be used just the enum name value in quotes such as "stretch", "center", "spaceAround", and other enum name values.',
  'Container' : '''Actually returns an AnimatedContainer. To create a border or border radius you MUST use a decoration. It is not optional. When you use a decoration you MUST include the type parameter, the app will crash without it. Choices are box (most often used), shape, and flutterLogo. Example: type: "box". Just like in normal Flutter code, a Container's color and decoration parameters are mutually exclusive. You can use one or the other, but never both.''',
'Flex' : 'mainAxisSize, mainAxisAlignment, and crossAxisAlignment are enums, and in RFW need to be used just the enum name value in quotes such as "stretch", "center", "spaceAround", and other enum name values.',
'Icon' : "Icons are passed in with their hex number and family name as a string, instead of an Icon constructor the way it's done in regular Flutter code.",
'Padding' : '''Padding is just a list of four doubles. The order is left, top, right, bottom. EG this is the same as normal Flutter's symmetric padding set to 16.0 horizontal and 10.0 vertical:
  padding: [16.0,10.0,16.0,10.0,]''',
  'Row' : 'mainAxisSize, mainAxisAlignment, and crossAxisAlignment are enums, and in RFW need to be used just the enum name value in quotes such as "stretch", "center", "spaceAround", and other enum name values.',

};