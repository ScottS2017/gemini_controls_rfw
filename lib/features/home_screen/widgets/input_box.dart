import 'package:flutter/material.dart';
import 'package:gemini_controls_rfw/backend/gemini_service.dart';
import 'package:gemini_controls_rfw/features/app/app.dart';

/// TODO CLASS DOCUMENTATION HERE
@immutable
class InputBox extends StatelessWidget {
  /// Creates an instance of [InputBox].
  const InputBox({
    super.key,
    required this.inputController,
    required this.inputFieldFocusNode,
    required this.handleSubmit,
  });

  final TextEditingController inputController;
  final FocusNode inputFieldFocusNode;
  final Function handleSubmit;

  @override
  Widget build(BuildContext context) {
  // The [GeminiService] singleton.
  GeminiService geminiService = App.providedGeminiServiceOf(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF333333),
            blurRadius: 4.0,
            offset: Offset(3.0, 3.0),
          ),
        ],
        color: Colors.white,
      ),
      child: TextField(
        controller: inputController,
        focusNode: inputFieldFocusNode,
        onSubmitted: (_) {
          if (geminiService.awaitingResponse) return;
          handleSubmit(inputController.text);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Me:',
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
