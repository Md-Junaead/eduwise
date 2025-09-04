import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/widget/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // 🔹 Carousel slider

class StudyLevelSection extends StatelessWidget {
  const StudyLevelSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        "title": "School",
        "icon":
            "https://eduwise.com.bd/Frontend/assets/img/icon/guidline/school.png",
      },
      {
        "title": "Bachelors",
        "icon":
            "https://eduwise.com.bd/Frontend/assets/img/icon/guidline/bachelor.png",
      },
      {
        "title": "Masters",
        "icon":
            "https://eduwise.com.bd/Frontend/assets/img/icon/guidline/masters.png",
      },
      {
        "title": "Vocational",
        "icon":
            "https://eduwise.com.bd/Frontend/assets/img/icon/guidline/vocational.png",
      },
      {
        "title": "PHD",
        "icon":
            "https://eduwise.com.bd/Frontend/assets/img/icon/guidline/phd.png",
      },
    ];

    return Transform.translate(
      offset: const Offset(0, -35),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Column(
                children: [
                  Text(
                    "Accurate Guidelines for your Required Study",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Get step-by-step support for your chosen study path whether you are starting your bachelors, pursuing a mastes, or aiming for a PhD abroad.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Carousel Slider (fixed overflow issue)
            SizedBox(
              height: 250, // total space for card
              child: CarouselSlider.builder(
                itemCount: services.length,
                options: CarouselOptions(
                  height: 230,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
                  enlargeFactor: 0.3,
                  enableInfiniteScroll: true,
                ),
                itemBuilder: (context, index, realIndex) {
                  final item = services[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/destinationScreen");
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          /// 🔹 Flexible image (prevents overflow)
                          Expanded(
                            flex: 3,
                            child: CustomNetworkImage(
                              imageUrl: item["icon"]!,
                              width: 120,
                              height: 100,
                            ),
                          ),
                          const SizedBox(height: 10),

                          /// 🔹 Flexible text
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                item["title"]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
