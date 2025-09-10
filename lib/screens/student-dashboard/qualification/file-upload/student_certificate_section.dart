// // lib/screens/student-dashboard/qualification/file-upload/student_certificate_section.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:io';
// import 'student_document_controller.dart';

// class StudentCertificateSection extends StatelessWidget {
//   const StudentCertificateSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(StudentDocumentController());

//     // ✅ Reusable upload widget
//     Widget fileUploadTile(String key, String label) {
//       return Obx(() {
//         final file = controller.files[key]!.value;
//         return ListTile(
//           title: Text(label),
//           subtitle: Text(
//             file != null ? file.path.split('/').last : "No file selected",
//           ),
//           trailing: ElevatedButton(
//             onPressed: () => controller.pickFile(key),
//             child: const Text("Upload"),
//           ),
//         );
//       });
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "📄 Upload Documents",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),

//         // ✅ Independent file uploads
//         fileUploadTile("certificate", "Upload Certificate"),
//         fileUploadTile("marksheet", "Upload Marksheet"),
//         fileUploadTile("transcript", "Upload Transcript"),

//         const SizedBox(height: 20),

//         // ✅ Save button
//         Center(
//           child: ElevatedButton(
//             onPressed: controller.saveDocuments,
//             child: const Text("Save"),
//           ),
//         ),
//       ],
//     );
//   }
// }
