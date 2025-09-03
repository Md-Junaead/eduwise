import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Top Section with gradient background (doubled height)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 80,
              ), // ⬅ doubled vertical padding
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE50405), // Your primary red
                    Color(0xFF7A1C1C), // Deep maroon/dark red for depth
                  ],
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
                  // Left side texts
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Find Your Ideal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18, // ⬅ slightly larger
                          ),
                        ),
                        SizedBox(height: 12), // ⬅ more gap
                        Text(
                          "University Abroad",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26, // ⬅ larger
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right side circular profile image
                  const CircleAvatar(
                    radius: 50, // ⬅ bigger avatar
                    backgroundImage: AssetImage(
                      "assets/images/home/hero/students/students.png",
                    ), // student image
                  ),
                ],
              ),
            ),

            // 🔎 Search Box (moved upward with margin-top -150)
            Transform.translate(
              offset: const Offset(0, -30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50, // ⬅ slightly taller search box for balance
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Search....",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Icon(Icons.close, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Example next section (can remove/replace)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Live Consultants",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
