import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/all-consultant/all_consultant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eduwise/widget/custom_network_image.dart'; // 🔹 Your custom image loader

/// 🔹 Consultant Model
class Consultant {
  final String name;
  final String service;
  final String imageUrl;
  final double rating;

  Consultant({
    required this.name,
    required this.service,
    required this.imageUrl,
    required this.rating,
  });
}

/// 🔹 Consultant Provider (State Management)
class ConsultantProvider extends ChangeNotifier {
  final List<Consultant> _consultants = [
    Consultant(
      name: "John Doe",
      service: "Visa Processing Service",
      imageUrl:
          "https://eduwise.com.bd/storage/Users/1752048017_686e2191cb6a2.png",
      rating: 4.5,
    ),
    Consultant(
      name: "Jane Smith",
      service: "University Admission Service",
      imageUrl:
          "https://eduwise.com.bd/storage/Users/1752048777_686e24899bc8a.png",
      rating: 4.0,
    ),
    Consultant(
      name: "Jane Smith",
      service: "University Admission Service",
      imageUrl:
          "https://eduwise.com.bd/storage/Users/1752048777_686e24899bc8a.png",
      rating: 4.0,
    ),
    Consultant(
      name: "Jane Smith",
      service: "University Admission Service",
      imageUrl:
          "https://eduwise.com.bd/storage/Users/1752048777_686e24899bc8a.png",
      rating: 4.0,
    ),
    Consultant(
      name: "Jane Smith",
      service: "University Admission Service",
      imageUrl:
          "https://eduwise.com.bd/storage/Users/1752048777_686e24899bc8a.png",
      rating: 4.0,
    ),
    Consultant(
      name: "Jane Smith",
      service: "University Admission Service",
      imageUrl:
          "https://eduwise.com.bd/storage/Users/1752048777_686e24899bc8a.png",
      rating: 4.0,
    ),
    Consultant(
      name: "Jane Smith",
      service: "University Admission Service",
      imageUrl:
          "https://eduwise.com.bd/storage/Users/1752048777_686e24899bc8a.png",
      rating: 4.0,
    ),
    Consultant(
      name: "Jane Smith",
      service: "University Admission Service",
      imageUrl:
          "https://eduwise.com.bd/storage/Users/1752048777_686e24899bc8a.png",
      rating: 4.0,
    ),
    Consultant(
      name: "Jane Smith",
      service: "University Admission Service",
      imageUrl:
          "https://eduwise.com.bd/storage/Users/1752048777_686e24899bc8a.png",
      rating: 4.0,
    ),
    Consultant(
      name: "Jane Smith",
      service: "University Admission Service",
      imageUrl:
          "https://eduwise.com.bd/storage/Users/1752048777_686e24899bc8a.png",
      rating: 4.0,
    ),
  ];

  List<Consultant> get consultants => _consultants;
}

/// 🔹 Consultant Section Widget (You can call this on Home Screen)
class ConsultantSection extends StatelessWidget {
  const ConsultantSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConsultantProvider(),
      child: Consumer<ConsultantProvider>(
        builder: (context, provider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Section Title Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Our Consultant",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // ✅ Navigate to ConsultantScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllConsultantScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // 🔹 Consultant Card List
              SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.consultants.length,
                  itemBuilder: (context, index) {
                    final consultant = provider.consultants[index];
                    return ConsultantCard(consultant: consultant);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// 🔹 Consultant Card Widget
class ConsultantCard extends StatelessWidget {
  final Consultant consultant;

  const ConsultantCard({super.key, required this.consultant});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(left: 16, right: 8, bottom: 16),
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

          // 🔹 Service
          Text(
            consultant.service,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 6),

          // 🔹 Star Rating
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

          // 🔹 Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // ✅ View Profile Action
                  },
                  style:
                      OutlinedButton.styleFrom(
                        foregroundColor: Colors.black, // default text color
                        backgroundColor:
                            Colors.transparent, // default transparent
                        side: const BorderSide(
                          color: Colors.grey,
                        ), // subtle border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ).copyWith(
                        // 🔹 On press → turns red
                        overlayColor: WidgetStateProperty.all(
                          TColors.primary.withOpacity(0.2),
                        ),
                        foregroundColor: WidgetStateProperty.resolveWith((
                          states,
                        ) {
                          if (states.contains(WidgetState.pressed)) {
                            return Colors
                                .white; // text turns white when pressed
                          }
                          return Colors.black;
                        }),
                        backgroundColor: WidgetStateProperty.resolveWith((
                          states,
                        ) {
                          if (states.contains(WidgetState.pressed)) {
                            return TColors.primary; // background turns red
                          }
                          return Colors.transparent;
                        }),
                      ),
                  child: const Text("Profile"),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // ✅ Contact Action
                  },
                  style:
                      OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ).copyWith(
                        overlayColor: WidgetStateProperty.all(
                          TColors.primary.withOpacity(0.2),
                        ),
                        foregroundColor: WidgetStateProperty.resolveWith((
                          states,
                        ) {
                          if (states.contains(WidgetState.pressed)) {
                            return Colors.white;
                          }
                          return Colors.black;
                        }),
                        backgroundColor: WidgetStateProperty.resolveWith((
                          states,
                        ) {
                          if (states.contains(WidgetState.pressed)) {
                            return TColors.primary;
                          }
                          return Colors.transparent;
                        }),
                      ),
                  child: const Text("Service"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
