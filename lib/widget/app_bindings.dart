// lib/configs/core/app_bindings.dart
import 'package:eduwise/screens/student-dashboard/choice/student_choice_controller.dart';
import 'package:get/get.dart';

/// ✅ Central place to register all GetX controllers & services
class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Global controllers & services
    Get.put(StudentChoiceController());
  }
}
