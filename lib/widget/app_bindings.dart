// lib/configs/core/app_bindings.dart
import 'package:eduwise/screens/student-dashboard/choice/student_choice_controller.dart';
import 'package:eduwise/screens/student-dashboard/qualification/file-upload/student_document_controller.dart';
import 'package:eduwise/screens/student-dashboard/qualification/student-academic/stu_aca_contruller.dart';
import 'package:get/get.dart';

/// ✅ Central place to register all GetX controllers & services
class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Global controllers & services
    Get.put(StudentChoiceController());
    Get.put(StudentDocumentController());
    Get.put(StudentAcademicController);
  }
}
