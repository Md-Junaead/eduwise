import 'package:eduwise/configs/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [TColors.primary, TColors.primaryLight],
          // colors: [Color(0xFFE50405), Color(0xFF7A1C1C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Find Your Ideal",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 12),
                Text(
                  "University Abroad",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Only changed image provider
          CircleAvatar(
            radius: 50,
            backgroundImage: CachedNetworkImageProvider(
              "https://eduwise.com.bd/storage/CompanyDetail/1751975590_686d06a68f658.png",
            ),
          ),
        ],
      ),
    );
  }
}
