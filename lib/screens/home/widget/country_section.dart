import 'package:flutter/material.dart';
import 'package:eduwise/widget/custom_network_image.dart'; // 🔹 for network images

/// 🔹 Modern Country Section Widget
/// - Top Section: Title + Subtitle
/// - Bottom Section: Professional Grid Cards
class CountrySection extends StatefulWidget {
  const CountrySection({super.key});

  @override
  State<CountrySection> createState() => _CountrySectionState();
}

class _CountrySectionState extends State<CountrySection> {
  /// Dummy card data (with image urls instead of assets)
  final List<Map<String, String>> cardData = [
    {
      "title": "Study in Canada",
      "subtitle": "Top-ranked universities & diverse culture.",
      "image":
          "https://eduwise.com.bd/storage/EduInfoPage/1752386428_68734b7cd4ed7.png",
      "countryImage":
          "https://eduwise.com.bd/storage/Country/United%20State%20of%20America_1752041394.png", // 🔹 demo country flag
    },
    {
      "title": "Study in USA",
      "subtitle": "World’s leading education system.",
      "image":
          "https://eduwise.com.bd/storage/EduInfoPage/1752386428_68734b7cd4ed7.png",
      "countryImage":
          "https://eduwise.com.bd/storage/Country/United%20State%20of%20America_1752041394.png",
    },
    {
      "title": "Study in UK",
      "subtitle": "Historic universities & global recognition.",
      "image":
          "https://eduwise.com.bd/storage/EduInfoPage/1752386428_68734b7cd4ed7.png",
      "countryImage":
          "https://eduwise.com.bd/storage/Country/United%20State%20of%20America_1752041394.png",
    },
    {
      "title": "Study in Australia",
      "subtitle": "Affordable education & work opportunities.",
      "image":
          "https://eduwise.com.bd/storage/EduInfoPage/1752386428_68734b7cd4ed7.png",
      "countryImage":
          "https://eduwise.com.bd/storage/Country/United%20State%20of%20America_1752041394.png",
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

        /// 🔹 GridView for 2 cards/row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: cardData.length,
            itemBuilder: (context, index) {
              final card = cardData[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.red.withOpacity(0.5),
                    width: 1.5,
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// 🔹 Card Image (top, via URL)
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: CustomNetworkImage(
                        imageUrl: card["image"]!,
                        height: 120,
                        width: double.infinity,
                      ),
                    ),

                    /// 🔹 Card Content
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                /// 🔹 UPDATED: Title + Flag Row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        card["title"]!,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    ClipOval(
                                      child: CustomNetworkImage(
                                        imageUrl: card["countryImage"]!,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 6),
                                Text(
                                  card["subtitle"]!,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),

                            /// 🔹 Card Button
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor: Colors.red,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(30),
                            //     ),
                            //     padding: const EdgeInsets.symmetric(
                            //       horizontal: 16,
                            //       vertical: 8,
                            //     ),
                            //   ),
                            //   onPressed: () {
                            //     // TODO: Navigate or show details
                            //   },
                            //   child: const Text("Explore"),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
