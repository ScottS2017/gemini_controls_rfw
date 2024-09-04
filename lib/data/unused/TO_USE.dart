// FIXME put this to use
String geminisFeedbackSuggestions = '''
Enums: Strings that are the name of the value. EG: `MainAxisAlignment.start` is `"start"`, `CrossAxisAlignment.stretch` is `"stretch"`.
Types that have multiple subclasses (or multiple very unrelated constructors, like `ColorFilter`): These are represented as maps where the `type` key specifies the type. Typically these have an extension mechanism.
Matrices: Matrices represented as **column-major** flattened arrays. Matrix4 values have 16 doubles in the array.
AlignmentGeometry values: These can be represented either as `{x: ..., y: ...}`(non-directional variant) or `{start: ..., y: ...}` (directional variant).
BoxBorder Defined as arrays of `BorderSide` maps. If array length = 1, the value is used for all four sides. Two values are horizontal and vertical sides respectively. Four values become the start, top, end, and bottom.
BorderRadiusGeometry values: These work similarly to `BoxBorder`, as an array of `Radius` values. Array length of one is for all corners. Two values: first is `topStart` and `bottomStart` corners, second is `topEnd` and `bottomEnd`. Four values map to `topStart`, `topEnd`, `bottomStart`, and `bottomEnd`. Note horizontal and vertical components of any given corner can have different radii for horizontal and vertical sides, x is always the horizontal part and the y is always the vertical part.
Color values: Use hex literal integers representing 0xAARRGGBB. EG: Solid green is: 0xFF00FF00, red is: 0xFFFF0000.
''';