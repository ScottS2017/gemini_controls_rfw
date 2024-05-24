# gemini__controls_rfw

A collaboration to create a base for using Gemini to control RFW, customizable for various use cases.

## Reference Material
- [RFW on pub.dev](https://pub.dev/packages/rfw)
- [RFW Docs](https://pub.dev/documentation/rfw/latest/rfw/rfw-library.html)
- [Google Generative AI Package](https://pub.dev/packages/google_generative_ai)
- [Get Gemini API Key Here](https://aistudio.google.com/app/apikey)
- [Hixie's starter comments](https://github.com/flutter/packages/pull/6750/files)
- [Gemini Web UI](https://gemini.google.com/app)
- [Token Counter](https://tokenizer.streamlit.app/)

## Approaches Used in this App
- State Management: Kept in the App class, with use of [findAncestorStateOfType](https://api.flutter.dev/flutter/widgets/BuildContext/findAncestorStateOfType.html)
---
How to use the provided instances, this is for the RfwStrings class:

final RfwStrings rfwStrings = App.rfwStringsOf(context);

  ---