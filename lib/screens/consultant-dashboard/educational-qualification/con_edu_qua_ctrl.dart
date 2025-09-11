// lib/screens/consultant-dashboard/education/consultant_education_controller.dart
import 'package:eduwise/screens/consultant-dashboard/educational-qualification/con_edu_qua_model.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class ConsultantEducationController extends GetxController {
  final RxList<ConsultantEducation> educations = <ConsultantEducation>[].obs;

  /// ---------------- Temporary fields for form ----------------
  var tempTitle = ''.obs;
  var tempGrade = ''.obs;
  var tempDuration = ''.obs;
  var tempPassingYear = Rxn<DateTime>();
  var tempInstitution = ''.obs;
  var tempCertificate = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadDemoData();
  }

  void addEducation({int? editIndex}) {
    if (tempTitle.value.isEmpty || tempGrade.value.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Duplicate check
    bool exists = educations.any(
      (e) =>
          e.title == tempTitle.value &&
          e.institution == tempInstitution.value &&
          (editIndex == null || educations.indexOf(e) != editIndex),
    );

    if (exists) {
      Get.snackbar(
        "Duplicate",
        "Education already exists",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    ConsultantEducation newEdu = ConsultantEducation(
      title: tempTitle.value,
      grade: tempGrade.value,
      duration: tempDuration.value,
      passingYear: tempPassingYear.value ?? DateTime.now(),
      institution: tempInstitution.value,
      certificate: tempCertificate.value,
    );

    if (editIndex != null) {
      educations[editIndex] = newEdu; // Edit
    } else {
      educations.add(newEdu); // Add new
    }

    clearTempFields();

    Get.snackbar(
      "Success",
      editIndex != null ? "Education Updated" : "Education Added",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void clearTempFields() {
    tempTitle.value = '';
    tempGrade.value = '';
    tempDuration.value = '';
    tempPassingYear.value = null;
    tempInstitution.value = '';
    tempCertificate.value = '';
  }

  Future<void> pickCertificate() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );

    if (result != null && result.files.isNotEmpty) {
      tempCertificate.value = result.files.first.name;
    }
  }

  void _loadDemoData() {
    educations.addAll([
      ConsultantEducation(
        title: "Bachelor of Science in Computer Science",
        grade: "3.75",
        duration: "4 years",
        passingYear: DateTime(2020, 5, 20),
        institution: "XYZ University",
        certificate: "bsc_certificate.pdf",
      ),
      ConsultantEducation(
        title: "Master of Science in Software Engineering",
        grade: "3.85",
        duration: "2 years",
        passingYear: DateTime(2022, 5, 25),
        institution: "ABC University",
        certificate: "msc_certificate.pdf",
      ),
    ]);
  }
}
