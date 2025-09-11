// lib/screens/student-dashboard/consultant/consultant_work_experience_model.dart
class ConsultantWorkExperience {
  final String organizationName;
  final String designation;
  final String responsibilities;
  final DateTime startDate;
  final DateTime endDate;
  final String? anyDocument;
  final String? resumeDocument;
  final DateTime createdAt;

  ConsultantWorkExperience({
    required this.organizationName,
    required this.designation,
    required this.responsibilities,
    required this.startDate,
    required this.endDate,
    this.anyDocument,
    this.resumeDocument,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
