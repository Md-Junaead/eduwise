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
        backgroundColor: TColors.secondary,
        // Removed Add icon from AppBar
      ),
      body: Obx(() {
        if (controller.experiences.isEmpty) {
          return const Center(child: Text("No work experience added"));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.experiences.length,
          itemBuilder: (context, idx) {
            final exp = controller.experiences[idx];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoRow("Organization", exp.organizationName),
                    _infoRow("Designation", exp.designation),
                    _infoRow("Responsibilities", exp.responsibilities),
                    _infoRow(
                      "Start Date",
                      "${exp.startDate.month}/${exp.startDate.day}/${exp.startDate.year}",
                    ),
                    _infoRow(
                      "End Date",
                      "${exp.endDate.month}/${exp.endDate.day}/${exp.endDate.year}",
                    ),
                    const SizedBox(height: 6),
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
        // Show Add icon if empty, else Edit icon
        bool hasData = controller.experiences.isNotEmpty;
        return FloatingActionButton(
          onPressed: () => Get.to(() => ConsultantWorkExperienceForm()),
          backgroundColor: TColors.secondary,
          child: Icon(hasData ? Icons.edit : Icons.add),
          tooltip: hasData ? "Update Experience" : "Add Experience",
        );
      }),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }

  Widget _fileViewRow(String title, String fileName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$title: $fileName",
              style: const TextStyle(fontSize: 13),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // Demo: open a URL (replace with real file path later)
              // final url = "https://www.example.com/$fileName";
              // if (await canLaunchUrl(Uri.parse(url))) {
              //   await launchUrl(Uri.parse(url));
              // }
            },
            child: const Text("View", style: TextStyle(fontSize: 12)),
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.secondary,
              minimumSize: const Size(60, 32),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
          ),
        ],
      ),
    );
  }
}
