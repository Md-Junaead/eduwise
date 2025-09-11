// lib/screens/student-dashboard/consultant/consultant_work_experience_controller.dart
import 'package:eduwise/screens/consultant-dashboard/experience/con_work_exp_model.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class ConsultantWorkExperienceController extends GetxController {
  /// RxList is a reactive data structure for smooth UI updates
  final RxList<ConsultantWorkExperience> experiences =
      <ConsultantWorkExperience>[].obs;

  /// Temporary fields for form inputs
  var tempOrganization = ''.obs;
  var tempDesignation = ''.obs;
  var tempResponsibilities = ''.obs;
  var tempStartDate = Rxn<DateTime>();
  var tempEndDate = Rxn<DateTime>();
  var tempAnyDocument = RxnString();
  var tempResumeDocument = RxnString();

  @override
  void onInit() {
    super.onInit();
    _loadDemoData();
  }

  /// ---------------- Add Experience ----------------
  void addExperience() {
    if (tempOrganization.value.isEmpty || tempDesignation.value.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    experiences.add(
      ConsultantWorkExperience(
        organizationName: tempOrganization.value,
        designation: tempDesignation.value,
        responsibilities: tempResponsibilities.value,
        startDate: tempStartDate.value ?? DateTime.now(),
        endDate: tempEndDate.value ?? DateTime.now(),
        anyDocument: tempAnyDocument.value,
        resumeDocument: tempResumeDocument.value,
      ),
    );

    // Clear temp fields for next entry
    tempOrganization.value = '';
    tempDesignation.value = '';
    tempResponsibilities.value = '';
    tempStartDate.value = null;
    tempEndDate.value = null;
    tempAnyDocument.value = '';
    tempResumeDocument.value = '';

    Get.snackbar(
      "Success",
      "Experience added",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// ---------------- File Picker ----------------
  Future<void> pickDocument(RxnString docField) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );

    if (result != null && result.files.isNotEmpty) {
      docField.value = result.files.first.name;
    }
  }

  /// ---------------- Demo Data ----------------
  void _loadDemoData() {
    experiences.add(
      ConsultantWorkExperience(
        organizationName: "ABC Tech Solutions",
        designation: "Software Consultant",
        responsibilities: "Developed Flutter apps for clients",
        startDate: DateTime(2022, 1, 10),
        endDate: DateTime(2023, 8, 20),
        anyDocument: "project_doc.pdf",
        resumeDocument: "resume_demo.pdf",
      ),
    );
  }
}
