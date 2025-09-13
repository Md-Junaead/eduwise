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
  final TextEditingController countryController = TextEditingController();

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
      child: const FilterFormCard(),
    );
  }
}

/// 🔹 Filter Form Card
class FilterFormCard extends StatelessWidget {
  const FilterFormCard({super.key});

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
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          padding: const EdgeInsets.all(20),
          child: Consumer<FilterProvider>(
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
                    controller: provider.countryController,
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

                  /// ✅ Subject dropdown (modern bottom sheet)
                  SearchableDropdown(
                    label: "Subject",
                    items: subjects,
                    selectedItem: provider.subject,
                    onItemSelected: (value) {
                      provider.setSubject(value);
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

/// 🔹 Modern Searchable Dropdown Widget (Subject only)
class SearchableDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? selectedItem;
  final Function(String) onItemSelected;

  const SearchableDropdown({
    super.key,
    required this.label,
    required this.items,
    this.selectedItem,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openBottomSheet(context),
      borderRadius: BorderRadius.circular(12),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                selectedItem ?? "Select $label",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: selectedItem == null ? Colors.black54 : Colors.black87,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // ✅ keyboard-safe
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        return _SubjectPickerSheet(
          title: label,
          items: items,
          selected: selectedItem,
          onSelected: (value) {
            onItemSelected(value);
            Navigator.of(ctx).pop();
          },
        );
      },
    );
  }
}

/// 🔹 Bottom sheet with search + ranking
class _SubjectPickerSheet extends StatefulWidget {
  final String title;
  final List<String> items;
  final String? selected;
  final ValueChanged<String> onSelected;

  const _SubjectPickerSheet({
    required this.title,
    required this.items,
    required this.onSelected,
    this.selected,
  });

  @override
  State<_SubjectPickerSheet> createState() => _SubjectPickerSheetState();
}

class _SubjectPickerSheetState extends State<_SubjectPickerSheet> {
  late final TextEditingController _ctrl;
  late List<String> _filtered;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController();
    _filtered = List.of(widget.items);
    _ctrl.addListener(_runFilter);
  }

  @override
  void dispose() {
    _ctrl.removeListener(_runFilter);
    _ctrl.dispose();
    super.dispose();
  }

  void _runFilter() {
    final q = _ctrl.text.trim().toLowerCase();
    if (q.isEmpty) {
      setState(() => _filtered = List.of(widget.items));
      return;
    }

    int scoreOf(String s, String q) {
      final lower = s.toLowerCase();
      if (lower.startsWith(q)) return 0;
      final idx = lower.indexOf(q);
      if (idx > 0) {
        final prev = lower[idx - 1];
        if (prev == ' ' || prev == '-' || prev == '(') return 1;
      }
      if (idx >= 0) return 2;
      return 999;
    }

    final matched = <(String, int)>[];
    for (final s in widget.items) {
      final sc = scoreOf(s, q);
      if (sc != 999) matched.add((s, sc));
    }
    matched.sort((a, b) {
      final byScore = a.$2.compareTo(b.$2);
      return byScore != 0 ? byScore : a.$1.compareTo(b.$1);
    });

    setState(() => _filtered = matched.map((e) => e.$1).toList());
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottom),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// drag handle
              Container(
                width: 42,
                height: 5,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),

              /// Header row
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Select ${widget.title}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              /// Search box
              TextField(
                controller: _ctrl,
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: "Search ${widget.title}...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _ctrl.text.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => _ctrl.clear(),
                        ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              /// Results
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 420),
                child: _filtered.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Text("No results found"),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: _filtered.length,
                        separatorBuilder: (_, __) =>
                            Divider(height: 1, color: Colors.grey.shade300),
                        itemBuilder: (context, i) {
                          final item = _filtered[i];
                          final selected = item == widget.selected;
                          return ListTile(
                            leading: Icon(
                              selected
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                            ),
                            title: _HighlightedMatchText(
                              text: item,
                              query: _ctrl.text,
                            ),
                            onTap: () => widget.onSelected(item),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🔹 Highlight search matches
class _HighlightedMatchText extends StatelessWidget {
  final String text;
  final String query;

  const _HighlightedMatchText({required this.text, required this.query});

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty) return Text(text);
    final lower = text.toLowerCase();
    final q = query.toLowerCase();
    final start = lower.indexOf(q);
    if (start < 0) return Text(text);
    final end = start + q.length;

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          if (start > 0) TextSpan(text: text.substring(0, start)),
          TextSpan(
            text: text.substring(start, end),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          if (end < text.length) TextSpan(text: text.substring(end)),
        ],
      ),
    );
  }
}
