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
        children: [
          const TabBar(
            labelColor: Colors.blue,
            tabs: [
              Tab(text: "Experience"),
              Tab(text: "Skill"),
              Tab(text: "Biography"),
              Tab(text: "Portfolio"),
              Tab(text: "Service"),
            ],
          ),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                _buildList(consultant.experience),
                _buildList(consultant.skills),
                SingleChildScrollView(child: Text(consultant.biography)),
                _buildList(consultant.portfolio),
                _buildList(consultant.services),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(title: Text(items[index])),
    );
  }
}
