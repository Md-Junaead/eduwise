// lib/configs/core/app_bindings.dart
import 'package:eduwise/screens/consultant-dashboard/add-service/con_ser_cre_ctrl.dart';
import 'package:eduwise/screens/consultant-dashboard/dashboard/con_dash_ctrl.dart';
import 'package:eduwise/screens/consultant-dashboard/educational-qualification/con_edu_qua_ctrl.dart';
import 'package:eduwise/screens/consultant-dashboard/experience/con_work_exp_ctrl.dart';
import 'package:eduwise/screens/default/all-consultant/demo_consultants.dart';
import 'package:eduwise/screens/default/consultant-profile/con_provider_model.dart';
import 'package:eduwise/screens/student-dashboard/choice/student_choice_controller.dart';
import 'package:eduwise/screens/student-dashboard/consultant/stu_cons_cont.dart';
import 'package:eduwise/screens/student-dashboard/dashboard/stu_db_contruller.dart';
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
    Get.put(StudentDashboardController);
    Get.put(ConsultantWorkExperienceController);
    Get.put(ConsultantServiceController);
    Get.put(ConsultantEducationController);
    Get.put(ConsultantDashboardController);

    // Register StudentConsultantController with all consultants
    Get.put(
      StudentConsultantController(
        allConsultants: ConsultantProfileProvider().consultants,
      ),
    );

    Get.put(StudentConsultantController(allConsultants: demoConsultants));
  }
}
