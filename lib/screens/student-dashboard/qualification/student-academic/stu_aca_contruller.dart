// lib/screens/student-dashboard/academic/student_academic_controller.dart
import 'package:eduwise/screens/student-dashboard/qualification/student-academic/student_aca_model.dart';
import 'package:get/get.dart';

/// GetX Controller for StudentAcademic
/// - Uses RxList<StudentAcademic> for reactive state management
/// - Provides methods to add, remove, clear, and demo-load data
class StudentAcademicController extends GetxController {
  /// -------------------- Data Structure --------------------
  /// Use RxList (backed by a List) to store StudentAcademic entries.
  /// RxList gives O(1) append and O(n) clear/remove operations like a normal list,
  /// while allowing automatic UI updates via Obx().
  final RxList<StudentAcademic> academics = <StudentAcademic>[].obs;

  /// -------------------- Algorithm & Complexity Notes --------------------
  /// - addAcademic: O(1) append to list
  /// - removeAt(index): O(n) worst-case (list shift)
  /// - clearAll: O(n)
  /// These are standard list complexities and are acceptable for small-to-moderate lists.
  /// If you expect very large datasets, consider paginated storage or a different structure.
  ///
  /// State management: by using RxList and GetX, any Obx() or GetX widget observing
  /// `academics` will update automatically when the list changes. This separates UI
  /// from business logic.

  @override
  void onInit() {
    super.onInit();
    _loadDemoData();
  }

  /// Add a new academic entry
  void addAcademic(StudentAcademic item) {
    academics.add(item); // O(1)
  }

  /// Remove by index (if needed)
  void removeAcademicAt(int index) {
    if (index >= 0 && index < academics.length) {
      academics.removeAt(index); // O(n)
    }
  }

  /// Clear all entries
  void clearAll() {
    academics.clear(); // O(n)
  }

  /// Demo data to test UI / functionality
  void _loadDemoData() {
    final demo = [
      // Under Graduate - Bangla Medium
      StudentAcademic(
        academicStatus: "Under Graduate",
        medium: "Bangla Medium",
        hscGpa: "4.80",
        sscGpa: "5.00",
        hscCertificate: "hsc_cert_demo.pdf",
        sscCertificate: "ssc_cert_demo.pdf",
      ),

      // Under Graduate - English Medium
      StudentAcademic(
        academicStatus: "Under Graduate",
        medium: "English Medium",
        oLevelResult: "A A B",
        aLevelResult: "A B",
        oLevelCertificate: "olevel_demo.pdf",
        aLevelCertificate: "alevel_demo.pdf",
      ),

      // Under Graduate - Madrasha Medium
      StudentAcademic(
        academicStatus: "Under Graduate",
        medium: "Madrasha Medium",
        hscGpa: "4.50",
        sscGpa: "4.60",
        dakhilCertificate: "dakhil_demo.pdf",
        alimCertificate: "alim_demo.pdf",
      ),

      // Post Graduate - Bangla Medium (graduation info)
      StudentAcademic(
        academicStatus: "Post Graduate",
        medium: "Bangla Medium",
        graduationTitle: "BSc in Computer Science",
        graduationGrade: "3.75",
        graduationDuration: "4 years",
        graduationDept: "Computer Science",
        gradStartDate: DateTime(2019, 9, 1),
        gradEndDate: DateTime(2023, 6, 30),
        graduationCertificate: "graduation_demo.pdf",
      ),
    ];

    academics.addAll(demo); // O(n) to add all
  }
}
