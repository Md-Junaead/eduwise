// lib/screens/student-dashboard/academic/student_academic_screen.dart
import 'package:eduwise/screens/student-dashboard/qualification/student-academic/stu_aca_contruller.dart';
import 'package:eduwise/screens/student-dashboard/qualification/student-academic/stu_aca_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduwise/configs/constants/colors.dart';

class StudentAcademicScreen extends StatelessWidget {
  const StudentAcademicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Put controller as permanent like your StudentChoice example
    final controller = Get.put(StudentAcademicController(), permanent: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Academic"),
        backgroundColor: TColors.secondary,
      ),
      body: Obx(() {
        final items = controller.academics;

        if (items.isEmpty) {
          return const Center(child: Text("No academic data available"));
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          itemCount: items.length,
          itemBuilder: (context, idx) {
            final a = items[idx];
            final isEven = idx % 2 == 0;
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isEven ? Colors.grey.shade50 : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${idx + 1}. ${a.academicStatus} — ${a.medium}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: TColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 6),

                  if (a.academicStatus == "Under Graduate") ...[
                    if (a.medium == "Bangla Medium" ||
                        a.medium == "Madrasha Medium") ...[
                      _infoRow("HSC GPA", a.hscGpa ?? "-"),
                      _infoRow("SSC GPA", a.sscGpa ?? "-"),
                    ],
                    if (a.medium == "English Medium") ...[
                      _infoRow("O Level", a.oLevelResult ?? "-"),
                      _infoRow("A Level", a.aLevelResult ?? "-"),
                    ],
                  ],

                  if (a.academicStatus == "Post Graduate") ...[
                    _infoRow("Graduation Title", a.graduationTitle ?? "-"),
                    _infoRow("Grade/CGPA", a.graduationGrade ?? "-"),
                    _infoRow("Duration", a.graduationDuration ?? "-"),
                    _infoRow("Department", a.graduationDept ?? "-"),
                    _infoRow(
                      "Start Date",
                      a.gradStartDate != null
                          ? "${a.gradStartDate!.month}/${a.gradStartDate!.day}/${a.gradStartDate!.year}"
                          : "-",
                    ),
                    _infoRow(
                      "End Date",
                      a.gradEndDate != null
                          ? "${a.gradEndDate!.month}/${a.gradEndDate!.day}/${a.gradEndDate!.year}"
                          : "-",
                    ),
                  ],

                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => controller.removeAcademicAt(idx),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.secondary,
        child: const Icon(Icons.add),
        onPressed: () => Get.to(() => const StudentAcademicForm()),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

/*



code 1:
import 'package:eduwise/configs/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'student_choice_controller.dart';
import 'student_choice_form.dart';

class StudentChoiceScreen extends StatelessWidget {
  const StudentChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentChoiceController(), permanent: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Choice"),
        backgroundColor: TColors.secondary,
      ),
      body: Obx(() {
        final choices = controller.choices;

        if (choices.isEmpty) {
          return const Center(child: Text("No data available"));
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          itemCount: choices.length,
          itemBuilder: (context, index) {
            final c = choices[index];
            final isEven = index % 2 == 0;

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isEven ? Colors.grey.shade50 : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Service Name
                      Text(
                        "${index + 1}. ${c.service}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: TColors.secondary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      _infoRow("Country", c.country, icon: Icons.flag),
                      _infoRow(
                        "Institution",
                        c.institution,
                        icon: Icons.school,
                      ),
                      _infoRow("Subject", c.subject, icon: Icons.book),
                      _infoRow(
                        "Session",
                        c.session,
                        icon: Icons.calendar_today,
                      ),
                      _infoRow("Budget", "${c.budget} BDT", icon: Icons.money),
                    ],
                  ),

                  /// Edit Icon Top Right
                  Positioned(
                    top: -15,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: TColors.secondary),
                      onPressed: () {
                        Get.snackbar(
                          "Info",
                          "Edit functionality not implemented.",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.secondary,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => const StudentChoiceForm());
        },
      ),
    );
  }

  /// Helper to build label + value rows
  Widget _infoRow(String label, String value, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: TColors.secondary),
            const SizedBox(width: 4),
          ],
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}




Code 2:
// 📌 Data Model for StudentChoice
/// Data Structure: Plain Object Model (used in RxList)
class StudentChoice {
  final String service;
  final String country;
  final String institution;
  final String subject;
  final String session;
  final String budget;

  StudentChoice({
    required this.service,
    required this.country,
    required this.institution,
    required this.subject,
    required this.session,
    required this.budget,
  });

  /// Convert object to JSON (for APIs later)
  Map<String, dynamic> toJson() {
    return {
      "service": service,
      "country": country,
      "institution": institution,
      "subject": subject,
      "session": session,
      "budget": budget,
    };
  }
}




Code 3:
import 'package:eduwise/screens/student-dashboard/choice/student_choice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ------------------- Widget to display list of choices -------------------
class StudentChoiceList extends StatelessWidget {
  const StudentChoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentChoiceController>();

    /// ✅ Obx makes the ListView reactive
    /// Algorithm: Traverses RxList → O(n)
    return Obx(() {
      final choices = controller.choices;

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: choices.length,
        itemBuilder: (context, index) {
          final choice = choices[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Service ${index + 1}: ${choice.service}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    "Country: ${choice.country}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Institution: ${choice.institution}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Subject: ${choice.subject}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Session/Year: ${choice.session}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Budget: ${choice.budget} BDT",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}




Code 4:
import 'package:eduwise/configs/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'student_choice_controller.dart';

class StudentChoiceForm extends StatefulWidget {
  const StudentChoiceForm({super.key});

  @override
  State<StudentChoiceForm> createState() => _StudentChoiceFormState();
}

class _StudentChoiceFormState extends State<StudentChoiceForm> {
  final _formKey = GlobalKey<FormState>();

  final countryController = TextEditingController();
  final institutionController = TextEditingController();
  final subjectController = TextEditingController();
  final budgetController = TextEditingController();

  String? selectedService;
  DateTime? selectedSession;

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
    /// ✅ FIX: Use Get.find() instead of Get.put() in build
    final controller = Get.find<StudentChoiceController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Student Choice"),
        backgroundColor: TColors.secondary,
      ),
      body: SingleChildScrollView(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                        controller.clearChoice();
                      },
                    ),
                    _modernButton(
                      label: "Save",
                      icon: Icons.save,
                      color1: TColors.white,
                      color2: TColors.white,
                      onTap: () {
                        Get.snackbar(
                          "Info",
                          "Saving disabled. Demo data only displayed on list screen.",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
    );
  }

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
              ? "Your Preferred Session/Year"
              : "${selectedSession!.year}-${selectedSession!.month.toString().padLeft(2, '0')}-${selectedSession!.day.toString().padLeft(2, '0')}",
        ),
      ),
    );
  }

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
    );
  }

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




Code 5:
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





Task:
check my given code & i want same functionly for my studenAcademic part on my existing flutter project
Must use Algorithem, data structure for efficient code & getx state management for Proper state management
Write clean & structured code, 
Tell me what you did
comment the code for better understand
create demo data to check its function
specially comment the part you use for algorithm data structre & state management


For my StudentAcademic part we should have StudentAcademicForm:
Inside this form we have dropdown, Select Academic Status: (Under Graduate, post Graduate)



when select Under Graduate user will be see Select Medium dropdown: (Bangla Medium, English Medium, Madrasha Medium)

use Placeholder
when chose Bangla Medium:
HSC Result (GPA): - Heading
Enter Your HSC Grade - Input
HSC Certificate: - Upload File under 20mb
No file chosen 

SSC Result (GPA): - Heading
Enter Your SSC Grade - Input
SSC Certificate: - Upload File under 20mb
No file chosen



when chose English Medium:

O Level Result: - Heading
Enter Your O Level Result - Input
O Level Certificate: - Upload File under 20mb
No file chosen

A Level Result: -heading
Enter Your A Level Result - input
A Level Certificate: - Upload File under 20mb
No file chosen 

when chose Madrasha Medium: 

Dakhil Result: -heading
Enter Your Dakhil Result - input
Dakhil Certificate: - Upload File under 20mb
No file chosen

Alim Result: -heading
Enter Your Alim Result - input
Alim Certificate: - Upload File under 20mb
No file chosen




when select Post Graduate user will be see Select Medium dropdown: (Bangla Medium, English Medium, Madrasha Medium)

Use Place holder
Your Graduation Info: Title
Graduation Title: - Heading
Enter Your graduation title -Input
Enter Grade/CGPA: -Heading
Enter Your Grade/CGPA -Input
Duration: -Heading
Enter Duration -Input
Department/Subject: -Heading
Enter Your Department/subject - Input

Stat Date:
mm/dd/yyyy

End Date:
mm/dd/yyyy

Check Studentchoiceform to understand how this date picking works

Your Certificate: - heading
No file chosen - File upload option with placeholder






when chose Bangla Medium:
HSC Result (GPA): - Heading
Enter Your HSC Grade - Input
HSC Certificate: - Upload File under 20mb
No file chosen 

SSC Result (GPA): - Heading
Enter Your SSC Grade - Input
SSC Certificate: - Upload File under 20mb
No file chosen



when chose English Medium:

O Level Result: - Heading
Enter Your O Level Result - Input
O Level Certificate: - Upload File under 20mb
No file chosen

A Level Result: -heading
Enter Your A Level Result - input
A Level Certificate: - Upload File under 20mb
No file chosen 

when chose Madrasha Medium: 

Dakhil Result: -heading
Enter Your Dakhil Result - input
Dakhil Certificate: - Upload File under 20mb
No file chosen

Alim Result: -heading
Enter Your Alim Result - input
Alim Certificate: - Upload File under 20mb
No file chosen



*/
