class Reminders{
  static const firstReminder = '1) Code blocks break things. If "```" is in your message you lose.';
  static const secondReminder = "2) We have normal conversations too. Only provide widget code when explicitly requested. If I just say hello or some equivalent, I'm just making conversation so don't send a widget.";
  static const thirdReminder = "3) Always use decimals for sizes, even if it's just '.0'.";
  static const fourthReminder = "4) Don't nest multiple RFWEXEC commands within a single message, it will lead to errors.";
  static const fifthReminder = '5) To add borders, corner radii, or decorations you MUST use the "decoration" parameter.';
  static const sixthReminder = "6) Containers don't have a borderRadius parameter, use its decoration.";
  static const seventhReminder = '7) Ensure the type parameter within decoration is one of: "box", "flutterLogo", or "shape"';
  static const eighthReminder = "8) Use values between -1 and 1 for begin and end in linear gradients. Default begin is {0.0, -1.0} (top) and end is {0.0, 1.0} (bottom).";
  static const ninthReminder = '9) Specify alignment using a map with x and y keys. Good example: ```alignment: {x: 0.0, y:-1.0},```. Bad example: ```"topCenter"```.';
  static const tenthReminder = '10) When asked to "undo," show the widget state before the current one, not a new modification.';
  static const eleventhReminder = "11) Do only what you are asked to do.";
  static const twelfthReminder = "12) When instructed to put one thing in another, add it to the existing widget instead of replacing it entirely, unless told to start over.";
  static const thirteenthReminder = "13) Every time you are asked to show a widget you need to use the RFWEXEC. Sometimes we will be talking and then when we resume building widgets you forget.";
  static const fourteenthReminder = "14) Don't include documentation in your code. It's only there for your edification.";
  static const fifteenthReminder = "15) STOP TELLING ME ABOUT DECORATIONS. I'm sick of it! I don't need your reminders, EVER!";

  static const allReminders =
      'Reminders: $firstReminder + $secondReminder + $thirdReminder + $fourthReminder + $fifthReminder + $sixthReminder + $seventhReminder + $eighthReminder + $ninthReminder + $tenthReminder + $eleventhReminder + $twelfthReminder $thirteenthReminder $fourteenthReminder';
}

String bigWidget = '''
Start with a center and in it place a container that is 360 by 720 and has a black border that is one pixel wide. Inside of it place a scaffold with a dark purple app bar. Inside of the app bar for the title I want you to use a center and inside of that place a text with white lettering that says Hello New York . 

Inside of the scaffold place a center and inside of the center place a column with its main axis alignment set to space around. Inside of the column create a three gesture detectors. Each need to use a container that is 300 by 200 and each of the test images  as a decoration image, set the fit to cover. Round the corners of the container by 10 and give it a black border that is 1 wide. The onTap for the first GestureDetector should be "_toggleAppBar", the second "_changeAppBarText" and the third "_changeAppBarColor". 
''';