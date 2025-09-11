import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduwise/screens/student-dashboard/choice/student_choice_view.dart';
import 'package:eduwise/screens/student-dashboard/consultant/stu_cons_view.dart';
import 'package:eduwise/screens/student-dashboard/profile/profile_view.dart';
import 'package:eduwise/screens/student-dashboard/qualification/student-academic/stu_aca_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ----------------- PREMIUM DASHBOARD (98/100) -----------------
class StudentDashBoardScreen extends StatelessWidget {
  const StudentDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {
        "title": "Account",
        "icon": Icons.person,
        "destination": const StudentProfileScreen(),
      },
      {
        "title": "Balance",
        "icon": Icons.account_balance_wallet,
        "destination": null,
      },
      {
        "title": "Your Choice",
        "icon": Icons.favorite,
        "destination": const StudentChoiceScreen(),
      },
      {
        "title": "Qualification",
        "icon": Icons.school,
        "destination": const StudentAcademicScreen(),
      },
      {"title": "Service", "icon": Icons.design_services, "destination": null},
      {
        "title": "Consultant",
        "icon": Icons.support_agent,
        "destination": const StudentConsultantScreen(),
      },
    ];

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
                      backgroundImage: CachedNetworkImageProvider(
                        "https://eduwise.com.bd/storage/CompanyDetail/1751975590_686d06a68f658.png",
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "John Doe",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Student ID: 123456",
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

              /// ---------- PROGRESS TRACKER ----------
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
                          value: 0.7, // demo 70%
                          backgroundColor: Colors.grey.shade300,
                          color: Colors.blue.shade700,
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "70% completed",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// ---------- QUICK ACTION CARDS ----------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: menuItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
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
                            "${item["title"]} is not available",
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
                            Icons.support_agent,
                            color: Colors.blue.shade700,
                          ),
                          title: const Text("Consulted with Mr. Smith"),
                          subtitle: const Text("2 days ago"),
                          contentPadding: EdgeInsets.zero,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.school,
                            color: Colors.blue.shade700,
                          ),
                          title: const Text("Uploaded SSC Certificate"),
                          subtitle: const Text("5 days ago"),
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

      /// ---------- LOGOUT BUTTON (bottom) ----------
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
    );
  }
}

// // lib/screens/student-dashboard/student_dashboard_screen.dart

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:eduwise/screens/student-dashboard/choice/student_choice_view.dart';
// import 'package:eduwise/screens/student-dashboard/consultant/stu_cons_view.dart';
// import 'package:eduwise/screens/student-dashboard/dashboard/stu_db_contruller.dart';
// import 'package:eduwise/screens/student-dashboard/profile/profile_view.dart';
// import 'package:eduwise/screens/student-dashboard/qualification/stu_high_edu_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// /// ----------------- UI SCREEN -----------------
// class StudentDashBoardScreen extends StatelessWidget {
//   const StudentDashBoardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(StudentDashboardController());

//     // ✅ Map of menu title → destination screen for fast O(1) lookup
//     final Map<String, Widget?> menuDestinationMap = {
//       "Account": const StudentProfileScreen(),
//       "Balance": null, // No destination
//       "Your Choice": const StudentChoiceScreen(),
//       "Qualification": const StudentHEScreen(),
//       "Service": null,
//       "Consultant": const StudentConsultantScreen(),
//       "Logout": null,
//     };

//     return Scaffold(
//       backgroundColor: Colors.blue.shade700, // Professional blue background
//       body: SafeArea(
//         child: Column(
//           children: [
//             /// ---------- PROFILE HEADER ----------
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade900,
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   const CircleAvatar(
//                     radius: 40,
//                     backgroundImage: CachedNetworkImageProvider(
//                       "https://eduwise.com.bd/storage/CompanyDetail/1751975590_686d06a68f658.png",
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "John Doe", // demo name
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     "Student ID: 123456",
//                     style: TextStyle(fontSize: 13, color: Colors.grey.shade300),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// ---------- MENU LIST ----------
//             Expanded(
//               child: ListView.separated(
//                 itemCount: controller.menuItems.length,
//                 separatorBuilder: (context, index) =>
//                     const SizedBox(height: 1), // small gap
//                 itemBuilder: (context, index) {
//                   final item = controller.menuItems[index];

//                   return Card(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 3,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     elevation: 5,
//                     child: ListTile(
//                       leading: Icon(
//                         item["icon"] as IconData,
//                         color: Colors.blue.shade700,
//                       ),
//                       title: Text(
//                         item["title"].toString(),
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       trailing: const Icon(Icons.arrow_forward_ios, size: 15),
//                       onTap: () {
//                         final Widget? destination =
//                             menuDestinationMap[item["title"].toString()];

//                         if (destination != null) {
//                           // ✅ Navigate using Navigator.push (suitable for large apps)
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => destination,
//                             ),
//                           );
//                         } else {
//                           // Optional: Show snackbar for no destination
//                           Get.snackbar(
//                             "Info",
//                             "${item["title"]} has no destination",
//                             snackPosition: SnackPosition.BOTTOM,
//                           );
//                         }
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
