// ============================
// file: lib/widgets/personal_details_section.dart
// Personal details section
// ============================
import 'package:eduwise/screens/student-dashboard/profile/profile_model.dart';
import 'package:eduwise/screens/student-dashboard/student__theme.dart';
import 'package:flutter/material.dart';

class StudentPersonalDetailsSection extends StatelessWidget {
  final StudentPersonalDetails data;
  const StudentPersonalDetailsSection({super.key, required this.data});

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(label, style: StudentAppTextStyles.label),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value, style: StudentAppTextStyles.value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final idTypeText = data.idType == IdType.passport ? 'Passport' : 'NID';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _row(
          'Gender',
          data.gender.name[0].toUpperCase() + data.gender.name.substring(1),
        ),
        _row('Present Address', data.presentAddress),
        _row('Present City', data.presentCity),
        _row('Present Country', data.presentCountry),
        _row(
          'Date of Birth',
          '${data.dateOfBirth.toLocal().toString().split(' ').first}',
        ),
        _row('Nationality', data.nationality),
        _row('$idTypeText Number', data.idNumber),
        if (data.idType == IdType.passport && data.passportIssue != null)
          _row(
            'Passport Issue Date',
            data.passportIssue!.toLocal().toString().split(' ').first,
          ),
        if (data.idType == IdType.passport && data.passportExpiry != null)
          _row(
            'Passport Expiry Date',
            data.passportExpiry!.toLocal().toString().split(' ').first,
          ),
      ],
    );
  }
}
