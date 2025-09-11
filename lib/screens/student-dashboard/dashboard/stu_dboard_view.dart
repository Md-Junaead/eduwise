// lib/screens/student-dashboard/student_dashboard_screen.dart

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduwise/screens/student-dashboard/choice/student_choice_view.dart';
import 'package:eduwise/screens/student-dashboard/consultant/stu_cons_view.dart';
import 'package:eduwise/screens/student-dashboard/dashboard/stu_db_contruller.dart';
import 'package:eduwise/screens/student-dashboard/profile/profile_view.dart';
import 'package:eduwise/screens/student-dashboard/qualification/stu_high_edu_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ----------------- UI SCREEN -----------------
class StudentDashBoardScreen extends StatelessWidget {
  const StudentDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentDashboardController());

    // ✅ Map of menu title → destination screen for fast O(1) lookup
    final Map<String, Widget?> menuDestinationMap = {
      "Account": const StudentProfileScreen(),
      "Balance": null, // No destination
      "Your Choice": const StudentChoiceScreen(),
      "Qualification": const StudentHEScreen(),
      "Service": null,
      "Consultant": const StudentConsultantScreen(),
      "Logout": null,
    };

    return Scaffold(
      backgroundColor: Colors.blue.shade700, // Professional blue background
      body: SafeArea(
        child: Column(
          children: [
            /// ---------- PROFILE HEADER ----------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: CachedNetworkImageProvider(
                      "https://eduwise.com.bd/storage/CompanyDetail/1751975590_686d06a68f658.png",
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "John Doe", // demo name
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Student ID: 123456",
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade300),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ---------- MENU LIST ----------
            Expanded(
              child: ListView.separated(
                itemCount: controller.menuItems.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 1), // small gap
                itemBuilder: (context, index) {
                  final item = controller.menuItems[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 3,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(
                        item["icon"] as IconData,
                        color: Colors.blue.shade700,
                      ),
                      title: Text(
                        item["title"].toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                      onTap: () {
                        final Widget? destination =
                            menuDestinationMap[item["title"].toString()];

                        if (destination != null) {
                          // ✅ Navigate using Navigator.push (suitable for large apps)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => destination,
                            ),
                          );
                        } else {
                          // Optional: Show snackbar for no destination
                          Get.snackbar(
                            "Info",
                            "${item["title"]} has no destination",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// // lib/screens/student-dashboard/student_dashboard_screen.dart

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:eduwise/screens/student-dashboard/dashboard/stu_db_contruller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// /// ----------------- UI SCREEN -----------------
// class StudentDashBoardScreen extends StatelessWidget {
//   const StudentDashBoardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(StudentDashboardController());

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
//                     const SizedBox(height: 1), // 👈 5px gap
//                 itemBuilder: (context, index) {
//                   final item = controller.menuItems[index];
//                   return Card(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 3, // reduced since separator handles spacing
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
//                         // 👉 Handle navigation here
//                         Get.snackbar(
//                           "Clicked",
//                           "${item["title"]} tapped",
//                           snackPosition: SnackPosition.BOTTOM,
//                         );
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

// /*

// name: StudentDashBoardScreen
// This will act as a profile with link
// as you know how the profile screen works on mobile app
// There will be (Account, balance, Your Choise, Qualification, Service, Consultant, Logout)
// Give me a modern, Professional Design for it
// Background Color Blue, 
// font size 13 &
// Give me a good design 
// must use Algorithem & data structure for smoth experience
// use Getx for state management
// comment the code & tell me what you did
// give demo screen, i will change it



// */
