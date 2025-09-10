// lib/screens/student-dashboard/academic/student_academic_screen.dart
import 'package:eduwise/screens/student-dashboard/qualification/student-academic/stu_aca_contruller.dart';
import 'package:eduwise/screens/student-dashboard/qualification/student-academic/stu_aca_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduwise/configs/constants/colors.dart';

class StudentAcademicScreen extends StatelessWidget {
  const StudentAcademicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Controller as permanent
    final controller = Get.put(StudentAcademicController(), permanent: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Academic Profile"),
        backgroundColor: TColors.secondary,
      ),
      body: Obx(() {
        final academics = controller.academics;

        if (academics.isEmpty) {
          return const Center(
            child: Text(
              "No academic data available",
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        // Filter Bangla Medium UG + any PG info
        final filtered = academics.where((a) {
          // UG Bangla Medium
          final isUGBangla =
              a.academicStatus == "Under Graduate" &&
              a.medium == "Bangla Medium";
          // PG (any medium)
          final isPG = a.academicStatus == "Post Graduate";
          return isUGBangla || isPG;
        }).toList();

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          itemCount: filtered.length,
          itemBuilder: (context, idx) {
            final a = filtered[idx];
            final isEven = idx % 2 == 0;

            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                initiallyExpanded: true,
                backgroundColor: isEven ? Colors.grey.shade50 : Colors.white,
                title: Text(
                  "${a.academicStatus} — ${a.medium}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: TColors.secondary,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ----------------- UG Bangla Medium -----------------
                        if (a.academicStatus == "Under Graduate" &&
                            a.medium == "Bangla Medium") ...[
                          _infoRow("SSC GPA", a.sscGpa ?? "-"),
                          _fileViewRow("SSC Certificate", a.sscCertificate),
                          const SizedBox(height: 6),
                          _infoRow("HSC GPA", a.hscGpa ?? "-"),
                          _fileViewRow("HSC Certificate", a.hscCertificate),
                        ],

                        // ----------------- PG -----------------
                        if (a.academicStatus == "Post Graduate") ...[
                          _infoRow(
                            "Graduation Title",
                            a.graduationTitle ?? "-",
                          ),
                          _infoRow("Grade / CGPA", a.graduationGrade ?? "-"),
                          _infoRow("Duration", a.graduationDuration ?? "-"),
                          _infoRow("Department", a.graduationDept ?? "-"),
                          _infoRow(
                            "Start Date",
                            a.gradStartDate != null
                                ? "${a.gradStartDate!.month}/${a.gradStartDate!.day}/${a.gradStartDate!.year}"
                                : "-",
                          ),
                          _infoRow(
                            "End Date",
                            a.gradEndDate != null
                                ? "${a.gradEndDate!.month}/${a.gradEndDate!.day}/${a.gradEndDate!.year}"
                                : "-",
                          ),
                          _fileViewRow(
                            "Graduation Certificate",
                            a.graduationCertificate,
                          ),
                        ],

                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Get.to(() => const StudentAcademicForm());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: const Icon(Icons.edit, size: 16),
                            label: const Text(
                              "Edit",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  /// ----------------- Info Row -----------------
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }

  /// ----------------- File View Row -----------------
  Widget _fileViewRow(String label, String? fileName) {
    if (fileName == null || fileName.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          OutlinedButton(
            onPressed: () async {
              // final url =
              //     "https://yourserver.com/files/$fileName"; // replace with your URL
              // if (await canLaunchUrl(Uri.parse(url))) {
              //   await launchUrl(Uri.parse(url));
              // }
            },
            child: const Text("View", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
