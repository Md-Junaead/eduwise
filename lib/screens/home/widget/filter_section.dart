// I need a search form with multiple option to search, only one mandotory (Highest Study)
// First Input Form: Highest Study (School, Bachelor, Masters, Vocationa, PHD, ) Mandotory
// 2nd Input: Country (country_picker: ^2.0.27)
// 3rd Input: service (There will be 6 service to chose, use dropdown, service 1, 2 ...6)
// 4th: subject ( ["Engineering",
//             "Architecture",
//             "Law",
//             "Art",
//             "Computer Science",
//             "Science",
//             "Financial Accounting",
//             "Economics",
//             "Education",
//             "Social Sciences",
//             "Agriculture",
//             "Biology",
//             "Health",
//             "Business",
//             "Chemistry",
//             "Information Technology",
//             "Nursing",
//             "Business Administration",
//             "Communications",
//             "Politics",
//             "Psychology",
//             "Bachelor of Science",
//             "Chemical Engineering",
//             "Aeronautical and Aerospace Engineering"
//         ]; )
// 5th: Budget, number system

// import 'package:flutter/material.dart';
// import 'package:pdf/widgets.dart';
// import 'package:provider/provider.dart';

// Search buttom Blue with search icon
// this should be on a Card
// border radius 3% all side
// gradiant color: right red, left Blue
// Title will be : Search With Your preferred Country, Subject, or University Name

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_picker/country_picker.dart';

/// 🔹 Provider to Manage Filter State
class FilterProvider extends ChangeNotifier {
  String? highestStudy;
  String? country;
  String? service;
  String? subject;
  double? budget;

  /// ✅ Keep controller here so it persists (cleaner state management)
  final TextEditingController countryController =
      TextEditingController(); // ✅ UPDATED

  void setHighestStudy(String value) {
    highestStudy = value;
    notifyListeners();
  }

  void setCountry(String value) {
    country = value;
    countryController.text = value; // ✅ keep synced
    notifyListeners();
  }

  void setService(String value) {
    service = value;
    notifyListeners();
  }

  void setSubject(String value) {
    subject = value;
    notifyListeners();
  }

  void setBudget(double value) {
    budget = value;
    notifyListeners();
  }

  bool isValid() {
    return highestStudy != null && highestStudy!.isNotEmpty;
  }

  @override
  void dispose() {
    countryController.dispose(); // ✅ cleanup
    super.dispose();
  }
}

/// 🔹 Reusable Filter Section Widget
class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FilterProvider(),
      child: const FilterFormCard(), // ✅ simplified
    );
  }
}

/// 🔹 Filter Form Card
class FilterFormCard extends StatelessWidget {
  const FilterFormCard({super.key}); // ✅ make const

  final List<String> studies = const [
    "School",
    "Bachelor",
    "Masters",
    "Vocational",
    "PHD",
  ];

  final List<String> services = const [
    "Assessment Service",
    "File Processing Service",
    "Visa Processing Service",
    "Corresponding Service",
    "Ticketing update Service",
    "Features Service ",
  ];

  final List<String> subjects = const [
    "Engineering",
    "Architecture",
    "Law",
    "Art",
    "Computer Science",
    "Science",
    "Financial Accounting",
    "Economics",
    "Education",
    "Social Sciences",
    "Agriculture",
    "Biology",
    "Health",
    "Business",
    "Chemistry",
    "Information Technology",
    "Nursing",
    "Business Administration",
    "Communications",
    "Politics",
    "Psychology",
    "Bachelor of Science",
    "Chemical Engineering",
    "Aeronautical and Aerospace Engineering",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.red],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(2), // border thickness
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          padding: const EdgeInsets.all(20),
          child: Consumer<FilterProvider>(
            // ✅ UPDATED: clean rebuild
            builder: (context, provider, _) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  const Text(
                    "Search With Your Preferred Country, Subject, or University Name",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Highest Study (Mandatory)
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: provider.highestStudy,
                    decoration: _inputDecoration("Highest Study *"),
                    items: studies
                        .map(
                          (study) => DropdownMenuItem(
                            value: study,
                            child: Text(study, overflow: TextOverflow.ellipsis),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) provider.setHighestStudy(value);
                    },
                  ),

                  const SizedBox(height: 15),

                  /// Country Picker
                  TextFormField(
                    readOnly: true,
                    controller: provider.countryController, // ✅ from provider
                    decoration: _inputDecoration("Country"),
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (Country country) {
                          provider.setCountry(country.name);
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 15),

                  /// Service
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: provider.service,
                    decoration: _inputDecoration("Service"),
                    items: services
                        .map(
                          (s) => DropdownMenuItem(
                            value: s,
                            child: Text(s, overflow: TextOverflow.ellipsis),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) provider.setService(value);
                    },
                  ),

                  const SizedBox(height: 15),

                  /// Subject
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: provider.subject,
                    decoration: _inputDecoration("Subject"),
                    items: subjects
                        .map(
                          (sub) => DropdownMenuItem(
                            value: sub,
                            child: Text(sub, overflow: TextOverflow.ellipsis),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) provider.setSubject(value);
                    },
                  ),

                  const SizedBox(height: 15),

                  /// Budget
                  TextFormField(
                    decoration: _inputDecoration("Budget"),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        provider.setBudget(double.tryParse(value) ?? 0);
                      }
                    },
                  ),

                  const SizedBox(height: 25),

                  /// Search Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.search),
                      label: const Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if (provider.isValid()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Searching...")),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select Highest Study"),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// 🔹 Input Decoration (reusable)
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black87),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black26),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }
}



/*

Everything works fine here, so use proper state management here
use provider to manage state
do not change anything else
update full code
make clean & structured code
tell me what you did
comment the part of code you update
*/