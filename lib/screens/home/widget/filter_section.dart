/*

import 'package:flutter/material.dart';

/// FilterSection Widget
/// - Reusable widget that provides search filter options
/// - Supports Courses, Scholarships, Universities, and Budget filters
/// - Uses proper state management inside a StatefulWidget
class FilterSection extends StatefulWidget {
  const FilterSection({super.key});

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  // Track active filter type (0 = Courses, 1 = Scholarships, 2 = University, 3 = Budget)
  int activeFilter = 0;

  // Sample dropdown & multi-select data
  final List<String> courseData = [
    "Engineering",
    "Architecture",
    "Law",
    "Computer Science",
    "Business",
    "Biology",
    "Economics",
  ];

  final List<String> studyLevels = [
    "Doctorate",
    "PostGraduate",
    "Undergraduate",
    "School",
  ];

  final List<String> countries = [
    "Bangladesh",
    "India",
    "USA",
    "UK",
    "Canada",
    "Australia",
    "Germany",
  ];

  final List<String> universities = [
    "Harvard University",
    "Stanford University",
    "Oxford University",
    "Cambridge University",
    "MIT",
  ];

  // State variables for selections
  List<String> selectedCourses = [];
  List<String> selectedStudyLevels = [];
  List<String> selectedCountries = [];
  List<String> selectedUniversities = [];
  double? budget;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Filter selection buttons (tabs)
            ToggleButtons(
              borderRadius: BorderRadius.circular(12),
              isSelected: [
                activeFilter == 0,
                activeFilter == 1,
                activeFilter == 2,
                activeFilter == 3,
              ],
              onPressed: (index) {
                setState(() {
                  activeFilter = index;
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("Courses"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("Scholarships"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("University"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("Budget"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Dynamic filter section
            if (activeFilter == 0) _buildCourseFilter(),
            if (activeFilter == 1) _buildScholarshipFilter(),
            if (activeFilter == 2) _buildUniversityFilter(),
            if (activeFilter == 3) _buildBudgetFilter(),

            const SizedBox(height: 20),

            // Search Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _handleSearch,
              icon: const Icon(Icons.search),
              label: const Text("Search"),
            ),
          ],
        ),
      ),
    );
  }

  /// Courses Filter Section
  Widget _buildCourseFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _multiSelect(
          title: "Which Course You Prefer?",
          items: courseData,
          selectedValues: selectedCourses,
          onConfirm: (values) => setState(() => selectedCourses = values),
        ),
        _multiSelect(
          title: "Study Level",
          items: studyLevels,
          selectedValues: selectedStudyLevels,
          onConfirm: (values) => setState(() => selectedStudyLevels = values),
        ),
        _multiSelect(
          title: "Which Country You Prefer?",
          items: countries,
          selectedValues: selectedCountries,
          onConfirm: (values) => setState(() => selectedCountries = values),
        ),
      ],
    );
  }

  /// Scholarships Filter Section
  Widget _buildScholarshipFilter() {
    return Column(
      children: [
        _multiSelect(
          title: "Study Level",
          items: studyLevels,
          selectedValues: selectedStudyLevels,
          onConfirm: (values) => setState(() => selectedStudyLevels = values),
        ),
        _multiSelect(
          title: "Which Country You Prefer?",
          items: countries,
          selectedValues: selectedCountries,
          onConfirm: (values) => setState(() => selectedCountries = values),
        ),
      ],
    );
  }

  /// University Filter Section
  Widget _buildUniversityFilter() {
    return Column(
      children: [
        _multiSelect(
          title: "Which University You Prefer?",
          items: universities,
          selectedValues: selectedUniversities,
          onConfirm: (values) => setState(() => selectedUniversities = values),
        ),
        _multiSelect(
          title: "Which Country You Prefer?",
          items: countries,
          selectedValues: selectedCountries,
          onConfirm: (values) => setState(() => selectedCountries = values),
        ),
      ],
    );
  }

  /// Budget Filter Section
  Widget _buildBudgetFilter() {
    return Column(
      children: [
        _multiSelect(
          title: "Which Country You Prefer?",
          items: countries,
          selectedValues: selectedCountries,
          onConfirm: (values) => setState(() => selectedCountries = values),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(
            labelText: "Enter Your Budget (BDT)",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) => setState(() => budget = double.tryParse(value)),
        ),
      ],
    );
  }

  /// Helper function for Multi-Select dropdown
  Widget _multiSelect({
    required String title,
    required List<String> items,
    required List<String> selectedValues,
    required Function(List<String>) onConfirm,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        MultiSelectDialogField(
          items: items.map((e) => MultiSelectItem(e, e)).toList(),
          title: Text(title),
          buttonText: const Text("Select"),
          initialValue: selectedValues,
          onConfirm: onConfirm,
          chipDisplay: MultiSelectChipDisplay(
            chipColor: Colors.blue.shade100,
            textStyle: const TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }

  /// Handle search button click
  void _handleSearch() {
    // Here you can handle navigation or API call
    debugPrint("Searching with:");
    debugPrint("Courses: $selectedCourses");
    debugPrint("Study Levels: $selectedStudyLevels");
    debugPrint("Countries: $selectedCountries");
    debugPrint("Universities: $selectedUniversities");
    debugPrint("Budget: $budget");
  }
}




line 238
The method 'MultiSelectDialogField' isn't defined for the type '_FilterSectionState'.
Try correcting the name to the name of an existing method, or defining a method named 'MultiSelectDialogField'.dartundefined_method
Type: InvalidType



Line 239
The method 'MultiSelectItem' isn't defined for the type '_FilterSectionState'.
Try correcting the name to the name of an existing method, or defining a method named 'MultiSelectItem'.dartundefined_method


Line 244
The method 'MultiSelectChipDisplay' isn't defined for the type '_FilterSectionState'.
Try correcting the name to the name of an existing method, or defining a method named 'MultiSelectChipDisplay'.dartundefined_method
Type: InvalidType



*/
