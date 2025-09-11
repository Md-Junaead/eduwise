// lib/screens/student-dashboard/consultant/consultant_work_experience_form.dart
import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/consultant-dashboard/experience/con_work_exp_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsultantWorkExperienceForm extends StatelessWidget {
  ConsultantWorkExperienceForm({super.key});
  final controller = Get.put(ConsultantWorkExperienceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Work Experience"),
        backgroundColor: TColors.secondary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInputField(
              label: "Organization Name",
              obs: controller.tempOrganization,
            ),
            _buildInputField(
              label: "Designation",
              obs: controller.tempDesignation,
            ),
            _buildInputField(
              label: "Responsibilities",
              obs: controller.tempResponsibilities,
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            _buildDatePicker("Start Date", controller.tempStartDate),
            const SizedBox(height: 8),
            _buildDatePicker("End Date", controller.tempEndDate),
            const SizedBox(height: 8),
            _buildFilePicker(
              "Any Document",
              controller.tempAnyDocument,
              placeholder: "Any Document",
            ),
            const SizedBox(height: 8),
            _buildFilePicker(
              "Resume Document",
              controller.tempResumeDocument,
              placeholder: "Resume",
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: controller.addExperience,
              icon: const Icon(Icons.add),
              label: const Text("Add Experience"),
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
  Widget _buildInputField({
    required String label,
    required RxString obs,
    int maxLines = 1,
  }) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: TextFormField(
          maxLines: maxLines,
          style: const TextStyle(fontSize: 13),
          onChanged: (v) => obs.value = v,
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
          controller: TextEditingController(text: obs.value),
        ),
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
  Widget _buildFilePicker(
    String label,
    RxnString obs, {
    String placeholder = "No file chosen",
  }) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: Text(
              obs.value ?? placeholder,
              style: const TextStyle(fontSize: 13),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () => controller.pickDocument(obs),
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
