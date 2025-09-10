// lib/screens/student-dashboard/academic/student_academic_model.dart
/// Simple data model for StudentAcademic entries
/// This will be stored in the controller's RxList for reactivity.
class StudentAcademic {
  final String academicStatus; // "Under Graduate" or "Post Graduate"
  final String medium; // "Bangla Medium", "English Medium", "Madrasha Medium"

  // Fields for UG (Bangla / Madrasha) or equivalent
  final String? hscGpa;
  final String? sscGpa;
  // Fields for English medium (O/A levels)
  final String? oLevelResult;
  final String? aLevelResult;

  // Fields for Post Graduate (graduation info)
  final String? graduationTitle;
  final String? graduationGrade;
  final String? graduationDuration;
  final String? graduationDept;
  final DateTime? gradStartDate;
  final DateTime? gradEndDate;

  // Generic certificate placeholders (we store file names / paths or null)
  final String? hscCertificate;
  final String? sscCertificate;
  final String? oLevelCertificate;
  final String? aLevelCertificate;
  final String? dakhilCertificate;
  final String? alimCertificate;
  final String? graduationCertificate;

  // createdAt for sorting or reference
  final DateTime createdAt;

  StudentAcademic({
    required this.academicStatus,
    required this.medium,
    this.hscGpa,
    this.sscGpa,
    this.oLevelResult,
    this.aLevelResult,
    this.graduationTitle,
    this.graduationGrade,
    this.graduationDuration,
    this.graduationDept,
    this.gradStartDate,
    this.gradEndDate,
    this.hscCertificate,
    this.sscCertificate,
    this.oLevelCertificate,
    this.aLevelCertificate,
    this.dakhilCertificate,
    this.alimCertificate,
    this.graduationCertificate,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'academicStatus': academicStatus,
      'medium': medium,
      'hscGpa': hscGpa,
      'sscGpa': sscGpa,
      'oLevelResult': oLevelResult,
      'aLevelResult': aLevelResult,
      'graduationTitle': graduationTitle,
      'graduationGrade': graduationGrade,
      'graduationDuration': graduationDuration,
      'graduationDept': graduationDept,
      'gradStartDate': gradStartDate?.toIso8601String(),
      'gradEndDate': gradEndDate?.toIso8601String(),
      'hscCertificate': hscCertificate,
      'sscCertificate': sscCertificate,
      'oLevelCertificate': oLevelCertificate,
      'aLevelCertificate': aLevelCertificate,
      'dakhilCertificate': dakhilCertificate,
      'alimCertificate': alimCertificate,
      'graduationCertificate': graduationCertificate,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
