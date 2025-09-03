import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/// 🔹 Modern Country Section Widget
/// - Top Section: Title + Subtitle
/// - Bottom Section: Professional Card Carousel
class CountrySection extends StatefulWidget {
  const CountrySection({super.key});

  @override
  State<CountrySection> createState() => _CountrySectionState();
}

class _CountrySectionState extends State<CountrySection> {
  int _currentIndex = 0;

  /// Dummy card data (5 cards for now)
  final List<Map<String, String>> cardData = [
    {
      "title": "Study in Canada",
      "subtitle": "Top-ranked universities & diverse culture.",
      "image": "assets/images/home/country/canada.png",
    },
    {
      "title": "Study in USA",
      "subtitle": "World’s leading education system.",
      "image": "assets/images/home/country/usa.png",
    },
    {
      "title": "Study in UK",
      "subtitle": "Historic universities & global recognition.",
      "image": "assets/images/home/country/uk.png",
    },
    {
      "title": "Study in Australia",
      "subtitle": "Affordable education & work opportunities.",
      "image": "assets/images/home/country/ireland.png",
    },
    {
      "title": "Study in Germany",
      "subtitle": "Low tuition fees & strong research culture.",
      "image": "assets/images/home/country/hamburg.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 Top Section (Title + Subtitle)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Find Your Ideal Country for Higher Education",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Once you select a country, you’ll get information about its universities, key subjects, costs, visa process, accommodation, part-time job opportunities, and student benefits. This concise information will help you compare and choose the most suitable country for your higher studies abroad.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        /// 🔹 Bottom Section (Card Slider)
        CarouselSlider.builder(
          itemCount: cardData.length,
          options: CarouselOptions(
            height:
                370, // ⬅️ UPDATED: increased height to avoid RenderFlex overflow
            enlargeCenterPage: true,
            enlargeFactor: 0.25, // 🔹 modern subtle zoom (instead of 2x)
            viewportFraction: 0.55, // 🔹 active card takes more space
            enableInfiniteScroll: true,
            autoPlay: true, // 🔹 auto-slide for smooth feel
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayCurve: Curves.easeInOut,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final card = cardData[index];
            final bool isActive = index == _currentIndex;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.red.withOpacity(
                    isActive ? 1 : 0.3,
                  ), // active = bold red
                  width: 2,
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: isActive
                        ? Colors.red.withOpacity(0.2)
                        : Colors.black12,
                    blurRadius: isActive ? 15 : 6,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Card Image (top)
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Image.asset(
                      card["image"]!,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Card Content
                  Expanded(
                    // ⬅️ UPDATED: make content flexible to use remaining space
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // ⬅️ UPDATED: push button to bottom, prevent overflow
                        children: [
                          Column(
                            children: [
                              Text(
                                card["title"]!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: isActive
                                      ? 18
                                      : 16, // bigger font if active
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                card["subtitle"]!,
                                textAlign: TextAlign.center,
                                maxLines:
                                    2, // ⬅️ UPDATED: guard against extra-long text
                                overflow: TextOverflow
                                    .ellipsis, // ⬅️ UPDATED: prevent vertical growth
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),

                          /// Card Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            onPressed: () {
                              // TODO: Navigate or show details
                            },
                            child: const Text("Explore"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
