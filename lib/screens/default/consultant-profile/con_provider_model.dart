import 'package:eduwise/screens/default/consultant-profile/con_profile_model.dart';
import 'package:flutter/material.dart';

/// 🔹 State Management for Consultants
class ConsultantProfileProvider extends ChangeNotifier {
  // NEW: Filter state (null = no filter)
  // String? _serviceNameFilter; // e.g. "Visa Processing Service"
  // String? _countryFilter; // e.g. "Canada"

  // // NEW: Public getters for the UI
  // String? get serviceNameFilter => _serviceNameFilter;
  // String? get countryFilter => _countryFilter;

  // // NEW: Setters update state + notify listeners
  // void setServiceNameFilter(String? value) {
  //   _serviceNameFilter = (value == null || value.isEmpty) ? null : value;
  //   notifyListeners();
  // }

  // void setCountryFilter(String? value) {
  //   _countryFilter = (value == null || value.isEmpty) ? null : value;
  //   notifyListeners();
  // }

  // // NEW: Clear both filters
  // void clearFilters() {
  //   _serviceNameFilter = null;
  //   _countryFilter = null;
  //   notifyListeners();
  // }

  String? _serviceNameFilter;
  String? _countryFilter;

  String? get serviceNameFilter => _serviceNameFilter;
  String? get countryFilter => _countryFilter;

  void setServiceNameFilter(String? value) {
    _serviceNameFilter = (value == null || value.isEmpty) ? null : value;
    notifyListeners();
  }

  void setCountryFilter(String? value) {
    _countryFilter = (value == null || value.isEmpty) ? null : value;
    notifyListeners();
  }

  void clearFilters() {
    _serviceNameFilter = null;
    _countryFilter = null;
    notifyListeners();
  }

  // UPDATED: Sample data now uses ServiceModel (with country + flag)
  final List<ConsultantProfileModel> _consultants = [
    ConsultantProfileModel(
      name: "Dr. Sarah Khan",
      imageUrl: "https://i.pravatar.cc/300?img=1",
      address: "Dhaka, Bangladesh",
      bio: "10 years in Education",
      rating: 4.8,
      experience: [
        "10 years in Education",
        "Ex-Professor at DU",
        "10 years in Education",
        "Ex-Professor at DU",
        "10 years in Education",
        "Ex-Professor at DU",
        "10 years in Education",
        "Ex-Professor at DU",
      ],
      skills: ["IELTS", "Scholarship Guidance", "Visa Support"],
      biography: "Dr. Sarah has guided 500+ students...",
      portfolio: ["Oxford Alumni", "Cambridge Workshop"],
      services: const [
        // UPDATED: Replaced plain strings with structured ServiceModel
        ServiceModel(
          serviceName: "Assessment Service",
          country: "Bangladesh",
          flagUrl: "https://flagcdn.com/w20/bd.png",
        ),
        ServiceModel(
          serviceName: "Visa Processing Service",
          country: "Bangladesh",
          flagUrl: "https://flagcdn.com/w20/bd.png",
        ),
        ServiceModel(
          serviceName: "File Processing Service",
          country: "UK",
          flagUrl: "https://flagcdn.com/w20/gb.png",
        ),
      ],
      reviews: ["Amazing mentor!", "Helped me get into Oxford!"],
    ),

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
      services: const [
        ServiceModel(
          serviceName: "File Processing Service",
          country: "UK",
          flagUrl: "https://flagcdn.com/w20/gb.png",
        ),
        ServiceModel(
          serviceName: "Corresponding Service",
          country: "UK",
          flagUrl: "https://flagcdn.com/w20/gb.png",
        ),
        ServiceModel(
          serviceName: "Features Service",
          country: "USA",
          flagUrl: "https://flagcdn.com/w20/us.png",
        ),
      ],
      reviews: ["Very professional!", "Highly recommended"],
    ),

    ConsultantProfileModel(
      name: "Emily Johnson",
      imageUrl: "https://i.pravatar.cc/300?img=3",
      address: "Toronto, Canada",
      bio: "Specialist in Visa & Immigration",
      rating: 4.7,
      experience: ["5 years as Visa Consultant", "Assisted 300+ students"],
      skills: ["Visa Support", "Immigration Process"],
      biography: "Emily has a passion for helping students settle abroad.",
      portfolio: ["Canadian Education Fair", "Immigration Seminar"],
      services: const [
        ServiceModel(
          serviceName: "Visa Processing Service",
          country: "Canada",
          flagUrl: "https://flagcdn.com/w20/ca.png",
        ),
        ServiceModel(
          serviceName: "Ticketing update Service",
          country: "Canada",
          flagUrl: "https://flagcdn.com/w20/ca.png",
        ),
        ServiceModel(
          serviceName: "File Processing Service",
          country: "USA",
          flagUrl: "https://flagcdn.com/w20/us.png",
        ),
      ],
      reviews: ["Helped me with my Canada visa!", "Smooth process, thank you!"],
    ),

    ConsultantProfileModel(
      name: "Michael Lee",
      imageUrl: "https://i.pravatar.cc/300?img=4",
      address: "Sydney, Australia",
      bio: "STEM Career Advisor",
      rating: 4.5,
      experience: [
        "6 years in STEM Counselling",
        "Worked with top universities",
      ],
      skills: ["STEM Admissions", "Research Guidance"],
      biography:
          "Michael has supported many students into Australian universities.",
      portfolio: ["Sydney Uni Partnership", "Tech Workshop"],
      services: const [
        ServiceModel(
          serviceName: "Assessment Service",
          country: "Australia",
          flagUrl: "https://flagcdn.com/w20/au.png",
        ),
        ServiceModel(
          serviceName: "Corresponding Service",
          country: "Australia",
          flagUrl: "https://flagcdn.com/w20/au.png",
        ),
      ],
      reviews: ["Great advice for engineering students!", "Supportive mentor."],
    ),

    ConsultantProfileModel(
      name: "Sophia Martinez",
      imageUrl: "https://i.pravatar.cc/300?img=5",
      address: "Madrid, Spain",
      bio: "Expert in European Scholarships",
      rating: 4.9,
      experience: [
        "8 years scholarship consulting",
        "500+ successful scholarships",
      ],
      skills: ["Erasmus+", "Masters Scholarship"],
      biography:
          "Sophia specializes in securing European scholarships for students.",
      portfolio: ["Erasmus Alumni", "EU Grant Program"],
      services: const [
        ServiceModel(
          serviceName: "Features Service",
          country: "Spain",
          flagUrl: "https://flagcdn.com/w20/es.png",
        ),
        ServiceModel(
          serviceName: "Visa Processing Service",
          country: "Spain",
          flagUrl: "https://flagcdn.com/w20/es.png",
        ),
        ServiceModel(
          serviceName: "Assessment Service",
          country: "Germany",
          flagUrl: "https://flagcdn.com/w20/de.png",
        ),
      ],
      reviews: ["Helped me win a scholarship!", "Very detailed guidance."],
    ),

    ConsultantProfileModel(
      name: "Rajesh Patel",
      imageUrl: "https://i.pravatar.cc/300?img=6",
      address: "New Delhi, India",
      bio: "Education & Visa Consultant",
      rating: 4.4,
      experience: ["10 years in Student Visa Consulting"],
      skills: ["Visa Process", "IELTS Prep"],
      biography:
          "Rajesh has strong expertise in guiding Indian students abroad.",
      portfolio: ["British Council Workshop"],
      services: const [
        ServiceModel(
          serviceName: "File Processing Service",
          country: "India",
          flagUrl: "https://flagcdn.com/w20/in.png",
        ),
        ServiceModel(
          serviceName: "Visa Processing Service",
          country: "India",
          flagUrl: "https://flagcdn.com/w20/in.png",
        ),
        ServiceModel(
          serviceName: "Ticketing update Service",
          country: "UK",
          flagUrl: "https://flagcdn.com/w20/gb.png",
        ),
      ],
      reviews: ["Got my UK visa easily!", "Very experienced."],
    ),

    ConsultantProfileModel(
      name: "Aisha Noor",
      imageUrl: "https://i.pravatar.cc/300?img=7",
      address: "Dubai, UAE",
      bio: "Specialist in MEStudy Programs",
      rating: 4.7,
      experience: ["6 years in student placement", "Strong network in UAE"],
      skills: ["Gulf Universities", "Scholarship Guidance"],
      biography: "Aisha has placed 200+ students in UAE universities.",
      portfolio: ["Dubai Expo Education Fair"],
      services: const [
        ServiceModel(
          serviceName: "Corresponding Service",
          country: "UAE",
          flagUrl: "https://flagcdn.com/w20/ae.png",
        ),
        ServiceModel(
          serviceName: "Assessment Service",
          country: "UAE",
          flagUrl: "https://flagcdn.com/w20/ae.png",
        ),
        ServiceModel(
          serviceName: "Features Service",
          country: "Saudi Arabia",
          flagUrl: "https://flagcdn.com/w20/sa.png",
        ),
      ],
      reviews: [
        "Helped me choose the right university!",
        "Friendly and helpful.",
      ],
    ),

    ConsultantProfileModel(
      name: "Olivia Brown",
      imageUrl: "https://i.pravatar.cc/300?img=9",
      address: "New York, USA",
      bio: "Expert in Ivy League Admissions",
      rating: 5.0,
      experience: ["10 years helping Ivy League applicants", "Ex-Yale Advisor"],
      skills: ["Ivy League Prep", "SAT/ACT Guidance"],
      biography: "Olivia has coached 100+ Ivy League admits.",
      portfolio: ["Yale Alumni Network"],
      services: const [
        ServiceModel(
          serviceName: "Assessment Service",
          country: "USA",
          flagUrl: "https://flagcdn.com/w20/us.png",
        ),
        ServiceModel(
          serviceName: "File Processing Service",
          country: "USA",
          flagUrl: "https://flagcdn.com/w20/us.png",
        ),
        ServiceModel(
          serviceName: "Features Service",
          country: "Canada",
          flagUrl: "https://flagcdn.com/w20/ca.png",
        ),
      ],
      reviews: ["Got into Columbia thanks to Olivia!", "Top-notch coaching."],
    ),

    ConsultantProfileModel(
      name: "Liam Smith",
      imageUrl: "https://i.pravatar.cc/300?img=10",
      address: "Berlin, Germany",
      bio: "Specialist in German Universities",
      rating: 4.5,
      experience: ["7 years in German higher education guidance"],
      skills: ["DAAD Scholarships", "German Language Prep"],
      biography: "Liam focuses on German universities and scholarships.",
      portfolio: ["DAAD Scholarship Seminar"],
      services: const [
        ServiceModel(
          serviceName: "Visa Processing Service",
          country: "Germany",
          flagUrl: "https://flagcdn.com/w20/de.png",
        ),
        ServiceModel(
          serviceName: "Corresponding Service",
          country: "Germany",
          flagUrl: "https://flagcdn.com/w20/de.png",
        ),
        ServiceModel(
          serviceName: "Ticketing update Service",
          country: "Spain",
          flagUrl: "https://flagcdn.com/w20/es.png",
        ),
      ],
      reviews: ["Helped me secure DAAD!", "Knows German system very well."],
    ),
  ];

  List<ConsultantProfileModel> get consultants => _consultants;

  /// 🔹 NEW: Return consultants filtered by country/service
  List<ConsultantProfileModel> get filteredConsultants {
    return _consultants.where((c) {
      final hasMatchingService = c.services.any((s) {
        final matchName = _serviceNameFilter == null
            ? true
            : s.serviceName.toLowerCase() == _serviceNameFilter!.toLowerCase();
        final matchCountry = _countryFilter == null
            ? true
            : s.country.toLowerCase() == _countryFilter!.toLowerCase();
        return matchName && matchCountry;
      });
      return hasMatchingService;
    }).toList();
  }

  // Old: Core filtering algorithm; applies 0, 1, or 2 filters (AND logic)
  List<ServiceModel> filteredServicesFor(ConsultantProfileModel c) {
    return c.services.where((s) {
      final matchName = _serviceNameFilter == null
          ? true
          : s.serviceName.toLowerCase() == _serviceNameFilter!.toLowerCase();

      final matchCountry = _countryFilter == null
          ? true
          : s.country.toLowerCase() == _countryFilter!.toLowerCase();

      // AND logic → supports filtering by one or both
      return matchName && matchCountry;
    }).toList();
  }
}
