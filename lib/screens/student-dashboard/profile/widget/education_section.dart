// ============================
// file: lib/widgets/education_section.dart
// Education list with clean layout
// ============================
import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/student-dashboard/profile/profile_model.dart';
import 'package:eduwise/screens/student-dashboard/student__theme.dart';
import 'package:flutter/material.dart';

class StudentEducationSection extends StatelessWidget {
  final List<StudentEducation> items;
  const StudentEducationSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Text(
        'No educational records added yet.',
        style: StudentAppTextStyles.bodyMuted,
      );
    }

    return Column(
      children: items.map((e) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: StudentAppColors.divider),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // left icon
              const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.school_outlined,
                  size: 20,
                  color: TColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              // details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.degree, style: StudentAppTextStyles.value),
                    const SizedBox(height: 2),
                    Text(e.institution, style: StudentAppTextStyles.bodyMuted),
                    const SizedBox(height: 6),
                    Text(
                      '${e.startDate.toLocal().toString().split(' ').first}  →  ${e.endDate.toLocal().toString().split(' ').first}',
                      style: StudentAppTextStyles.bodyMuted,
                    ),
                  ],
                ),
              ),
              // grade chip
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: StudentAppColors.chip,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(e.grade, style: StudentAppTextStyles.chip),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
