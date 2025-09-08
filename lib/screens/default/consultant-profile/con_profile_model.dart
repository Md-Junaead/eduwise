/// NEW: A structured model for services so we can attach country + flag
class ServiceModel {
  final String serviceName;
  final String country;
  final String flagUrl; // small flag icon url

  const ServiceModel({
    required this.serviceName,
    required this.country,
    required this.flagUrl,
  });
}

/// UPDATED: ConsultantProfileModel now uses List<ServiceModel> for `services`
class ConsultantProfileModel {
  final String name;
  final String imageUrl;
  final String address;
  final String bio;
  final double rating;
  final List<String> experience;
  final List<String> skills;
  final String biography;
  final List<String> portfolio;

  // UPDATED: was List<String>, now List<ServiceModel>
  final List<ServiceModel> services;

  final List<String> reviews;

  const ConsultantProfileModel({
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.bio,
    required this.rating,
    required this.experience,
    required this.skills,
    required this.biography,
    required this.portfolio,
    required this.services, // UPDATED
    required this.reviews,
  });
}
