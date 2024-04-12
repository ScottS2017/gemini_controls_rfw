/// The text configurations for widgets, either widgets or entire trees.
const widgets = <String, String>{
  '0' : '''
      import local;
      widget root = GreenBox(
        child: Hello(name: "Bob"),
      );
    ''',
  '1' :
  '''
      import local;
      widget root = Hello(name: "Jill"
      );
    '''};