// ------------------- student_choice_controller.dart -------------------
import 'package:eduwise/screens/student-dashboard/choice/student_choice_model.dart';
import 'package:get/get.dart';

/// ✅ GetX Controller to manage StudentChoice data
class StudentChoiceController extends GetxController {
  /// ------------------- Data Structure -------------------
  /// RxList = reactive list that updates UI automatically
  final RxList<StudentChoice> choices = <StudentChoice>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadDemoData(); // Load 10 demo entries when controller initializes
  }

  /// ------------------- Algorithm -------------------
  /// Load 10 demo choices
  void _loadDemoData() {
    final List<StudentChoice> demo = [
      StudentChoice(
        service: "Assessment",
        country: "Canada",
        institution: "University of Toronto",
        subject: "Computer Science",
        session: "2025-09-01",
        budget: "150000",
      ),
      StudentChoice(
        service: "Visa Processing Service",
        country: "USA",
        institution: "MIT",
        subject: "Data Science",
        session: "2025-09-15",
        budget: "200000",
      ),
      StudentChoice(
        service: "File Processing Service",
        country: "UK",
        institution: "University of Oxford",
        subject: "Business Management",
        session: "2025-10-01",
        budget: "180000",
      ),
      StudentChoice(
        service: "Ticketing update Service",
        country: "Australia",
        institution: "University of Sydney",
        subject: "Engineering",
        session: "2025-11-01",
        budget: "120000",
      ),
      StudentChoice(
        service: "Corresponding Service",
        country: "Germany",
        institution: "TU Munich",
        subject: "Mechanical Engineering",
        session: "2025-09-10",
        budget: "130000",
      ),
      StudentChoice(
        service: "Assessment",
        country: "France",
        institution: "Sorbonne University",
        subject: "Philosophy",
        session: "2025-09-05",
        budget: "90000",
      ),
      StudentChoice(
        service: "Features Service",
        country: "Japan",
        institution: "University of Tokyo",
        subject: "Robotics",
        session: "2025-09-20",
        budget: "170000",
      ),
      StudentChoice(
        service: "Visa Processing Service",
        country: "Canada",
        institution: "McGill University",
        subject: "Medicine",
        session: "2025-09-25",
        budget: "250000",
      ),
      StudentChoice(
        service: "File Processing Service",
        country: "USA",
        institution: "Stanford University",
        subject: "AI & ML",
        session: "2025-10-10",
        budget: "220000",
      ),
      StudentChoice(
        service: "Ticketing update Service",
        country: "UK",
        institution: "Imperial College London",
        subject: "Civil Engineering",
        session: "2025-11-05",
        budget: "140000",
      ),
    ];

    // Add demo data to RxList (Algorithm O(n))
    choices.addAll(demo);
  }

  /// Clear all choices
  void clearChoice() {
    choices.clear(); // O(n)
  }
}
