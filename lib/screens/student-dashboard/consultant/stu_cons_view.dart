import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/student-dashboard/consultant/stu_cons_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentConsultantScreen extends StatelessWidget {
  const StudentConsultantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX controller to manage consultant data
    final controller = Get.find<StudentConsultantController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultant Selection"),
        backgroundColor: TColors.secondary,
        centerTitle: true,
      ),
      body: Obx(() {
        final consultants = controller.filteredConsultants;

        // ✅ No consultants fallback
        if (consultants.isEmpty) {
          return const Center(
            child: Text(
              "No consultants available",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        // ✅ Using GridView for responsive layout (better for professional design)
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Use 1 for mobile, can be 2-3 for tablets
              childAspectRatio:
                  2.1, // Height/width ratio for professional card look
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: consultants.length,
            itemBuilder: (context, index) {
              final c = consultants[index];

              // ✅ Modern card design with shadow, rounded corners, and padding
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Consultant profile image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        c.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey[200],
                          child: const Icon(Icons.person, size: 40),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // ✅ Consultant info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            c.bio,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${c.rating}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // ✅ Services displayed as chips (modern UI)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: c.services.map((s) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: Chip(
                                    backgroundColor: TColors.primary
                                        .withOpacity(0.1),
                                    label: Text(
                                      s.serviceName,
                                      style: const TextStyle(
                                        color: TColors.primary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

/*


Code 1:
import 'package:eduwise/screens/student-dashboard/choice/student_choice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ------------------- Widget to display list of choices -------------------
class StudentChoiceList extends StatelessWidget {
  const StudentChoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentChoiceController>();

    /// ✅ Obx makes the ListView reactive
    /// Algorithm: Traverses RxList → O(n)
    return Obx(() {
      final choices = controller.choices;

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: choices.length,
        itemBuilder: (context, index) {
          final choice = choices[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Service ${index + 1}: ${choice.service}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    "Country: ${choice.country}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Institution: ${choice.institution}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Subject: ${choice.subject}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Session/Year: ${choice.session}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    "Budget: ${choice.budget} BDT",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}




Code 2:
// 📌 Data Model for StudentChoice
/// Data Structure: Plain Object Model (used in RxList)
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





Code 3:

// ------------------- student_choice_controller.dart -------------------
import 'package:eduwise/screens/student-dashboard/choice/student_choice_model.dart';
import 'package:get/get.dart';

/// ✅ GetX Controller to manage StudentChoice data
class StudentChoiceController extends GetxController {
  /// ------------------- Data Structure -------------------
  /// RxList = reactive list that updates UI automatically
  final RxList<StudentChoice> choices = <StudentChoice>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadDemoData(); // Load 10 demo entries when controller initializes
  }

  /// ------------------- Algorithm -------------------
  /// Load 10 demo choices
  void _loadDemoData() {
    final List<StudentChoice> demo = [
      StudentChoice(
        service: "Assessment",
        country: "Canada",
        institution: "University of Toronto",
        subject: "Computer Science",
        session: "2025-09-01",
        budget: "150000",
      ),
      StudentChoice(
        service: "Visa Processing Service",
        country: "USA",
        institution: "MIT",
        subject: "Data Science",
        session: "2025-09-15",
        budget: "200000",
      ),
      StudentChoice(
        service: "File Processing Service",
        country: "UK",
        institution: "University of Oxford",
        subject: "Business Management",
        session: "2025-10-01",
        budget: "180000",
      ),
      StudentChoice(
        service: "Ticketing update Service",
        country: "Australia",
        institution: "University of Sydney",
        subject: "Engineering",
        session: "2025-11-01",
        budget: "120000",
      ),
      StudentChoice(
        service: "Corresponding Service",
        country: "Germany",
        institution: "TU Munich",
        subject: "Mechanical Engineering",
        session: "2025-09-10",
        budget: "130000",
      ),
      StudentChoice(
        service: "Assessment",
        country: "France",
        institution: "Sorbonne University",
        subject: "Philosophy",
        session: "2025-09-05",
        budget: "90000",
      ),
      StudentChoice(
        service: "Features Service",
        country: "Japan",
        institution: "University of Tokyo",
        subject: "Robotics",
        session: "2025-09-20",
        budget: "170000",
      ),
      StudentChoice(
        service: "Visa Processing Service",
        country: "Canada",
        institution: "McGill University",
        subject: "Medicine",
        session: "2025-09-25",
        budget: "250000",
      ),
      StudentChoice(
        service: "File Processing Service",
        country: "USA",
        institution: "Stanford University",
        subject: "AI & ML",
        session: "2025-10-10",
        budget: "220000",
      ),
      StudentChoice(
        service: "Ticketing update Service",
        country: "UK",
        institution: "Imperial College London",
        subject: "Civil Engineering",
        session: "2025-11-05",
        budget: "140000",
      ),
    ];

    // Add demo data to RxList (Algorithm O(n))
    choices.addAll(demo);
  }

  /// Clear all choices
  void clearChoice() {
    choices.clear(); // O(n)
  }
}






Code 4:
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


Code 5:
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
      bio: "Education Consultant with 10+ years experience",
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
      bio: "Career Advisor with focus on STEM fields",
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
      bio: "Specialist in Middle East Study Programs",
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
      name: "Daniel Kim",
      imageUrl: "https://i.pravatar.cc/300?img=8",
      address: "Seoul, South Korea",
      bio: "Admissions Specialist for Asian Universities",
      rating: 4.6,
      experience: ["5 years in admissions", "Fluent in Korean & English"],
      skills: ["Admissions", "Language Support"],
      biography:
          "Daniel helps international students with Asian university processes.",
      portfolio: ["Seoul National University Event"],
      services: const [
        ServiceModel(
          serviceName: "Ticketing update Service",
          country: "South Korea",
          flagUrl: "https://flagcdn.com/w20/kr.png",
        ),
        ServiceModel(
          serviceName: "Visa Processing Service",
          country: "South Korea",
          flagUrl: "https://flagcdn.com/w20/kr.png",
        ),
      ],
      reviews: [
        "Made Korea admissions so easy!",
        "Bilingual support is great.",
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






I have consultant profile Ready and StudentChoice section ready as well,
based on student choice (Country, Service, subject) student will be able to see consultant on his StudentConsultantScreen

Now i want to know how can i do it, as i have (Model, contruller, view/screen)
Must require ALgorithem & data structure for this with getx state management
give me a proper guideline how to use them, make them section wise so i can reuse them if require
Comment the code & tell me what you did



*/
