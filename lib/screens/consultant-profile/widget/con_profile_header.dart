import 'package:eduwise/screens/consultant-profile/con_profile_model.dart';
import 'package:flutter/material.dart';
import '../../../widget/custom_network_image.dart';

/// 🔹 Modern & Responsive Profile Header Section
class ConsultantProfileHeader extends StatelessWidget {
  final ConsultantProfileModel consultant;

  const ConsultantProfileHeader({super.key, required this.consultant});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      // ✅ prevents content from going under status bar/notch
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ✅ Profile Image
          Container(
            width: screenWidth * 0.35,
            height: screenWidth * 0.35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipOval(
              child: CustomNetworkImage(imageUrl: consultant.imageUrl),
            ),
          ),

          const SizedBox(height: 16),

          // ✅ Name
          Text(
            consultant.name,
            style: TextStyle(
              fontSize: screenWidth < 360 ? 18 : 22,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade900,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 6),

          // ✅ Address with icon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.redAccent),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  consultant.address,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ✅ Bio inside styled card
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              consultant.bio,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Colors.grey.shade800,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ✅ Rating Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                5,
                (index) => Icon(
                  index < consultant.rating.floor()
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.orange.shade400,
                  size: 22,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                consultant.rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




/*

Now it's looks good, image is going under notification bar of mobile
fix this issue
*/