import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/student-dashboard/qualification/file-upload/student_document_controller.dart';
import 'package:eduwise/screens/student-dashboard/qualification/student-academic/stu_aca_contruller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ------------------- Student Academic Form -------------------
class StudentAcademicForm extends StatefulWidget {
  const StudentAcademicForm({super.key});

  @override
  State<StudentAcademicForm> createState() => _StudentAcademicFormState();
}

class _StudentAcademicFormState extends State<StudentAcademicForm> {
  final _formKey = GlobalKey<FormState>();

  String? selectedAcademicStatus; // UG / PG
  String? selectedMedium; // Bangla / English / Madrasha

  // Graduation section controllers
  final graduationTitleController = TextEditingController();
  final graduationGradeController = TextEditingController();
  final graduationDurationController = TextEditingController();
  final graduationDeptController = TextEditingController();
  DateTime? graduationStartDate;
  DateTime? graduationEndDate;

  /// ✅ Academic files map (each field holds its own file name)
  final Map<String, RxnString> academicFiles = {
    "hsc": RxnString(),
    "ssc": RxnString(),
    "oLevel": RxnString(),
    "aLevel": RxnString(),
    "dakhil": RxnString(),
    "alim": RxnString(),
    "graduation": RxnString(),
  };

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentAcademicController>();
    final docController = Get.put(StudentDocumentController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Academic Info"),
        backgroundColor: TColors.secondary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// ----------------- Academic Status -----------------
                DropdownButtonFormField<String>(
                  value: selectedAcademicStatus,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.school, color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Select Academic Status",
                  ),
                  items: ["Under Graduate", "Post Graduate"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) {
                    setState(() {
                      selectedAcademicStatus = v;
                      selectedMedium = null;
                    });
                  },
                ),
                const SizedBox(height: 16),

                /// ----------------- Post Graduate: Graduation Info -----------------
                if (selectedAcademicStatus == "Post Graduate") ...[
                  const Text(
                    "Your Graduation Info",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    graduationTitleController,
                    "Graduation Title",
                    Icons.title,
                  ),
                  const SizedBox(height: 8),
                  _buildField(
                    graduationGradeController,
                    "Grade/CGPA",
                    Icons.grade,
                  ),
                  const SizedBox(height: 8),
                  _buildField(
                    graduationDurationController,
                    "Duration",
                    Icons.timelapse,
                  ),
                  const SizedBox(height: 8),
                  _buildField(
                    graduationDeptController,
                    "Department/Subject",
                    Icons.book,
                  ),
                  const SizedBox(height: 8),
                  _buildDatePicker("Start Date", graduationStartDate, (picked) {
                    setState(() => graduationStartDate = picked);
                  }),
                  const SizedBox(height: 8),
                  _buildDatePicker("End Date", graduationEndDate, (picked) {
                    setState(() => graduationEndDate = picked);
                  }),
                  const SizedBox(height: 8),

                  /// ✅ Independent graduation file upload
                  _fileUploadPlaceholder(
                    "Graduation Certificate",
                    "graduation",
                    docController,
                  ),
                  const SizedBox(height: 20),
                ],

                /// ----------------- Medium Dropdown -----------------
                if (selectedAcademicStatus != null) ...[
                  DropdownButtonFormField<String>(
                    value: selectedMedium,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.language, color: Colors.red),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Select Medium",
                    ),
                    items:
                        ["Bangla Medium", "English Medium", "Madrasha Medium"]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                    onChanged: (v) => setState(() => selectedMedium = v),
                  ),
                  const SizedBox(height: 16),
                ],

                /// ----------------- Medium Specific Forms -----------------
                if (selectedMedium == "Bangla Medium") ...[
                  const Text(
                    "HSC Result (GPA)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  _buildField(
                    TextEditingController(),
                    "Enter Your HSC Grade",
                    Icons.grade,
                  ),
                  _fileUploadPlaceholder(
                    "HSC Certificate",
                    "hsc",
                    docController,
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    "SSC Result (GPA)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  _buildField(
                    TextEditingController(),
                    "Enter Your SSC Grade",
                    Icons.grade,
                  ),
                  _fileUploadPlaceholder(
                    "SSC Certificate",
                    "ssc",
                    docController,
                  ),
                ],
                if (selectedMedium == "English Medium") ...[
                  const Text(
                    "O Level Result",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  _buildField(
                    TextEditingController(),
                    "Enter Your O Level Result",
                    Icons.grade,
                  ),
                  _fileUploadPlaceholder(
                    "O Level Certificate",
                    "oLevel",
                    docController,
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    "A Level Result",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  _buildField(
                    TextEditingController(),
                    "Enter Your A Level Result",
                    Icons.grade,
                  ),
                  _fileUploadPlaceholder(
                    "A Level Certificate",
                    "aLevel",
                    docController,
                  ),
                ],
                if (selectedMedium == "Madrasha Medium") ...[
                  const Text(
                    "Dakhil Result",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  _buildField(
                    TextEditingController(),
                    "Enter Your Dakhil Result",
                    Icons.grade,
                  ),
                  _fileUploadPlaceholder(
                    "Dakhil Certificate",
                    "dakhil",
                    docController,
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    "Alim Result",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  _buildField(
                    TextEditingController(),
                    "Enter Your Alim Result",
                    Icons.grade,
                  ),
                  _fileUploadPlaceholder(
                    "Alim Certificate",
                    "alim",
                    docController,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ----------------- Reusable Input Field -----------------
  Widget _buildField(
    TextEditingController controller,
    String hint,
    IconData icon,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.red),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// ----------------- Date Picker -----------------
  Widget _buildDatePicker(
    String label,
    DateTime? date,
    Function(DateTime) onPicked,
  ) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) onPicked(picked);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_today, color: Colors.red),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: label,
        ),
        child: Text(
          date == null
              ? label
              : "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        ),
      ),
    );
  }

  /// ----------------- File Upload Placeholder -----------------
  Widget _fileUploadPlaceholder(
    String label,
    String key,
    StudentDocumentController docController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Obx(() {
          final fileName = academicFiles[key]!.value;
          return Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(fileName ?? "No file chosen"),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () async {
                  await docController.pickFiles();
                  if (docController.uploadedFiles.isNotEmpty) {
                    // ✅ Only store last picked file name for this key
                    final pickedFile = docController.uploadedFiles.last.name;
                    academicFiles[key]!.value = pickedFile;

                    Get.snackbar(
                      "Info",
                      "$label uploaded",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.secondary,
                ),
                child: const Text("Upload"),
              ),
            ],
          );
        }),
      ],
    );
  }
}
