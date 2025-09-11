/*

Example Code:

Code 1:
// lib/screens/student-dashboard/profile/widget/certificate_section.dart
import 'package:eduwise/screens/student-dashboard/qualification/file-upload/student_document_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduwise/configs/constants/colors.dart';

class StudentCertificateSection extends StatelessWidget {
  const StudentCertificateSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentDocumentController());

    return Obx(() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Certificate / Documents",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.insert_drive_file, color: Colors.red, size: 23),
              ],
            ),
            const SizedBox(height: 8),

            /// 🔹 File list
            controller.uploadedFiles.isEmpty
                ? const Text(
                    "No Documents Found",
                    style: TextStyle(color: Colors.black54),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.uploadedFiles.length,
                    itemBuilder: (context, index) {
                      final file = controller.uploadedFiles[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(file.name, overflow: TextOverflow.ellipsis),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => controller.removeFile(index),
                        ),
                      );
                    },
                  ),

            const SizedBox(height: 16),

            /// 🔹 Modern Buttons Row
            Row(
              children: [
                /// Upload Button
                Expanded(
                  child: _modernButton(
                    label: "Upload",
                    icon: Icons.upload_file,
                    gradient: LinearGradient(
                      colors: [
                        TColors.primary,
                        TColors.primary.withOpacity(0.8),
                      ],
                    ),
                    onTap: controller.pickFiles,
                  ),
                ),
                const SizedBox(width: 12),

                /// Save Button
                Expanded(
                  child: _modernButton(
                    label: "Save",
                    icon: Icons.save,
                    gradient: LinearGradient(
                      colors: [
                        TColors.primary,
                        TColors.primary.withOpacity(0.8),
                      ],
                    ),
                    onTap: controller.saveFiles,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  /// 🔹 Custom Modern Button
  Widget _modernButton({
    required String label,
    required IconData icon,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Code 2:
// lib/screens/student-dashboard/profile/student_document_controller.dart
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class StudentDocumentController extends GetxController {
  // List of uploaded files
  var uploadedFiles = <PlatformFile>[].obs;

  /// Pick files using FilePicker
  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
    );

    if (result != null) {
      uploadedFiles.addAll(result.files);
    }
  }

  /// Remove file
  void removeFile(int index) {
    uploadedFiles.removeAt(index);
  }

  /// Save (here just demo: you can implement backend API)
  void saveFiles() {
    if (uploadedFiles.isEmpty) {
      Get.snackbar(
        "Error",
        "No files selected",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Demo: just print filenames
    for (var file in uploadedFiles) {
      print("Saving file: ${file.name}");
    }

    Get.snackbar(
      "Success",
      "Files saved successfully",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}





Code 3:
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
        backgroundColor: TColors.secondary,
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
            backgroundColor: TColors.secondary,
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
                  backgroundColor: TColors.secondary,
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




Code 4:
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





Code 5:
// lib/screens/student-dashboard/academic/student_academic_model.dart
/// Simple data model for StudentAcademic entries
/// This will be stored in the controller's RxList for reactivity.
class StudentAcademic {
  final String academicStatus; // "Under Graduate" or "Post Graduate"
  final String medium; // "Bangla Medium", "English Medium", "Madrasha Medium"

  // Fields for UG (Bangla / Madrasha) or equivalent
  final String? hscGpa;
  final String? sscGpa;
  // Fields for English medium (O/A levels)
  final String? oLevelResult;
  final String? aLevelResult;

  // Fields for Post Graduate (graduation info)
  final String? graduationTitle;
  final String? graduationGrade;
  final String? graduationDuration;
  final String? graduationDept;
  final DateTime? gradStartDate;
  final DateTime? gradEndDate;

  // Generic certificate placeholders (we store file names / paths or null)
  final String? hscCertificate;
  final String? sscCertificate;
  final String? oLevelCertificate;
  final String? aLevelCertificate;
  final String? dakhilCertificate;
  final String? alimCertificate;
  final String? graduationCertificate;

  // createdAt for sorting or reference
  final DateTime createdAt;

  StudentAcademic({
    required this.academicStatus,
    required this.medium,
    this.hscGpa,
    this.sscGpa,
    this.oLevelResult,
    this.aLevelResult,
    this.graduationTitle,
    this.graduationGrade,
    this.graduationDuration,
    this.graduationDept,
    this.gradStartDate,
    this.gradEndDate,
    this.hscCertificate,
    this.sscCertificate,
    this.oLevelCertificate,
    this.aLevelCertificate,
    this.dakhilCertificate,
    this.alimCertificate,
    this.graduationCertificate,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'academicStatus': academicStatus,
      'medium': medium,
      'hscGpa': hscGpa,
      'sscGpa': sscGpa,
      'oLevelResult': oLevelResult,
      'aLevelResult': aLevelResult,
      'graduationTitle': graduationTitle,
      'graduationGrade': graduationGrade,
      'graduationDuration': graduationDuration,
      'graduationDept': graduationDept,
      'gradStartDate': gradStartDate?.toIso8601String(),
      'gradEndDate': gradEndDate?.toIso8601String(),
      'hscCertificate': hscCertificate,
      'sscCertificate': sscCertificate,
      'oLevelCertificate': oLevelCertificate,
      'aLevelCertificate': aLevelCertificate,
      'dakhilCertificate': dakhilCertificate,
      'alimCertificate': alimCertificate,
      'graduationCertificate': graduationCertificate,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}



Code 6:
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
    // ✅ Controller as permanent
    final controller = Get.put(StudentAcademicController(), permanent: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Academic Profile"),
        backgroundColor: TColors.secondary,
      ),
      body: Obx(() {
        final academics = controller.academics;

        if (academics.isEmpty) {
          return const Center(
            child: Text(
              "No academic data available",
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        // Filter Bangla Medium UG + any PG info
        final filtered = academics.where((a) {
          // UG Bangla Medium
          final isUGBangla =
              a.academicStatus == "Under Graduate" &&
              a.medium == "Bangla Medium";
          // PG (any medium)
          final isPG = a.academicStatus == "Post Graduate";
          return isUGBangla || isPG;
        }).toList();

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          itemCount: filtered.length,
          itemBuilder: (context, idx) {
            final a = filtered[idx];
            final isEven = idx % 2 == 0;

            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                initiallyExpanded: true,
                backgroundColor: isEven ? Colors.grey.shade50 : Colors.white,
                title: Text(
                  "${a.academicStatus} — ${a.medium}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: TColors.secondary,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ----------------- UG Bangla Medium -----------------
                        if (a.academicStatus == "Under Graduate" &&
                            a.medium == "Bangla Medium") ...[
                          _infoRow("SSC GPA", a.sscGpa ?? "-"),
                          _fileViewRow("SSC Certificate", a.sscCertificate),
                          const SizedBox(height: 6),
                          _infoRow("HSC GPA", a.hscGpa ?? "-"),
                          _fileViewRow("HSC Certificate", a.hscCertificate),
                        ],

                        // ----------------- PG -----------------
                        if (a.academicStatus == "Post Graduate") ...[
                          _infoRow(
                            "Graduation Title",
                            a.graduationTitle ?? "-",
                          ),
                          _infoRow("Grade / CGPA", a.graduationGrade ?? "-"),
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
                          _fileViewRow(
                            "Graduation Certificate",
                            a.graduationCertificate,
                          ),
                        ],

                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Get.to(() => const StudentAcademicForm());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: const Icon(Icons.edit, size: 16),
                            label: const Text(
                              "Edit",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  /// ----------------- Info Row -----------------
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }

  /// ----------------- File View Row -----------------
  Widget _fileViewRow(String label, String? fileName) {
    if (fileName == null || fileName.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          OutlinedButton(
            onPressed: () async {
              // final url =
              //     "https://yourserver.com/files/$fileName"; // replace with your URL
              // if (await canLaunchUrl(Uri.parse(url))) {
              //   await launchUrl(Uri.parse(url));
              // }
            },
            child: const Text("View", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}





Organization Name - Heading
Organization Name Your Worked - Input
Designation - Heading
Designation/Role Your Played - Input
Responsibilities - Heading
Your Responsibilities there - Input
Start Date - Heading
mm/dd/yyyy - Date Piker
End Date - Heading
mm/dd/yyyy - Date Piker

Any Document - Heading
(Place Any Documents You have Relevent) - File Input
Resume Document - Heading
(Place Your Resume) - File Input
Add Experience - Button
make sure add placeholder

Task:
This is how my code works now:
I want to create Conslutunt Screen with info uploaded option as form
All name should start with Consultant
Must use Algorithem & Data structure with GetX provider for smoth experience
As You can see i have alredy finish most of my app, there are some code that can be reuseable, if you think it won't cause any probelm then use it
Otherwise create new File piker option & Date selector like we use on our example code
Do modern & professional Design for this form
tell me what you did
give your design score out of 100
comment the code for better understand
special comment on Data structure and algorithem use part
This app will be a big project, so do what mush need



*/
