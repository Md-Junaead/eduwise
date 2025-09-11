// lib/screens/consultant-dashboard/service/consultant_service_create_model.dart
class ConsultantService {
  String serviceType;
  String title;
  String description;
  String country;
  String subject;
  double charge;
  String duration;

  ConsultantService({
    required this.serviceType,
    required this.title,
    required this.description,
    required this.country,
    required this.subject,
    required this.charge,
    required this.duration,
  });
}
