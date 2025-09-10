import 'package:eduwise/screens/default/consultant-profile/con_profile_model.dart';

/// ✅ Demo consultants for testing StudentConsultantScreen
final List<ConsultantProfileModel> demoConsultants = [
  ConsultantProfileModel(
    name: "Alice Roberts",
    imageUrl: "https://i.pravatar.cc/300?img=11",
    address: "Dhaka, Bangladesh",
    bio: "Expert in Assessment & Visa guidance",
    rating: 4.8,
    experience: ["5 years in student consulting"],
    skills: ["Computer Science", "Data Science", "Engineering"],
    biography: "Alice has guided students for Canada & USA admissions.",
    portfolio: ["Oxford Workshop", "MIT Webinar"],
    services: const [
      ServiceModel(
        serviceName: "Assessment",
        country: "Canada",
        flagUrl: "https://flagcdn.com/w20/ca.png",
      ),
      ServiceModel(
        serviceName: "Visa Processing Service",
        country: "USA",
        flagUrl: "https://flagcdn.com/w20/us.png",
      ),
    ],
    reviews: ["Very helpful!", "Great guidance!"],
  ),

  ConsultantProfileModel(
    name: "Bob Johnson",
    imageUrl: "https://i.pravatar.cc/300?img=12",
    address: "New York, USA",
    bio: "Specialist in File & Ticketing Services",
    rating: 4.7,
    experience: ["7 years in international student services"],
    skills: ["Business Management", "Civil Engineering"],
    biography: "Bob helps students with UK & Australia admissions.",
    portfolio: ["Imperial College Workshop"],
    services: const [
      ServiceModel(
        serviceName: "File Processing Service",
        country: "UK",
        flagUrl: "https://flagcdn.com/w20/gb.png",
      ),
      ServiceModel(
        serviceName: "Ticketing update Service",
        country: "Australia",
        flagUrl: "https://flagcdn.com/w20/au.png",
      ),
    ],
    reviews: ["Smooth process!", "Highly recommended"],
  ),

  ConsultantProfileModel(
    name: "Clara Smith",
    imageUrl: "https://i.pravatar.cc/300?img=13",
    address: "Toronto, Canada",
    bio: "Career & Visa Expert for Canadian students",
    rating: 4.9,
    experience: ["10 years in student counselling"],
    skills: ["Computer Science", "AI & ML", "Medicine"],
    biography: "Clara specializes in Canadian admissions and visa guidance.",
    portfolio: ["McGill Alumni", "Toronto Webinar"],
    services: const [
      ServiceModel(
        serviceName: "Visa Processing Service",
        country: "Canada",
        flagUrl: "https://flagcdn.com/w20/ca.png",
      ),
      ServiceModel(
        serviceName: "Assessment",
        country: "Canada",
        flagUrl: "https://flagcdn.com/w20/ca.png",
      ),
    ],
    reviews: ["Excellent consultant!", "Helped me get my visa."],
  ),
];
