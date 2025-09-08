// ============================
// file: lib/models/studen_profile_model.dart
// Model name EXACT as requested: StudenProfileModel
// Includes small value types and enums for clarity
// ============================
import 'package:flutter/foundation.dart';

// ✅ Enum for gender to avoid magic strings
enum Gender { male, female, other }

// ✅ Enum for ID type
enum IdType { passport, nid }

// ✅ Value type: Educational Qualification
@immutable
class StudentEducation {
  final String degree; // e.g., "BSc in CSE"
  final String institution; // e.g., "University of Dhaka"
  final DateTime startDate; // e.g., 2016-01-01
  final DateTime endDate; // e.g., 2020-01-01
  final String grade; // e.g., "CGPA 3.85/4.00"

  const StudentEducation({
    required this.degree,
    required this.institution,
    required this.startDate,
    required this.endDate,
    required this.grade,
  });

  StudentEducation copyWith({
    String? degree,
    String? institution,
    DateTime? startDate,
    DateTime? endDate,
    String? grade,
  }) {
    return StudentEducation(
      degree: degree ?? this.degree,
      institution: institution ?? this.institution,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      grade: grade ?? this.grade,
    );
  }
}

// ✅ Value type: PersonalDetails grouped for better structure
@immutable
class StudentPersonalDetails {
  final Gender gender;
  final String presentAddress;
  final String presentCity;
  final String presentCountry;
  final DateTime dateOfBirth;
  final String nationality;
  final IdType idType; // Passport or NID
  final String idNumber; // Number
  final DateTime? passportIssue; // only if idType == passport
  final DateTime? passportExpiry; // only if idType == passport

  const StudentPersonalDetails({
    required this.gender,
    required this.presentAddress,
    required this.presentCity,
    required this.presentCountry,
    required this.dateOfBirth,
    required this.nationality,
    required this.idType,
    required this.idNumber,
    this.passportIssue,
    this.passportExpiry,
  });

  StudentPersonalDetails copyWith({
    Gender? gender,
    String? presentAddress,
    String? presentCity,
    String? presentCountry,
    DateTime? dateOfBirth,
    String? nationality,
    IdType? idType,
    String? idNumber,
    DateTime? passportIssue,
    DateTime? passportExpiry,
  }) {
    return StudentPersonalDetails(
      gender: gender ?? this.gender,
      presentAddress: presentAddress ?? this.presentAddress,
      presentCity: presentCity ?? this.presentCity,
      presentCountry: presentCountry ?? this.presentCountry,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      nationality: nationality ?? this.nationality,
      idType: idType ?? this.idType,
      idNumber: idNumber ?? this.idNumber,
      passportIssue: passportIssue ?? this.passportIssue,
      passportExpiry: passportExpiry ?? this.passportExpiry,
    );
  }
}

// ✅ MAIN MODEL (exact name requested)
@immutable
class StudenProfileModel {
  final String id; // Unique id to support multiple users
  final String fullName;
  final String email;
  final String phone;
  final String imageUrl; // Profile Image URL
  final StudentPersonalDetails personal;
  final List<StudentEducation>
  education; // Sorted desc by endDate for fast UI reading

  const StudenProfileModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.personal,
    required this.education,
  });

  StudenProfileModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phone,
    String? imageUrl,
    StudentPersonalDetails? personal,
    List<StudentEducation>? education,
  }) {
    return StudenProfileModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      imageUrl: imageUrl ?? this.imageUrl,
      personal: personal ?? this.personal,
      education: education ?? this.education,
    );
  }

  // ✅ Derived value: compute age for display (algorithmic sugar)
  int get age {
    final now = DateTime.now();
    int years = now.year - personal.dateOfBirth.year;
    final hasHadBirthdayThisYear =
        (now.month > personal.dateOfBirth.month) ||
        (now.month == personal.dateOfBirth.month &&
            now.day >= personal.dateOfBirth.day);
    if (!hasHadBirthdayThisYear) years -= 1;
    return years;
  }
}
