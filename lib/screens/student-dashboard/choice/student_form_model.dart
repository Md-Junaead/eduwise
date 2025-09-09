// 📌 Data Model for StudentChoice
class StudentChoice {
  final String service;
  final String country;
  final String institution;
  final String subject;
  final String session;
  final String budget;

  StudentChoice({
    required this.service,
    required this.country,
    required this.institution,
    required this.subject,
    required this.session,
    required this.budget,
  });

  /// Convert object to JSON (for APIs later)
  Map<String, dynamic> toJson() {
    return {
      "service": service,
      "country": country,
      "institution": institution,
      "subject": subject,
      "session": session,
      "budget": budget,
    };
  }
}
