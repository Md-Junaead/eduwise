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
        backgroundColor: TColors.primary,
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
                      color1: TColors.primary,
                      color2: TColors.primary,
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
                      color1: TColors.primary,
                      color2: TColors.primary,
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
        prefixIcon: const Icon(Icons.design_services, color: TColors.primary),
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
          prefixIcon: const Icon(Icons.calendar_today, color: TColors.primary),
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
        prefixIcon: Icon(icon, color: TColors.primary),
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
                      ? [TColors.black, TColors.black]
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
                    color: isPressed ? TColors.white : TColors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      color: isPressed ? TColors.white : TColors.white,
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
