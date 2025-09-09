import 'package:get/get.dart';
import 'student_form_model.dart';

/// 📌 GetX Controller to manage StudentChoice data
class StudentChoiceController extends GetxController {
  /// ------------------- Data Structure -------------------
  /// RxList = reactive list that updates UI automatically
  final RxList<StudentChoice> choices = <StudentChoice>[].obs;

  /// ------------------- Algorithm -------------------
  /// Save a new choice to the list
  void saveChoice(StudentChoice choice) {
    choices.add(choice); // O(1) append operation
  }

  /// Clear all choices
  void clearChoice() {
    choices.clear(); // O(n) to clear
  }
}

// import 'package:flutter/material.dart';
// import 'student_form_model.dart';

// /// 📌 Provider to manage StudentChoice data
// class StudentChoiceProvider extends ChangeNotifier {
//   /// ------------------- Data Structure -------------------
//   /// Using List<StudentChoice> to store all saved choices
//   final List<StudentChoice> _choices = [];

//   /// Public getter to access saved choices
//   List<StudentChoice> get choices => _choices;

//   /// ------------------- Algorithm -------------------
//   /// Save a new choice to the list
//   void saveChoice(StudentChoice choice) {
//     _choices.add(choice); // O(1) append operation
//     notifyListeners();
//   }

//   /// Clear all choices or reset (can be expanded per requirements)
//   void clearChoice() {
//     _choices.clear(); // O(n) to clear
//     notifyListeners();
//   }
// }
