/// A collection of various rules to follow when working with RFW widgets.
/// Entries are alphabetized.
class RfwRules {
  static const String animationDefaults = 'The default duration that [ArgumentsDecoder.duration] defaults to 200ms when this is null, and its default curve is fastOutSlowIn';
  static const String argumentDecodersClassInstructions = '''
  The argument decoders in RFW decode structured values from a [DataSource]. These methods
  take a [DataSource] and a `key`. The `key` is a path to the
  part of the [DataSource] that the value should be read from. This may
  identify a map, a list, or a leaf value, depending on the needs of the
  method.
  ''';
  static const String borderRadius = '''
  borderRadius is a list of maps. There will be one or four values. If the values for all four corners are the same
  then just use one map and it will be used for all four corners. Each map has an x and y key. The x key always
  represents the horizontal component of a corner, the y is optional and, if present, always represents the vertical component of that same corner. If there is only an x key and no y, then the x value is used for both. The order
  of maps in the borderRadius list is topStart, topEnd, bottomStart, bottomEnd. As with many alignments in Flutter
  start and end are defined as the start and end sides of a sentence in the user's language, rtl or ltr.
  Examples:
  // 1) All four corners will have their horizontal half use a radius of 50.0, and a vertical half radius of 10.0
  borderRadius:
    [
      {x: 50.0, y: 10.0},
    ],
    
    // 2)  x and y are the same since y isn't provided. The top corners will be a radius of 10.0, and bottom 20.0.
  borderRadius:
    [
      {x: 10.0},
      {x: 10.0},
      {x: 20.0},
      {x: 20.0},
    ],
  ''';
  static const String callbacks = '''
  // RFW handles callbacks differently. The method is located in the page that hosts the RFW text widget tree, and therefore has to be referred to during an event. Arguments may be passed to the event handler by adding the arg to the list of arguments. arguments is a required parameter, if there are no args then pass in an empty list. The syntax for handling a method is 'event "METHOD NAME" { arguments: [ARGS HERE IF ANY]}'. The following example calls a method named testPrint, and that method has to be in the page that displays the RFW widget tree:
  onPressed: event "testPrint"  { arguments: ["Print these words"] },
  ''';
  static const String colorsAreNumbers = "Colors are always their ARGB hex number.";
  static const String iconsAreNumbers =  "Icons are passed in with their hex number and family name as a string, instead of an Icon constructor the way it's done in regular Flutter code.";
  static const String paddingListOfDoubles = '''padding is just a list of four doubles. The order is left, top, right, bottom. EG this is the same as normal Flutter's symmetric padding set to 16.0 horizontal and 10.0 vertical:
  padding: [16.0,10.0,16.0,10.0,]''';
  static const String parametersTakeTheseTypes = '''
  RFW widgets do not always take the same types as normal
  Flutter widgets. This is a key to many parameter types we're
  going to use with this client app. If it is a simple type then
  the comment will be only the type for the following parameter
  listed. If it is an integer then the value shown is an integer (EG: 3).
  If it is a double then the value shown is a double and it
  must be used that way. Every double must use a decimal point, even
  if it is only followed by a 0 (EG: 7.0). bools are shown as simply true 
  or false. If it is more complex than that, a small description will
  be included. Any special notes are listed here:
  // All enums are listed as the value name ONLY:
  ```textDirection: "ltr",```
  or
  ```mainAxisAlignment: "start",```
  ''';
  static const String sizesAreDoubles = "Sizes are always doubles, with the decimal point.";

  static String allRules(){
    const result = '$animationDefaults $argumentDecodersClassInstructions $borderRadius $callbacks $colorsAreNumbers $iconsAreNumbers $paddingListOfDoubles $parametersTakeTheseTypes $sizesAreDoubles';
    return result;
  }
}