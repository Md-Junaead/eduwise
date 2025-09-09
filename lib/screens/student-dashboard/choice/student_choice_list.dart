import 'package:eduwise/screens/student-dashboard/choice/student_choice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ------------------- Widget to display list of choices -------------------
class StudentChoiceList extends StatelessWidget {
  const StudentChoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentChoiceController>();

    /// ✅ Obx makes the ListView reactive
    return Obx(() {
      final choices = controller.choices;

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: choices.length,
        itemBuilder: (context, index) {
          final choice = choices[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Serial number & Service
                  Text(
                    "Service ${index + 1}: ${choice.service}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    "Country: ${choice.country}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Institution: ${choice.institution}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Subject: ${choice.subject}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Session/Year: ${choice.session}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Budget: ${choice.budget} BDT",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

// import 'package:eduwise/screens/student-dashboard/choice/student_choice_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// /// ------------------- Widget to display list of choices -------------------
// class StudentChoiceList extends StatelessWidget {
//   const StudentChoiceList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = context.watch<StudentChoiceProvider>();

//     /// ------------------- Data Structure -------------------
//     /// Using List<StudentChoice> to store multiple saved choices
//     /// This allows O(1) access by index and easy iteration
//     final choices = provider.choices;

//     /// ------------------- Algorithm -------------------
//     /// Sorting saved choices by creation order (if needed, here just display in order)
//     /// Simple for-loop to render each saved item with index
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: choices.length,
//       itemBuilder: (context, index) {
//         final choice = choices[index];

//         return Card(
//           elevation: 4,
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(14),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Serial number & Service
//                 Text(
//                   "Service ${index + 1}: ${choice.service}",
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red,
//                   ),
//                 ),
//                 const SizedBox(height: 6),

//                 // Country
//                 Text(
//                   "Country: ${choice.country}",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 4),

//                 // Institution
//                 Text(
//                   "Institution: ${choice.institution}",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 4),

//                 // Subject
//                 Text(
//                   "Subject: ${choice.subject}",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 4),

//                 // Session
//                 Text(
//                   "Session/Year: ${choice.session}",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 4),

//                 // Budget
//                 Text(
//                   "Budget: ${choice.budget} BDT",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
