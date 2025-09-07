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
      services: [
        "Assessment Service",
        "Visa Processing Service",
        "File Processing Service",
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
      services: [
        "File Processing Service",
        "Corresponding Service",
        "Features Service",
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
      services: [
        "Visa Processing Service",
        "Ticketing update Service",
        "File Processing Service",
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
      services: ["Assessment Service", "Corresponding Service"],
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
      services: [
        "Features Service",
        "Visa Processing Service",
        "Assessment Service",
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
      services: [
        "File Processing Service",
        "Visa Processing Service",
        "Ticketing update Service",
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
      services: [
        "Corresponding Service",
        "Assessment Service",
        "Features Service",
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
      services: ["Ticketing update Service", "Visa Processing Service"],
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
      services: [
        "Assessment Service",
        "File Processing Service",
        "Features Service",
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
      services: [
        "Visa Processing Service",
        "Corresponding Service",
        "Ticketing update Service",
      ],
      reviews: ["Helped me secure DAAD!", "Knows German system very well."],
    ),
  ];

  List<ConsultantProfileModel> get consultants => _consultants;
}


/*

it's not nessery to filter with both service & country
only with one item can do the filter
Make it as card, top should have country name & related country flag icon on right
bellow country name, there should have service name
give me a modern & professional style

*/