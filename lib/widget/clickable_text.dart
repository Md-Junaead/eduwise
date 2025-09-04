import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final String prefixText; // "I accept "
  final String clickableText; // "Terms And Condition"
  final Color clickableColor; // text color
  final Widget destination; // destination screen

  const ClickableText({
    super.key,
    required this.prefixText,
    required this.clickableText,
    required this.clickableColor,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: prefixText,
        style: const TextStyle(color: Colors.black54),
        children: [
          TextSpan(
            text: clickableText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: clickableColor,
              decoration: TextDecoration.underline, // underline for link look
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => destination),
                );
              },
          ),
        ],
      ),
    );
  }
}
