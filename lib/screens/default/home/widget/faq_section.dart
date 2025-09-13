import 'package:eduwise/configs/constants/colors.dart';
import 'package:flutter/material.dart';

/// ✅ FAQ Section Widget (Updated with 15px spacing)
class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        "question": "What services does EduWise provide?",
        "answer":
            "EduWise offers comprehensive educational consultancy services, including university selection, application assistance, SOP guidance, visa support, and more for students planning to study abroad.",
      },
      {
        "question": "Which countries can I apply to through EduWise?",
        "answer":
            "We assist students in applying to top destinations such as Canada, the USA, the UK, Australia, and European countries, depending on your academic profile and preferences.",
      },
      {
        "question": "How do I start the study abroad process with EduWise?",
        "answer":
            "You can begin by filling out our consultation form or contacting us directly. We will schedule an initial counselling session to understand your goals and guide you accordingly.",
      },
      {
        "question": "Do I need IELTS or any English test to apply?",
        "answer":
            "Most universities in English-speaking countries require proof of English proficiency, such as IELTS, TOEFL, PTE, or Duolingo. However, some universities may offer waivers based on your academic background.",
      },
      {
        "question": "How much does it cost to study abroad?",
        "answer":
            // "The cost depends on the country, university, and program. EduWise provides budget-friendly options during consultation."
            "Tuition fees vary by country and institution, typically ranging from CAD 15,000 to CAD 30,000 per year. Living expenses may range from CAD 10,000 to CAD 15,000 per year, depending on location and lifestyle.",
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              Text(
                "Frequently Asked Questions",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width < 600 ? 20 : 28,
                  fontWeight: FontWeight.bold,
                  color: TColors.black,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.help_outline, color: Colors.blue, size: 26),
            ],
          ),

          Transform.translate(
            offset: Offset(0, -15), // move FAQ list up by 15px
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                final faq = faqs[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 1.0,
                  ), // spacing between items
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.red, width: 1.0),
                    ),
                    child: ExpansionTile(
                      iconColor: Colors.blue,
                      collapsedIconColor: Colors.blue,
                      title: Text(
                        faq["question"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            faq["answer"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              height: 1.4,
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
    );
  }
}
