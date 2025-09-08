// ============================
// file: lib/widgets/profile_header.dart
// Profile info block (image + basic contact info)
// ============================
import 'package:eduwise/screens/student-dashboard/profile/profile_model.dart';
import 'package:eduwise/screens/student-dashboard/student__theme.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final StudenProfileModel model;
  const ProfileHeader({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Profile image with modern rounded shape
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                model.imageUrl,
                width: 84,
                height: 84,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // Name + contact
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.fullName, style: StudentAppTextStyles.h2),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 18,
                        color: StudentAppColors.textSecondary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          model.email,
                          style: StudentAppTextStyles.body,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 18,
                        color: StudentAppColors.textSecondary,
                      ),
                      const SizedBox(width: 8),
                      Text(model.phone, style: StudentAppTextStyles.body),
                    ],
                  ),
                ],
              ),
            ),

            // Age chip (derived value)
          ],
        ),
      ),
    );
  }
}
