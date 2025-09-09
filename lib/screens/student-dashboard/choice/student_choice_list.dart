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
    /// Algorithm: Traverses RxList → O(n)
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
