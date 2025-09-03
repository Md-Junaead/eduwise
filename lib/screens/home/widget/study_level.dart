import 'package:eduwise/configs/constants/colors.dart';
import 'package:flutter/material.dart';

class StudyLevelSection extends StatelessWidget {
  const StudyLevelSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      // {"title": "School", "icon": "assets/images/home/study/school.png"},
      {"title": "Bachelors", "icon": "assets/images/home/study/bachelor.png"},
      {"title": "Masters", "icon": "assets/images/home/study/masters.png"},
      {
        "title": "Vocational",
        "icon": "assets/images/home/study/vocational.png",
      },
      {"title": "PHD", "icon": "assets/images/home/study/phd.png"},
    ];

    return Transform.translate(
      offset: const Offset(
        0,
        -35,
      ), // 🔹 moved section up a bit (professional gap with top section)
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          // ✅ Wrapped GridView with Column to add heading
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 20,
              ), // ✅ margin top 5px, bottom 20px
              child: Column(
                children: [
                  Text(
                    "Accurate Guidelines for your Required Study", // ✅ Added heading text
                    textAlign: TextAlign.center, // ✅ center align
                    style: TextStyle(
                      fontSize: 40, // ✅ updated font size to 40
                      fontWeight: FontWeight.bold, // ✅ bold
                      color: TColors.primary, // ✅ red color
                    ),
                  ),
                  SizedBox(height: 10), // 🔹 gap between heading & subheading
                  Text(
                    "Get step-by-step support for your chosen study path whether you are starting your bachelors, pursuing a mastes, or aiming for a PhD abroad.", // ✅ subheading text
                    textAlign: TextAlign.center, // ✅ center align
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
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
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
