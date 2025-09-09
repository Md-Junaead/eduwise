// lib/screens/student-dashboard/profile/student_document_controller.dart
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class StudentDocumentController extends GetxController {
  // List of uploaded files
  var uploadedFiles = <PlatformFile>[].obs;

  /// Pick files using FilePicker
  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
    );

    if (result != null) {
      uploadedFiles.addAll(result.files);
    }
  }

  /// Remove file
  void removeFile(int index) {
    uploadedFiles.removeAt(index);
  }

  /// Save (here just demo: you can implement backend API)
  void saveFiles() {
    if (uploadedFiles.isEmpty) {
      Get.snackbar(
        "Error",
        "No files selected",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Demo: just print filenames
    for (var file in uploadedFiles) {
      print("Saving file: ${file.name}");
    }

    Get.snackbar(
      "Success",
      "Files saved successfully",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
