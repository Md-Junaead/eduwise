import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/default/consultant-profile/con_profile_model.dart';
import 'package:eduwise/screens/default/consultant-profile/con_profile_view.dart';
import 'package:eduwise/widget/custom_network_image.dart';
import 'package:flutter/material.dart';

class ConsultantCard extends StatelessWidget {
  final ConsultantProfileModel c;
  final int index;

  const ConsultantCard({super.key, required this.c, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Row with image, name, details, and favorite button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Profile Image (circular)
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CustomNetworkImage(
                    imageUrl: c.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                // 🔹 Name, specialty, experience
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        c.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // Specialty (we can use `bio` as specialty here)
                      Text(
                        c.bio,
                        style: const TextStyle(
                          fontSize: 13,
                          color: TColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // Experience (example: 7 years)
                      Text(
                        "${c.experience.length} Years experience",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                // 🔹 Favorite (heart) button
                IconButton(
                  onPressed: () {
                    // TODO: handle favorite toggle
                  },
                  icon: const Icon(Icons.share, color: TColors.secondary),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // ✅ Rating + Patient Stories row
            Row(
              children: [
                const Icon(Icons.thumb_up, size: 16, color: TColors.primary),
                const SizedBox(width: 4),
                Text(
                  "${(c.rating * 20).toStringAsFixed(0)}%", // Example: rating 4.5 → 90%
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.people, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  "${c.experience.length * 10} Patient Stories", // Example logic
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // ✅ Availability + Book button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Next Available",
                      style: TextStyle(
                        color: TColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "10:00 AM tomorrow", // 🔹 You can make this dynamic
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ConsultantProfileScreen(index: index),
                      ),
                    );
                  },
                  child: const Text("View Profile"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
