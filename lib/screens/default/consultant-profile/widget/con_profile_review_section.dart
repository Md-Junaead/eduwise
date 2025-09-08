import 'package:eduwise/screens/default/consultant-profile/con_profile_model.dart';
import 'package:flutter/material.dart';

/// 🔹 Review Section
class ConsultantReviewSection extends StatelessWidget {
  final ConsultantProfileModel consultant;

  const ConsultantReviewSection({super.key, required this.consultant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Reviews",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...consultant.reviews.map(
          (review) => Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(review),
            ),
          ),
        ),
      ],
    );
  }
}
