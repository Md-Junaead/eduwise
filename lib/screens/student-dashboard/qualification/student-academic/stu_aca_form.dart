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
        title: const Text("Academic Information"),
        backgroundColor: TColors.primary,
        elevation: 2,
      ),

      /// ✅ Modern Save button at bottom
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // 🔹 Collect all data here before saving
              Get.snackbar(
                "Success",
                "Academic Information Saved!",
                backgroundColor: Colors.green,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ), // 🔹 updated (smaller height)
            backgroundColor: TColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ), // 🔹 updated (slightly smaller radius)
            ),
            elevation: 3, // 🔹 updated
          ),
          icon: const Icon(
            Icons.save,
            size: 18,
            color: Colors.white,
          ), // 🔹 updated smaller icon
          label: const Text(
            "Save Academic Info",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ), // 🔹 updated smaller text
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14), // 🔹 updated
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// ----------------- Academic Status -----------------
                _sectionCard(
                  child: DropdownButtonFormField<String>(
                    value: selectedAcademicStatus,
                    decoration: _inputDecoration(
                      "Select Academic Status",
                      Icons.school,
                    ),
                    items: ["Under Graduate", "Post Graduate"]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 13,
                              ), // 🔹 updated
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        selectedAcademicStatus = v;
                        selectedMedium = null;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 18,
                    ), // 🔹 updated
                  ),
                ),

                /// ----------------- Post Graduate: Graduation Info -----------------
                if (selectedAcademicStatus == "Post Graduate") ...[
                  _sectionHeader("🎓 Your Graduation Info"),
                  _sectionCard(
                    child: Column(
                      children: [
                        _buildField(
                          graduationTitleController,
                          "Graduation Title",
                          Icons.workspace_premium,
                        ),
                        const SizedBox(height: 6),
                        _buildField(
                          graduationGradeController,
                          "Grade / CGPA",
                          Icons.grade,
                        ),
                        const SizedBox(height: 6),
                        _buildField(
                          graduationDurationController,
                          "Duration",
                          Icons.timelapse,
                        ),
                        const SizedBox(height: 6),
                        _buildField(
                          graduationDeptController,
                          "Department / Subject",
                          Icons.menu_book,
                        ),
                        const SizedBox(height: 6),
                        _buildDatePicker("Start Date", graduationStartDate, (
                          picked,
                        ) {
                          setState(() => graduationStartDate = picked);
                        }),
                        const SizedBox(height: 6),
                        _buildDatePicker("End Date", graduationEndDate, (
                          picked,
                        ) {
                          setState(() => graduationEndDate = picked);
                        }),
                        const SizedBox(height: 6),
                        _fileUploadPlaceholder(
                          "Graduation Certificate",
                          "graduation",
                          docController,
                        ),
                      ],
                    ),
                  ),
                ],

                /// ----------------- Medium Dropdown -----------------
                if (selectedAcademicStatus != null) ...[
                  _sectionHeader("🌐 Select Medium"),
                  _sectionCard(
                    child: DropdownButtonFormField<String>(
                      value: selectedMedium,
                      decoration: _inputDecoration(
                        "Select Medium",
                        Icons.language,
                      ),
                      items:
                          ["Bangla Medium", "English Medium", "Madrasha Medium"]
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ), // 🔹 updated
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (v) => setState(() => selectedMedium = v),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 18,
                      ), // 🔹 updated
                    ),
                  ),
                ],

                /// ----------------- Medium Specific Forms -----------------
                if (selectedMedium == "Bangla Medium") ...[
                  _sectionHeader("📑 HSC Result"),
                  _sectionCard(
                    child: Column(
                      children: [
                        _buildField(
                          TextEditingController(),
                          "Enter Your HSC Grade",
                          Icons.grade,
                        ),
                        const SizedBox(height: 10), // 🔹 updated
                        _fileUploadPlaceholder(
                          "HSC Certificate",
                          "hsc",
                          docController,
                        ),
                      ],
                    ),
                  ),
                  _sectionHeader("📑 SSC Result"),
                  _sectionCard(
                    child: Column(
                      children: [
                        _buildField(
                          TextEditingController(),
                          "Enter Your SSC Grade",
                          Icons.grade,
                        ),
                        const SizedBox(height: 10), // 🔹 updated
                        _fileUploadPlaceholder(
                          "SSC Certificate",
                          "ssc",
                          docController,
                        ),
                      ],
                    ),
                  ),
                ],
                if (selectedMedium == "English Medium") ...[
                  _sectionHeader("📑 O Level Result"),
                  _sectionCard(
                    child: Column(
                      children: [
                        _buildField(
                          TextEditingController(),
                          "Enter Your O Level Result",
                          Icons.grade,
                        ),
                        const SizedBox(height: 10), // 🔹 updated
                        _fileUploadPlaceholder(
                          "O Level Certificate",
                          "oLevel",
                          docController,
                        ),
                      ],
                    ),
                  ),
                  _sectionHeader("📑 A Level Result"),
                  _sectionCard(
                    child: Column(
                      children: [
                        _buildField(
                          TextEditingController(),
                          "Enter Your A Level Result",
                          Icons.grade,
                        ),
                        const SizedBox(height: 10), // 🔹 updated
                        _fileUploadPlaceholder(
                          "A Level Certificate",
                          "aLevel",
                          docController,
                        ),
                      ],
                    ),
                  ),
                ],
                if (selectedMedium == "Madrasha Medium") ...[
                  _sectionHeader("📑 Dakhil Result"),
                  _sectionCard(
                    child: Column(
                      children: [
                        _buildField(
                          TextEditingController(),
                          "Enter Your Dakhil Result",
                          Icons.grade,
                        ),
                        const SizedBox(height: 10), // 🔹 updated
                        _fileUploadPlaceholder(
                          "Dakhil Certificate",
                          "dakhil",
                          docController,
                        ),
                      ],
                    ),
                  ),
                  _sectionHeader("📑 Alim Result"),
                  _sectionCard(
                    child: Column(
                      children: [
                        _buildField(
                          TextEditingController(),
                          "Enter Your Alim Result",
                          Icons.grade,
                        ),
                        const SizedBox(height: 10), // 🔹 updated
                        _fileUploadPlaceholder(
                          "Alim Certificate",
                          "alim",
                          docController,
                        ),
                      ],
                    ),
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
      style: const TextStyle(fontSize: 13), // 🔹 updated
      decoration: _inputDecoration(hint, icon),
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
        decoration: _inputDecoration(label, Icons.calendar_today),
        child: Text(
          date == null
              ? label
              : "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
          style: const TextStyle(fontSize: 13), // 🔹 updated
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
    return Obx(() {
      final fileName = academicFiles[key]!.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ), // 🔹 updated
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10, // 🔹 updated
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    fileName ?? "No file chosen",
                    style: const TextStyle(fontSize: 12), // 🔹 updated
                  ),
                ),
              ),
              const SizedBox(width: 6), // 🔹 updated
              OutlinedButton.icon(
                onPressed: () async {
                  await docController.pickFiles();
                  if (docController.uploadedFiles.isNotEmpty) {
                    final pickedFile = docController.uploadedFiles.last.name;
                    academicFiles[key]!.value = pickedFile;
                    Get.snackbar(
                      "Upload Successful",
                      "$label uploaded",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.blueAccent,
                      colorText: Colors.white,
                    );
                  }
                },
                icon: const Icon(
                  Icons.upload_file,
                  size: 16,
                  color: Colors.white,
                ), // 🔹 updated
                label: const Text(
                  "Upload",
                  style: TextStyle(fontSize: 12),
                ), // 🔹 updated
                style: OutlinedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10, // 🔹 updated
                    horizontal: 12, // 🔹 updated
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // 🔹 updated
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  /// ----------------- Section Header -----------------
  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10), // 🔹 updated
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14, // 🔹 updated
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  /// ----------------- Section Card -----------------
  Widget _sectionCard({required Widget child}) {
    return Card(
      elevation: 2, // 🔹 updated
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ), // 🔹 updated
      margin: const EdgeInsets.symmetric(vertical: 5), // 🔹 updated
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: child,
      ), // 🔹 updated
    );
  }

  /// ----------------- Input Decoration -----------------
  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, size: 18, color: TColors.secondary), // 🔹 updated
      prefixIconConstraints: const BoxConstraints(
        minWidth: 36,
        minHeight: 36,
      ), // 🔹 updated
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 13,
        color: Colors.grey,
      ), // 🔹 updated
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ), // 🔹 updated
      filled: true,
      fillColor: Colors.grey.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ), // 🔹 updated
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), // 🔹 updated
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), // 🔹 updated
        borderSide: BorderSide(
          color: TColors.secondary,
          width: 1.5,
        ), // 🔹 updated
      ),
    );
  }
}
