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
            "EduWise partners with universities across the USA, UK, Canada, Australia, Europe, and more.",
      },
      {
        "question": "How do I start the study abroad process with EduWise?",
        "answer":
            "You can start by booking a free consultation with EduWise experts. They will guide you step by step.",
      },
      {
        "question": "Do I need IELTS or any English test to apply?",
        "answer":
            "Requirements vary by country and university. Many universities accept alternatives or offer conditional admission.",
      },
      {
        "question": "How much does it cost to study abroad?",
        "answer":
            "The cost depends on the country, university, and program. EduWise provides budget-friendly options during consultation.",
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
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.help_outline, color: Colors.blue, size: 26),
            ],
          ),

          const SizedBox(
            height: 15,
          ), // 🔹 Added spacing between title & FAQ list
          // FAQ List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: faqs.length,
            itemBuilder: (context, index) {
              final faq = faqs[index];
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                ), // 🔹 15px between FAQ items
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ), // 🔹 Red border
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
        ],
      ),
    );
  }
}
