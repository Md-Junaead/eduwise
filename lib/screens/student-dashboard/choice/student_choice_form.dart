import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/student-dashboard/choice/student_choice_controller.dart';
import 'package:eduwise/screens/student-dashboard/choice/student_form_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 📌 Reusable Form Section for Student Choice
class StudentChoiceForm extends StatefulWidget {
  const StudentChoiceForm({super.key});

  @override
  State<StudentChoiceForm> createState() => _StudentChoiceFormState();
}

class _StudentChoiceFormState extends State<StudentChoiceForm> {
  final _formKey = GlobalKey<FormState>();

  // ------------------- Controllers -------------------
  final countryController = TextEditingController();
  final institutionController = TextEditingController();
  final subjectController = TextEditingController();
  final budgetController = TextEditingController();

  // ------------------- Dropdown + Date -------------------
  String? selectedService;
  DateTime? selectedSession;

  // Service list
  final List<String> services = [
    "Assessment",
    "File Processing Service",
    "Visa Processing Service",
    "Corresponding Service",
    "Ticketing update Service",
    "Features Service",
  ];

  @override
  Widget build(BuildContext context) {
    /// ✅ Get the controller instance
    final controller = Get.find<StudentChoiceController>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildDropdown(),
              const SizedBox(height: 8),

              _buildField(
                countryController,
                "Your Preferred Country",
                Icons.flag,
              ),
              const SizedBox(height: 8),

              _buildField(
                institutionController,
                "Your Preferred Institution",
                Icons.school,
              ),
              const SizedBox(height: 8),

              _buildField(
                subjectController,
                "Your Preferred Subject",
                Icons.book,
              ),
              const SizedBox(height: 8),

              _buildDatePicker(),
              const SizedBox(height: 8),

              _buildField(
                budgetController,
                "Your Budget (BDT)",
                Icons.money,
                isNumber: true,
              ),
              const SizedBox(height: 22),

              // ------------------- Buttons -------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 🔹 Clear Button
                  _modernButton(
                    label: "Clear",
                    icon: Icons.clear,
                    color1: Colors.white,
                    color2: Colors.white,
                    onTap: () {
                      _formKey.currentState?.reset();
                      setState(() {
                        selectedService = null;
                        selectedSession = null;
                      });
                      countryController.clear();
                      institutionController.clear();
                      subjectController.clear();
                      budgetController.clear();

                      // ✅ Clear all choices in controller
                      controller.clearChoice();
                    },
                  ),

                  // 🔹 Save Button
                  _modernButton(
                    label: "Save",
                    icon: Icons.save,
                    color1: TColors.white,
                    color2: TColors.white,
                    onTap: () {
                      if (_formKey.currentState!.validate() &&
                          selectedService != null &&
                          selectedSession != null) {
                        final choice = StudentChoice(
                          service: selectedService!,
                          country: countryController.text,
                          institution: institutionController.text,
                          subject: subjectController.text,
                          session:
                              "${selectedSession!.year}-${selectedSession!.month.toString().padLeft(2, '0')}-${selectedSession!.day.toString().padLeft(2, '0')}",
                          budget: budgetController.text,
                        );

                        // ✅ Save choice to controller
                        controller.saveChoice(choice);

                        // ✅ Show snackbar
                        Get.snackbar(
                          "Success",
                          "✅ Data Saved Successfully!",
                          snackPosition: SnackPosition.BOTTOM,
                        );

                        // ✅ Optional: Clear form after save
                        _formKey.currentState?.reset();
                        setState(() {
                          selectedService = null;
                          selectedSession = null;
                        });
                        countryController.clear();
                        institutionController.clear();
                        subjectController.clear();
                        budgetController.clear();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------- Dropdown Builder -------------------
  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedService,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.design_services, color: Colors.red),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: "Select a Service",
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 12,
        ),
      ),
      items: services
          .map(
            (service) => DropdownMenuItem(value: service, child: Text(service)),
          )
          .toList(),
      onChanged: (value) => setState(() => selectedService = value),
      validator: (val) => val == null ? "⚠️ Please select a service" : null,
    );
  }

  // ------------------- Date Picker Builder -------------------
  Widget _buildDatePicker() {
    return InkWell(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) setState(() => selectedSession = pickedDate);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_today, color: Colors.red),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: "Your Preferred Session/Year",
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 12,
          ),
        ),
        child: Text(
          selectedSession == null
              ? "Your Prefered Session/Year"
              : "${selectedSession!.year}-${selectedSession!.month.toString().padLeft(2, '0')}-${selectedSession!.day.toString().padLeft(2, '0')}",
        ),
      ),
    );
  }

  // ------------------- Input Field Builder -------------------
  Widget _buildField(
    TextEditingController controller,
    String hint,
    IconData icon, {
    bool isNumber = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.red),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 12,
        ),
      ),
      validator: (val) =>
          val == null || val.isEmpty ? "⚠️ $hint is required" : null,
    );
  }

  // ------------------- Modern Interactive Button -------------------
  Widget _modernButton({
    required String label,
    required IconData icon,
    required Color color1,
    required Color color2,
    required VoidCallback onTap,
  }) {
    bool isPressed = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          width: 140,
          height: 40,
          child: InkWell(
            onTap: () {
              setState(() => isPressed = false);
              onTap();
            },
            onTapDown: (_) => setState(() => isPressed = true),
            onTapCancel: () => setState(() => isPressed = false),
            borderRadius: BorderRadius.circular(14),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isPressed
                      ? [TColors.primary, TColors.primary]
                      : [color1, color2],
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: isPressed ? Colors.white : TColors.secondary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      color: isPressed ? Colors.white : TColors.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// import 'package:eduwise/configs/constants/colors.dart';
// import 'package:eduwise/screens/student-dashboard/choice/student_form_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'student_choice_provider.dart';

// /// 📌 Reusable Form Section for Student Choice
// class StudentChoiceForm extends StatefulWidget {
//   const StudentChoiceForm({super.key});

//   @override
//   State<StudentChoiceForm> createState() => _StudentChoiceFormState();
// }

// class _StudentChoiceFormState extends State<StudentChoiceForm> {
//   final _formKey = GlobalKey<FormState>();

//   // ------------------- Controllers -------------------
//   final countryController = TextEditingController();
//   final institutionController = TextEditingController();
//   final subjectController = TextEditingController();
//   final budgetController = TextEditingController();

//   // ------------------- Dropdown + Date -------------------
//   String? selectedService;
//   DateTime? selectedSession;

//   // Service list
//   final List<String> services = [
//     "Assessment",
//     "File Processing Service",
//     "Visa Processing Service",
//     "Corresponding Service",
//     "Ticketing update Service",
//     "Features Service",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // ✅ Use global provider from MultiProvider
//     final provider = context.read<StudentChoiceProvider>();

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               const SizedBox(height: 10),
//               _buildDropdown(),
//               const SizedBox(height: 8),

//               _buildField(
//                 countryController,
//                 "Your Preferred Country",
//                 Icons.flag,
//               ),
//               const SizedBox(height: 8),

//               _buildField(
//                 institutionController,
//                 "Your Preferred Institution",
//                 Icons.school,
//               ),
//               const SizedBox(height: 8),

//               _buildField(
//                 subjectController,
//                 "Your Preferred Subject",
//                 Icons.book,
//               ),
//               const SizedBox(height: 8),

//               _buildDatePicker(),
//               const SizedBox(height: 8),

//               _buildField(
//                 budgetController,
//                 "Your Budget (BDT)",
//                 Icons.money,
//                 isNumber: true,
//               ),
//               const SizedBox(height: 22),

//               // ------------------- Buttons -------------------
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // 🔹 Clear Button
//                   _modernButton(
//                     label: "Clear",
//                     icon: Icons.clear,
//                     color1: Colors.white,
//                     color2: Colors.white,
//                     onTap: () {
//                       _formKey.currentState?.reset();
//                       setState(() {
//                         selectedService = null;
//                         selectedSession = null;
//                       });
//                       countryController.clear();
//                       institutionController.clear();
//                       subjectController.clear();
//                       budgetController.clear();

//                       // ✅ Clear all choices in provider
//                       provider.clearChoice();
//                     },
//                   ),

//                   // 🔹 Save Button
//                   _modernButton(
//                     label: "Save",
//                     icon: Icons.save,
//                     color1: TColors.white,
//                     color2: TColors.white,
//                     onTap: () {
//                       if (_formKey.currentState!.validate() &&
//                           selectedService != null &&
//                           selectedSession != null) {
//                         final choice = StudentChoice(
//                           service: selectedService!,
//                           country: countryController.text,
//                           institution: institutionController.text,
//                           subject: subjectController.text,
//                           session:
//                               "${selectedSession!.year}-${selectedSession!.month.toString().padLeft(2, '0')}-${selectedSession!.day.toString().padLeft(2, '0')}",
//                           budget: budgetController.text,
//                         );

//                         // ✅ Save choice to global provider (real-time)
//                         provider.saveChoice(choice);

//                         // ✅ Show snackbar
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text("✅ Data Saved Successfully!"),
//                           ),
//                         );

//                         // ✅ Optional: Clear form after save
//                         _formKey.currentState?.reset();
//                         setState(() {
//                           selectedService = null;
//                           selectedSession = null;
//                         });
//                         countryController.clear();
//                         institutionController.clear();
//                         subjectController.clear();
//                         budgetController.clear();
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ------------------- Dropdown Builder -------------------
//   Widget _buildDropdown() {
//     return DropdownButtonFormField<String>(
//       value: selectedService,
//       decoration: InputDecoration(
//         prefixIcon: const Icon(Icons.design_services, color: Colors.red),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         hintText: "Select a Service",
//         contentPadding: const EdgeInsets.symmetric(
//           vertical: 18,
//           horizontal: 12,
//         ),
//       ),
//       items: services
//           .map(
//             (service) => DropdownMenuItem(value: service, child: Text(service)),
//           )
//           .toList(),
//       onChanged: (value) => setState(() => selectedService = value),
//       validator: (val) => val == null ? "⚠️ Please select a service" : null,
//     );
//   }

//   // ------------------- Date Picker Builder -------------------
//   Widget _buildDatePicker() {
//     return InkWell(
//       onTap: () async {
//         final pickedDate = await showDatePicker(
//           context: context,
//           initialDate: DateTime.now(),
//           firstDate: DateTime(2020),
//           lastDate: DateTime(2100),
//         );
//         if (pickedDate != null) setState(() => selectedSession = pickedDate);
//       },
//       child: InputDecorator(
//         decoration: InputDecoration(
//           prefixIcon: const Icon(Icons.calendar_today, color: Colors.red),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//           hintText: "Your Preferred Session/Year",
//           contentPadding: const EdgeInsets.symmetric(
//             vertical: 18,
//             horizontal: 12,
//           ),
//         ),
//         child: Text(
//           selectedSession == null
//               ? "Your Prefered Session/Year"
//               : "${selectedSession!.year}-${selectedSession!.month.toString().padLeft(2, '0')}-${selectedSession!.day.toString().padLeft(2, '0')}",
//         ),
//       ),
//     );
//   }

//   // ------------------- Input Field Builder -------------------
//   Widget _buildField(
//     TextEditingController controller,
//     String hint,
//     IconData icon, {
//     bool isNumber = false,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: isNumber ? TextInputType.number : TextInputType.text,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: Colors.red),
//         hintText: hint,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         contentPadding: const EdgeInsets.symmetric(
//           vertical: 18,
//           horizontal: 12,
//         ),
//       ),
//       validator: (val) =>
//           val == null || val.isEmpty ? "⚠️ $hint is required" : null,
//     );
//   }

//   // ------------------- Modern Interactive Button -------------------
//   Widget _modernButton({
//     required String label,
//     required IconData icon,
//     required Color color1,
//     required Color color2,
//     required VoidCallback onTap,
//   }) {
//     bool isPressed = false;

//     return StatefulBuilder(
//       builder: (context, setState) {
//         return SizedBox(
//           width: 140,
//           height: 40,
//           child: InkWell(
//             onTap: () {
//               setState(() => isPressed = false);
//               onTap();
//             },
//             onTapDown: (_) => setState(() => isPressed = true),
//             onTapCancel: () => setState(() => isPressed = false),
//             borderRadius: BorderRadius.circular(14),
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 200),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: isPressed
//                       ? [TColors.primary, TColors.primary]
//                       : [color1, color2],
//                 ),
//                 borderRadius: BorderRadius.circular(14),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 6,
//                     offset: Offset(2, 2),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     icon,
//                     color: isPressed ? Colors.white : TColors.secondary,
//                     size: 20,
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     label,
//                     style: TextStyle(
//                       color: isPressed ? Colors.white : TColors.secondary,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
