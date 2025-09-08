import 'package:eduwise/screens/default/all-consultant/all_consultant_card.dart';
import 'package:eduwise/screens/default/all-consultant/consultant_filter_section.dart';
import 'package:eduwise/screens/default/consultant-profile/con_provider_model.dart';
import 'package:eduwise/widget/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllConsultantScreen extends StatelessWidget {
  const AllConsultantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConsultantProfileProvider>();
    final consultants = provider.filteredConsultants; // ✅ now filtered

    return AppShell(
      body: Column(
        children: [
          // 🔹 NEW: filter section at top
          const ConsultantFilterSection(),

          // 🔹 Consultant list
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: consultants.isEmpty
                  ? const Center(
                      child: Text(
                        "No Consultants Found",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    )
                  : GridView.builder(
                      itemCount: consultants.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.6,
                          ),
                      itemBuilder: (context, index) {
                        final c = consultants[index];
                        return ConsultantCard(c: c, index: index);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
