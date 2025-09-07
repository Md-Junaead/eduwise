import 'package:flutter/material.dart';
import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/widget/custom_network_image.dart';
import 'package:eduwise/screens/home/widget/our_con_section.dart'; // ✅ For Consultant model

/// 🔹 AllConsultantCard Widget
/// - Reusable anywhere (grid, list, etc.)
/// - Shows consultant details
/// - Profile & Service buttons stacked vertically
class AllConsultantCard extends StatelessWidget {
  final Consultant consultant;

  const AllConsultantCard({super.key, required this.consultant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🔹 Profile Image
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomNetworkImage(
              imageUrl: consultant.imageUrl,
              height: 80,
              width: 80,
            ),
          ),
          const SizedBox(height: 10),

          // 🔹 Name
          Text(
            consultant.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 4),

          // 🔹 Service Name
          Text(
            consultant.service,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 6),

          // 🔹 Rating Stars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (i) {
              return Icon(
                i < consultant.rating.round() ? Icons.star : Icons.star_border,
                color: Colors.orange,
                size: 18,
              );
            }),
          ),

          const Spacer(),

          // 🔹 Buttons stacked vertically
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(
                onPressed: () {
                  // ✅ Profile action
                },
                style: _buttonStyle(),
                child: const Text("Profile"),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  // ✅ Service action
                },
                style: _buttonStyle(),
                child: const Text("Service"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🔹 Reusable button style function
  ButtonStyle _buttonStyle() {
    return OutlinedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      side: const BorderSide(color: Colors.grey),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ).copyWith(
      overlayColor: WidgetStateProperty.all(TColors.primary.withOpacity(0.2)),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return Colors.white;
        }
        return Colors.black;
      }),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return TColors.primary;
        }
        return Colors.transparent;
      }),
    );
  }
}
