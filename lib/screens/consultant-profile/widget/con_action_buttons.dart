import 'package:eduwise/widget/custom_button.dart';
import 'package:flutter/material.dart';

/// 🔹 Contact & Share Buttons
class ConsultantActionButtons extends StatelessWidget {
  const ConsultantActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          text: "Contact",
          color: Colors.blue,
          destination: Container(), // 🔹 Replace with ContactScreen
        ),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.blue),
          onPressed: () {
            // 🔹 Implement share functionality
          },
        ),
      ],
    );
  }
}
