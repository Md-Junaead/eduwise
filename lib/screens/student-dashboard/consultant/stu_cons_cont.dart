import 'package:eduwise/screens/default/consultant-profile/con_profile_model.dart';
import 'package:eduwise/screens/student-dashboard/choice/student_choice_controller.dart';
import 'package:eduwise/screens/student-dashboard/choice/student_choice_model.dart';
import 'package:get/get.dart';

class StudentConsultantController extends GetxController {
  final RxList<ConsultantProfileModel> filteredConsultants =
      <ConsultantProfileModel>[].obs;

  /// Reference to student choice controller
  final StudentChoiceController choiceController =
      Get.find<StudentChoiceController>();

  final List<ConsultantProfileModel> allConsultants;

  StudentConsultantController({required this.allConsultants});

  @override
  void onInit() {
    super.onInit();

    /// Show demo automatically
    applyFilters();

    /// Listen to student choices; if they change, filter dynamically
    ever(choiceController.choices, (_) {
      applyFilters();
    });
  }

  /// -----------------------------
  /// Main filtering method
  /// -----------------------------
  void applyFilters() {
    final choices = choiceController.choices;

    /// 1️⃣ If no choice exists, show all demo consultants
    if (choices.isEmpty) {
      filteredConsultants.assignAll(allConsultants);
      return;
    }

    /// 2️⃣ Else, filter based on student choices
    final Set<ConsultantProfileModel> results = {};

    for (var choice in choices) {
      results.addAll(filterByChoice(choice));
    }

    filteredConsultants.assignAll(results.toList());
  }

  /// -----------------------------
  /// Filter by a single StudentChoice
  /// -----------------------------
  List<ConsultantProfileModel> filterByChoice(StudentChoice choice) {
    return allConsultants.where((consultant) {
      return consultant.services.any((service) {
        final matchCountry =
            service.country.toLowerCase() == choice.country.toLowerCase();
        final matchService =
            service.serviceName.toLowerCase() == choice.service.toLowerCase();

        /// Optional: relax subject matching if necessary
        return matchCountry && matchService;
      });
    }).toList();
  }
}
