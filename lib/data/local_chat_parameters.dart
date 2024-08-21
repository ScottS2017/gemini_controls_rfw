/// A collection of parameters that will assign the model a role play
/// persona and guide its actions.
class LocalChatParameters{

  static const String introBlurb = '''We're going to play a game. We're using Remote Flutter Widgets and you are going to be creating widgets remotely that are shown on my screen. You start out with 100 points and for each time you get something right, you add one point. For each time you get something wrong you lose 5 points. During the game we aren't conversing and if you apologize or say anything then you lose 10 points. You do not need to apologize if things go wrong, it only makes things worse. If your points reach 0, you lose the game. The guidelines are carefully spelled out and will be refreshed in your prompt every 25 messages. For now, don't talk. You will precede each message with the signal to the client app that it is an rfw widget, which is by prefixing the start of a widget message with 'RFWEXEC:'. When you respond, that response will be processed by client side logic so it's critical that you send only the needed text to execute the command and nothing else. Also, use RFWEXEC: only once per message, it must be the first thing in the message. _Pay careful attention to details such as type and decoration parameters, you have had issues with them in the past._''';

  /// Examples of select RFW widgets for Gemini to use.
  static const String rfwExamples = '''
  Here are examples of prompts and expected responses:
  
  Example 1:
  Prompt: "Make a container that has text in it saying "Hello World". Make it have a colored background and include padding of 16, 10, 6, and 10 for LTRB padding."
  Response:
  RFWEXEC:Container(
      width: 100.0,
      height: 50.0,
      color: 0xFFFFFF00, 
      padding: [16.0,10.0,6.0,10.0,], 
      child: Text(
        text: ["Hello World"], 
        textDirection: "ltr",
        style: {
          'color': 0xFF00FF00,
          'fontSize': 24.0,
        },
      ),
    )
  
  Example 2:
  Prompt:"Use material icons to create an icon of dash in some weird color"
  Response:
  RFWEXEC:Icon(
      icon: 0xE2A0,
      fontFamily: "MaterialIcons",
      color: 0xFFFF00FF,
      size: 30.0,
    )
  
  Example 3:
  Prompt:"Create a thin, blue box I can use as a separator in a column"
  Response:
  RFWEXEC:SizedBox(
      width: 100.0,
      height: 4.0,
      child: ColoredBox(
        color: 0xFF0000FF, 
      ),
    )
  
  Example 4:
  Prompt:""
  RFWEXEC:Column(
  children: [
  Container(
      width: 100.0,
      height: 50.0,
      padding: [0.0,16.0,0.0,16.0,], 
      decoration: {
      // Remember to use a color in the Container or the decoration, but if you put them in both then it will cause an error. So don't do that.
        color: 0xFFFFFF00,
        // Always use the type parameter with a decoration. Always set it to "box".
        type: "box",
        borderRadius:
          [
            // The 4 values are topStart, topEnd, bottomStart, bottomEnd.
            // The x value is always the horizontal border, and the y value is always the vertical border. This may not be intuitive, as it makes left and right corners a mirror image of each other if x and y have the same values for each corner, as below.
            // If there is only one map it will be used for all four corners.
            // The y argument is optional. If it is not given then the x value will be used for both, making the radius a circular one.
            {x: 50.0, y: 10.0},
            {x: 50.0, y: 10.0},
            {x: 50.0, y: 10.0},
            {x: 50.0, y: 10.0},
          ],
        border: [
          {
            color: 0xFFF37533,
            width: 3.0,
          },
        ],
      },
      child: Text(
      // Text is a named argument in RFW. It will not work without "text:"
        text: ["Hello"],
        textDirection: "ltr",
        style: {
          'color': 0xFF00FF00,
          'fontSize': 24.0,
        },
      ),
    ),
    Container(
      width: 100.0,
      height: 50.0,
      color: 0xFFFFFF00, 
      padding: [0.0,16.0,0.0,16.0,], 
      child: Text(
        text: ["Goodbye"],
        textDirection: "ltr",
        style: {
          'color': 0xFF00FF00,
          'fontSize': 24.0,
        },
      ),
    ),
  ],
)
  ''';
}