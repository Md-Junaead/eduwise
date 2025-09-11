// lib/screens/consultant-dashboard/add-service/consultant_service_create_form.dart
import 'package:eduwise/screens/consultant-dashboard/add-service/con_ser_cre_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:eduwise/configs/constants/colors.dart';

class ConsultantServiceCreateForm extends StatefulWidget {
  const ConsultantServiceCreateForm({super.key});

  @override
  State<ConsultantServiceCreateForm> createState() =>
      _ConsultantServiceCreateFormState();
}

class _ConsultantServiceCreateFormState
    extends State<ConsultantServiceCreateForm> {
  final controller = Get.put(ConsultantServiceController());

  final List<String> serviceOptions = [
    "Assessment",
    "File Processing Service",
    "Visa Processing Service",
    "Corresponding Service",
    "Ticketing Update Service",
    "Features Service",
  ];

  final TextEditingController chargeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chargeController.text = controller.tempCharge.value.toInt().toString();
    chargeController.addListener(() {
      controller.tempCharge.value =
          int.tryParse(chargeController.text) ?? 0; // Whole number only
    });
  }

  @override
  void dispose() {
    chargeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Your Service"),
        backgroundColor: TColors.secondary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Your Service",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Obx(
              () => DropdownButton<String>(
                value: controller.tempServiceType.value.isEmpty
                    ? null
                    : controller.tempServiceType.value,
                hint: const Text("Choose Service"),
                isExpanded: true,
                items: serviceOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (val) =>
                    controller.tempServiceType.value = val ?? '',
              ),
            ),
            const SizedBox(height: 12),
            _buildInputField(
              "Title of Your Service",
              controller.tempTitle,
              "Enter the title of service",
            ),
            const SizedBox(height: 12),
            _buildInputField(
              "Description of Your Service",
              controller.tempDescription,
              "Enter the Description of your Service",
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            _buildInputField(
              "Country of your Assessment",
              controller.tempCountry,
              "Enter the Country name you want to Assess",
            ),
            const SizedBox(height: 12),
            _buildInputField(
              "Subject of your Assessment",
              controller.tempSubject,
              "Enter the Subject about You Assess",
            ),
            const SizedBox(height: 12),
            // ---------------- Charge Field with $ prefix ----------------
            TextFormField(
              controller: chargeController,
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: const TextStyle(fontSize: 13),
              decoration: InputDecoration(
                labelText: "Charge",
                labelStyle: const TextStyle(fontSize: 13),
                hintText: "Enter the Charge of your Assessment",
                prefixText: "\$ ",
                filled: true,
                fillColor: Colors.grey.shade50,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: TColors.secondary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildInputField(
              "Duration",
              controller.tempDuration,
              "Enter the time/days you will take",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.publishService,
        label: const Text("Publish"),
        icon: const Icon(Icons.publish),
        backgroundColor: TColors.secondary,
      ),
    );
  }

  /// ---------------- Input Field ----------------
  Widget _buildInputField(
    String label,
    Rx<dynamic> obs,
    String placeholder, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Obx(
      () => TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 13),
        onChanged: (v) {
          if (keyboardType == TextInputType.number) {
            obs.value = int.tryParse(v) ?? 0;
          } else {
            obs.value = v;
          }
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 13),
          hintText: placeholder,
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
        controller: TextEditingController(
          text: keyboardType == TextInputType.number
              ? obs.value.toString()
              : obs.value,
        ),
      ),
    );
  }
}
