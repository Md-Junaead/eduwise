import 'package:eduwise/screens/consultant-profile/con_profile_model.dart';
import 'package:flutter/material.dart';

/// 🔹 State Management for Consultants
class ConsultantProfileProvider extends ChangeNotifier {
  final List<ConsultantProfileModel> _consultants = [
    ConsultantProfileModel(
      name: "Dr. Sarah Khan",
      imageUrl: "https://i.pravatar.cc/300?img=1",
      address: "Dhaka, Bangladesh",
      bio: "Education Consultant with 10+ years experience",
      rating: 4.8,
      experience: ["10 years in Education", "Ex-Professor at DU"],
      skills: ["IELTS", "Scholarship Guidance", "Visa Support"],
      biography: "Dr. Sarah has guided 500+ students...",
      portfolio: ["Oxford Alumni", "Cambridge Workshop"],
      services: ["Visa Consulting", "Career Guidance"],
      reviews: ["Amazing mentor!", "Helped me get into Oxford!"],
    ),
    // 🔹 Add 9 more demo consultants
    ConsultantProfileModel(
      name: "John Doe",
      imageUrl: "https://i.pravatar.cc/300?img=2",
      address: "London, UK",
      bio: "Expert in Career Counselling",
      rating: 4.6,
      experience: ["7 years in Student Counselling"],
      skills: ["Career Planning", "Scholarships"],
      biography: "Passionate about shaping futures...",
      portfolio: ["Harvard Fellowship"],
      services: ["Scholarship Support", "Personal Mentorship"],
      reviews: ["Very professional!", "Highly recommended"],
    ),
    // ... Add more consultants (total 10)
  ];

  List<ConsultantProfileModel> get consultants => _consultants;
}
