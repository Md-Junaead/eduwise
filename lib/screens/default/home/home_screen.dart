import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/screens/default/home/widget/our_con_section.dart';
import 'package:eduwise/screens/default/home/widget/country_section.dart';
import 'package:eduwise/screens/default/home/widget/faq_section.dart';
import 'package:eduwise/screens/default/home/widget/filter_section.dart';
import 'package:eduwise/screens/default/home/widget/search_box.dart';
import 'package:eduwise/screens/default/home/widget/services_section.dart';
import 'package:eduwise/screens/default/home/widget/study_level.dart';
import 'package:eduwise/screens/default/home/widget/top_section.dart';
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
          children: [
            const TopSection(),
            const SearchBox(),

            const ServicesSection(),
            Container(
              decoration: BoxDecoration(
                color: TColors.homebackground,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),

              child: const ConsultantSection(),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: TColors.softGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const FilterSection(),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: TColors.homebackground,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: const StudyLevelSection(),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: TColors.softGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const CountrySection(),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: TColors.softGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const FAQSection(),
            ),
          ],
        ),
      ),
    );
  }
}
