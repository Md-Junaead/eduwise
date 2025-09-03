import 'package:eduwise/screens/home/widget/country_section.dart';
import 'package:eduwise/screens/home/widget/search_box.dart';
import 'package:eduwise/screens/home/widget/services_section.dart';
import 'package:eduwise/screens/home/widget/study_level.dart';
import 'package:eduwise/screens/home/widget/top_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TopSection(),
            SearchBox(),
            ServicesSection(),
            // FilterSection(),
            StudyLevelSection(),
            CountrySection(),
          ],
        ),
      ),
    );
  }
}

/*






*/
