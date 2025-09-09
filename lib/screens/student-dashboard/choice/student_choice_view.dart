import 'package:eduwise/configs/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'student_choice_controller.dart';
import 'student_choice_form.dart';

class StudentChoiceScreen extends StatelessWidget {
  const StudentChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentChoiceController(), permanent: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Choice"),
        backgroundColor: TColors.secondary,
      ),
      body: Obx(() {
        final choices = controller.choices;

        if (choices.isEmpty) {
          return const Center(child: Text("No data available"));
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          itemCount: choices.length,
          itemBuilder: (context, index) {
            final c = choices[index];
            final isEven = index % 2 == 0;

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isEven ? Colors.grey.shade50 : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Service Name
                      Text(
                        "${index + 1}. ${c.service}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: TColors.secondary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      _infoRow("Country", c.country, icon: Icons.flag),
                      _infoRow(
                        "Institution",
                        c.institution,
                        icon: Icons.school,
                      ),
                      _infoRow("Subject", c.subject, icon: Icons.book),
                      _infoRow(
                        "Session",
                        c.session,
                        icon: Icons.calendar_today,
                      ),
                      _infoRow("Budget", "${c.budget} BDT", icon: Icons.money),
                    ],
                  ),

                  /// Edit Icon Top Right
                  Positioned(
                    top: -15,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: TColors.secondary),
                      onPressed: () {
                        Get.snackbar(
                          "Info",
                          "Edit functionality not implemented.",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.secondary,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => const StudentChoiceForm());
        },
      ),
    );
  }

  /// Helper to build label + value rows
  Widget _infoRow(String label, String value, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: TColors.secondary),
            const SizedBox(width: 4),
          ],
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
