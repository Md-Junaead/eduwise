import 'package:eduwise/screens/consultant-dashboard/dashboard/con_dash_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ---------------- IMPORT YOUR CONSULTANT SCREENS ----------------
/// Example imports - replace with actual file paths

/// ------------------- DASHBOARD VIEW -------------------
class ConsultantDashboardView extends StatelessWidget {
  const ConsultantDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConsultantDashboardController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// ---------- HEADER ----------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade900, Colors.blue.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        "https://eduwise.com.bd/storage/CompanyDetail/1751975590_686d06a68f658.png",
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Consultant Name",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Consultant ID: 987654",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// ---------- PROFILE COMPLETION TRACKER ----------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Profile Completion",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: 0.8, // demo 80%
                          backgroundColor: Colors.grey.shade300,
                          color: Colors.blue.shade700,
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "80% completed",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// ---------- QUICK ACTION GRID ----------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.menuItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    final item = controller.menuItems[index];
                    return GestureDetector(
                      onTap: () {
                        if (item["destination"] != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => item["destination"] as Widget,
                            ),
                          );
                        } else {
                          Get.snackbar(
                            "Info",
                            "${item["title"]} is not available yet",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item["icon"] as IconData,
                              size: 40,
                              color: Colors.blue.shade700,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item["title"].toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// ---------- RECENT ACTIVITY ----------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Recent Activity",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListTile(
                          leading: Icon(
                            Icons.menu_book,
                            color: Colors.blue.shade700,
                          ),
                          title: const Text("Added new Training Course"),
                          subtitle: const Text("1 day ago"),
                          contentPadding: EdgeInsets.zero,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.reviews,
                            color: Colors.blue.shade700,
                          ),
                          title: const Text("Received a 5-star Review"),
                          subtitle: const Text("3 days ago"),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 80), // space for logout button
            ],
          ),
        ),
      ),
      /*
      /// ---------- LOGOUT BUTTON ----------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          onPressed: () {
            Get.snackbar(
              "Logout",
              "You have been logged out.",
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          icon: const Icon(Icons.logout),
          label: const Text("Logout"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade600,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
      */
    );
  }
}
