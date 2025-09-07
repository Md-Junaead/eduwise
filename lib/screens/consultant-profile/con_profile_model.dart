/// 🔹 Consultant Model - defines unique data structure
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
  final List<String> services;
  final List<String> reviews;

  ConsultantProfileModel({
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.bio,
    required this.rating,
    required this.experience,
    required this.skills,
    required this.biography,
    required this.portfolio,
    required this.services,
    required this.reviews,
  });
}
