// lib/screens/consultant-dashboard/education/consultant_education_form.dart
import 'package:eduwise/screens/consultant-dashboard/educational-qualification/con_edu_qua_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduwise/configs/constants/colors.dart';

class ConsultantEducationForm extends StatelessWidget {
  ConsultantEducationForm({super.key});
  final controller = Get.put(ConsultantEducationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Educational Qualification"),
        backgroundColor: TColors.secondary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField(
              "Title of Your Last Education",
              controller.tempTitle,
              "Enter the title of Education",
            ),
            const SizedBox(height: 12),
            _buildInputField(
              "Result (Grade/GPA/CGPA)",
              controller.tempGrade,
              "Enter Grade/GPA/CGPA",
            ),
            const SizedBox(height: 12),
            _buildInputField(
              "Duration",
              controller.tempDuration,
              "Duration (3 years/4 years)",
            ),
            const SizedBox(height: 12),
            _buildDatePicker("Passing Year", controller.tempPassingYear),
            const SizedBox(height: 12),
            _buildInputField(
              "Institution",
              controller.tempInstitution,
              "Institution Name",
            ),
            const SizedBox(height: 12),
            _buildFilePicker(
              "Certificate/Document",
              controller.tempCertificate,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.addEducation,
              child: const Text("Save"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
                backgroundColor: TColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------------- Input Field ----------------
  Widget _buildInputField(String label, RxString obs, String placeholder) {
    return Obx(
      () => TextFormField(
        style: const TextStyle(fontSize: 13),
        onChanged: (v) => obs.value = v,
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          labelStyle: const TextStyle(fontSize: 13),
          filled: true,
          fillColor: Colors.grey.shade50,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: TColors.secondary, width: 1.5),
          ),
        ),
        controller: TextEditingController(text: obs.value),
      ),
    );
  }

  /// ---------------- Date Picker ----------------
  Widget _buildDatePicker(String label, Rxn<DateTime> obs) {
    return Obx(
      () => InkWell(
        onTap: () async {
          DateTime? picked = await showDatePicker(
            context: Get.context!,
            initialDate: obs.value ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (picked != null) obs.value = picked;
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 13),
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: TColors.secondary,
                width: 1.5,
              ),
            ),
          ),
          child: Text(
            obs.value == null
                ? "Select Date"
                : "${obs.value!.month}/${obs.value!.day}/${obs.value!.year}",
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }

  /// ---------------- File Picker ----------------
  Widget _buildFilePicker(String label, RxString obs) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: Text(
              obs.value.isEmpty ? "(Documents of the Certificate)" : obs.value,
              style: const TextStyle(fontSize: 13),
            ),
          ),
          OutlinedButton.icon(
            onPressed: controller.pickCertificate,
            icon: const Icon(Icons.upload_file, size: 16),
            label: const Text("Upload", style: TextStyle(fontSize: 12)),
            style: OutlinedButton.styleFrom(
              backgroundColor: TColors.secondary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
