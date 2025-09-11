// lib/screens/consultant-dashboard/add-service/con_ser_cre_ctrl.dart
import 'package:get/get.dart';
import 'con_ser_cre_model.dart';

class ConsultantServiceController extends GetxController {
  /// ---------------- Reactive List for services ----------------
  /// RxList is used as a dynamic data structure to automatically update UI
  final RxList<ConsultantService> services = <ConsultantService>[].obs;

  /// ---------------- Temporary fields for form ----------------
  var tempServiceType = ''.obs;
  var tempTitle = ''.obs;
  var tempDescription = ''.obs;
  var tempCountry = ''.obs;
  var tempSubject = ''.obs;
  var tempCharge = 0.obs; // Changed to RxInt for whole numbers
  var tempDuration = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadDemoData(); // Load demo services on controller init
  }

  /// ---------------- Add or Publish Service ----------------
  void publishService() {
    if (tempServiceType.value.isEmpty || tempTitle.value.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // ---------------- Algorithm: Duplicate check ----------------
    // Check if a service with same title & type already exists
    bool exists = services.any(
      (s) =>
          s.title == tempTitle.value && s.serviceType == tempServiceType.value,
    );

    if (exists) {
      Get.snackbar(
        "Duplicate",
        "Service already exists",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Add service to RxList (efficient data structure for reactive UI updates)
    services.add(
      ConsultantService(
        serviceType: tempServiceType.value,
        title: tempTitle.value,
        description: tempDescription.value,
        country: tempCountry.value,
        subject: tempSubject.value,
        charge: tempCharge.value.toDouble(), // Model expects double
        duration: tempDuration.value,
      ),
    );

    // Clear temporary fields for next entry
    tempServiceType.value = '';
    tempTitle.value = '';
    tempDescription.value = '';
    tempCountry.value = '';
    tempSubject.value = '';
    tempCharge.value = 0;
    tempDuration.value = '';

    Get.snackbar(
      "Success",
      "Service Published",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// ---------------- Load Demo Data ----------------
  void _loadDemoData() {
    services.addAll([
      ConsultantService(
        serviceType: "Assessment",
        title: "College Admission Assessment",
        description: "We assess college admission chances for students",
        country: "USA",
        subject: "Admission",
        charge: 100.0,
        duration: "3 days",
      ),
      ConsultantService(
        serviceType: "Visa Processing Service",
        title: "Student Visa Assistance",
        description: "We help students to apply for visas smoothly",
        country: "Canada",
        subject: "Visa",
        charge: 200.0,
        duration: "5 days",
      ),
    ]);
  }
}
