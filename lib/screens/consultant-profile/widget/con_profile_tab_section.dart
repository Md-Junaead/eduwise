import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/consultant-profile/con_profile_model.dart';
import 'package:flutter/material.dart';

/// 🔹 Tab Section with Experience, Skills, Biography, Portfolio, Service
class ConsultantTabSection extends StatelessWidget {
  final ConsultantProfileModel consultant;

  const ConsultantTabSection({super.key, required this.consultant});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TabBar(
            labelColor: TColors.secondary,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            indicatorColor: TColors.secondary,
            isScrollable: true,
            tabs: [
              Tab(text: "Experience"),
              Tab(text: "Skill"),
              Tab(text: "Service"),
              Tab(text: "Biography"),
              Tab(text: "Portfolio"),
            ],
          ),
          const SizedBox(height: 8),
          // 🔹 Tab Content Section
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22, // dynamic height
            child: TabBarView(
              children: [
                _buildPlainList(consultant.experience, "No Experience Added"),
                _buildChipList(consultant.skills, "No Skills Added"),
                _buildChipList(consultant.services, "No Services Added"),
                _buildBiography(consultant.biography),
                _buildPlainList(consultant.portfolio, "No Portfolio Added"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Plain Modern List (for Experience & Portfolio)
  Widget _buildPlainList(List<String> items, String emptyMessage) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 20, thickness: 0.5),
      itemBuilder: (context, index) => Text(
        "• ${items[index]}",
        style: const TextStyle(
          fontSize: 15,
          height: 1.5,
          color: Colors.black87,
        ),
      ),
    );
  }

  /// 🔹 Modern Chip List (for Skills & Services)
  Widget _buildChipList(List<String> items, String emptyMessage) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: items
            .map(
              (e) => Chip(
                label: Text(
                  e,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                backgroundColor: Colors.blue.shade50,
                side: BorderSide(color: Colors.blue.shade200),
              ),
            )
            .toList(),
      ),
    );
  }

  /// 🔹 Biography with Modern Styling
  Widget _buildBiography(String text) {
    if (text.isEmpty) {
      return const Center(
        child: Text(
          "No Biography Added",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          height: 1.6, // line spacing
          color: Colors.black87,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}




/*
Remove card system for experience & portfolio
this 2 section does not require card system
Update full code
tell me what you did
do not change anything else



*/