import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        "title": "Assessment",
        "desc": "Get guidance with eligibility & course selection.",
        "icon": "assets/images/home/service/assessment.png",
      },
      {
        "title": "File Processing",
        "desc": "Professional handling of your admission files.",
        "icon": "assets/images/home/service/fileProcessing.png",
      },
      {
        "title": "Visa Processing",
        "desc": "Complete support for student visa applications.",
        "icon": "assets/images/home/service/visaProcessing.png",
      },
      {
        "title": "Corresponding",
        "desc": "Stay connected with universities worldwide.",
        "icon": "assets/images/home/service/corresponding.png",
      },
      {
        "title": "Ticketing Update",
        "desc": "Affordable air ticketing & travel support.",
        "icon": "assets/images/home/service/ticketing.png",
      },
      {
        "title": "Features",
        "desc": "Exclusive features for your study abroad journey.",
        "icon": "assets/images/home/service/features.png",
      },
    ];

    return Transform.translate(
      offset: const Offset(0, -50), // 🔹 Moved section 50px up
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.9,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(services[index]["icon"]!, height: 40),
                  const SizedBox(height: 10),
                  Text(
                    services[index]["title"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    services[index]["desc"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}



/*
Task:
This is a searching filter system
I want to conver it to flutter for mobile app
can you convert it
manage proper state, write clean code, make it reuseable code
make it a section widget, this sould work like a widget, i will use it multiple time
comment the code
tell me what you did




*/