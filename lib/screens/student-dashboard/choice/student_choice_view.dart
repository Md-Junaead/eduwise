import 'package:eduwise/screens/student-dashboard/choice/student_choice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduwise/screens/student-dashboard/choice/student_choice_list.dart';
import 'package:eduwise/screens/student-dashboard/choice/student_choice_form.dart';

class StudentChoiceScreen extends StatelessWidget {
  const StudentChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// ✅ Inject controller when screen opens
    Get.put(StudentChoiceController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Choices"),
        backgroundColor: Colors.red,
      ),
      body: const StudentChoiceList(), // ✅ Reactive list
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: () {
          // ✅ Navigate using GetX
          Get.to(() => const StudentChoiceForm());
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:eduwise/screens/student-dashboard/choice/student_choice_list.dart';
// import 'package:eduwise/screens/student-dashboard/choice/student_choice_form.dart';
// import 'package:provider/provider.dart';
// import 'student_choice_provider.dart';

// class StudentChoiceScreen extends StatelessWidget {
//   const StudentChoiceScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // ✅ Use the global provider
//     context.watch<StudentChoiceProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Student Choices"),
//         backgroundColor: Colors.red, // or your TColors.secondary
//       ),
//       body: const StudentChoiceList(), // ✅ List listens to provider
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.red,
//         child: const Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const StudentChoiceForm(),
//             ), // ✅
//           );
//         },
//       ),
//     );
//   }
// }
