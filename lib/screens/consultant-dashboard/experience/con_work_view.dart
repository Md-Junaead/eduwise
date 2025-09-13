// lib/screens/student-dashboard/consultant/consultant_work_experience_screen.dart
import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/consultant-dashboard/experience/con_work_exp_ctrl.dart';
import 'package:eduwise/screens/consultant-dashboard/experience/con_work_exp_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsultantWorkExperienceScreen extends StatelessWidget {
  const ConsultantWorkExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConsultantWorkExperienceController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Work Experience"),
        backgroundColor: TColors.primary,
        elevation: 4,
      ),
      body: Obx(() {
        if (controller.experiences.isEmpty) {
          return const Center(
            child: Text(
              "No work experience added",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.experiences.length,
          itemBuilder: (context, idx) {
            final exp = controller.experiences[idx];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              shadowColor: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Organization
                    _infoRow("Organization", exp.organizationName),
                    const SizedBox(height: 4),
                    // Designation
                    _infoRow("Designation", exp.designation),
                    const SizedBox(height: 4),
                    // Responsibilities
                    _infoRow("Responsibilities", exp.responsibilities),
                    const SizedBox(height: 8),
                    // Start & End Dates
                    Row(
                      children: [
                        Expanded(
                          child: _infoRow(
                            "Start Date",
                            "${exp.startDate.month}/${exp.startDate.day}/${exp.startDate.year}",
                          ),
                        ),
                        Expanded(
                          child: _infoRow(
                            "End Date",
                            "${exp.endDate.month}/${exp.endDate.day}/${exp.endDate.year}",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Any Document
                    if (exp.anyDocument != null)
                      _fileViewRow("Document", exp.anyDocument!),
                    if (exp.resumeDocument != null)
                      _fileViewRow("Resume", exp.resumeDocument!),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: Obx(() {
        bool hasData = controller.experiences.isNotEmpty;
        return FloatingActionButton.extended(
          onPressed: () => Get.to(() => ConsultantWorkExperienceForm()),
          backgroundColor: TColors.primary,
          icon: Icon(hasData ? Icons.edit : Icons.add),
          label: Text(hasData ? "Update Experience" : "Add Experience"),
        );
      }),
    );
  }

  Widget _infoRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 13))),
      ],
    );
  }

  Widget _fileViewRow(String title, String fileName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                "$title: $fileName",
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () async {
              // TODO: Open file URL or file path
            },
            child: const Text("View", style: TextStyle(fontSize: 12)),
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.primary,
              minimumSize: const Size(60, 32),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
          ),
        ],
      ),
    );
  }
}
