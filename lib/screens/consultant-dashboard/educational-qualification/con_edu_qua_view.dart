import 'package:eduwise/screens/consultant-dashboard/educational-qualification/con_edu_qua_ctrl.dart';
import 'package:eduwise/screens/consultant-dashboard/educational-qualification/con_edu_qua_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduwise/configs/constants/colors.dart';

class ConsultantEducationScreen extends StatelessWidget {
  const ConsultantEducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConsultantEducationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Educational Qualification"),
        backgroundColor: TColors.primary,
      ),
      body: Obx(() {
        if (controller.educations.isEmpty) {
          return const Center(child: Text("No education added"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.educations.length,
          itemBuilder: (context, index) {
            final edu = controller.educations[index];
            return Dismissible(
              key: Key(edu.title + edu.institution),
              background: Container(
                color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Icon(Icons.edit, color: Colors.white),
              ),
              secondaryBackground: Container(
                color: TColors.primary,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.startToEnd) {
                  // ---------------- Edit ----------------
                  controller.tempTitle.value = edu.title;
                  controller.tempGrade.value = edu.grade;
                  controller.tempDuration.value = edu.duration;
                  controller.tempPassingYear.value = edu.passingYear;
                  controller.tempInstitution.value = edu.institution;
                  controller.tempCertificate.value = edu.certificate;

                  Get.to(() => ConsultantEducationForm())!.then((_) {
                    controller.clearTempFields();
                  });
                  return false;
                } else if (direction == DismissDirection.endToStart) {
                  // ---------------- Delete ----------------
                  bool confirmed =
                      await Get.defaultDialog(
                        title: "Delete Education",
                        middleText:
                            "Are you sure you want to delete this education?",
                        textConfirm: "Yes",
                        textCancel: "No",
                        confirmTextColor: Colors.white,
                        onConfirm: () {
                          controller.educations.removeAt(index);
                          Get.back(result: true);
                        },
                        onCancel: () => Get.back(result: false),
                      ) ??
                      false;
                  return confirmed;
                }
                return false;
              },
              child: Card(
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
                      _infoRow("Title", edu.title),
                      _infoRow("Grade", edu.grade),
                      _infoRow("Duration", edu.duration),
                      _infoRow(
                        "Passing Year",
                        "${edu.passingYear.month}/${edu.passingYear.day}/${edu.passingYear.year}",
                      ),
                      _infoRow("Institution", edu.institution),
                      if (edu.certificate.isNotEmpty)
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Certificate: ${edu.certificate}",
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "View",
                                style: TextStyle(fontSize: 12),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: TColors.primary,
                                minimumSize: const Size(60, 32),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => ConsultantEducationForm()),
        icon: const Icon(Icons.add),
        label: const Text("Add Education"),
        backgroundColor: TColors.primary,
      ),
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
}
