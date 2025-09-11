// lib/screens/student-dashboard/profile/widget/certificate_section.dart
import 'package:eduwise/screens/student-dashboard/qualification/file-upload/student_document_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduwise/configs/constants/colors.dart';

class StudentCertificateSection extends StatelessWidget {
  const StudentCertificateSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentDocumentController());

    return Obx(() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Certificate / Documents",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.insert_drive_file, color: Colors.red, size: 23),
              ],
            ),
            const SizedBox(height: 8),

            /// 🔹 File list
            controller.uploadedFiles.isEmpty
                ? const Text(
                    "No Documents Found",
                    style: TextStyle(color: Colors.black54),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.uploadedFiles.length,
                    itemBuilder: (context, index) {
                      final file = controller.uploadedFiles[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(file.name, overflow: TextOverflow.ellipsis),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => controller.removeFile(index),
                        ),
                      );
                    },
                  ),

            const SizedBox(height: 16),

            /// 🔹 Modern Buttons Row
            Row(
              children: [
                /// Upload Button
                Expanded(
                  child: _modernButton(
                    label: "Upload",
                    icon: Icons.upload_file,
                    gradient: LinearGradient(
                      colors: [
                        TColors.primary,
                        TColors.primary.withOpacity(0.8),
                      ],
                    ),
                    onTap: controller.pickFiles,
                  ),
                ),
                const SizedBox(width: 12),

                /// Save Button
                Expanded(
                  child: _modernButton(
                    label: "Save",
                    icon: Icons.save,
                    gradient: LinearGradient(
                      colors: [
                        TColors.primary,
                        TColors.primary.withOpacity(0.8),
                      ],
                    ),
                    onTap: controller.saveFiles,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  /// 🔹 Custom Modern Button
  Widget _modernButton({
    required String label,
    required IconData icon,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
