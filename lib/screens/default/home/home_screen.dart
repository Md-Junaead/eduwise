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
          children: const [
            TopSection(),
            SearchBox(),
            ServicesSection(),
            ConsultantSection(),
            FilterSection(),
            StudyLevelSection(),
            CountrySection(),
            FAQSection(),
          ],
        ),
      ),
    );
  }
}

/*

/// 🔹 Optional Floating Chat Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.chat),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => const Padding(
              padding: EdgeInsets.only(top: 20),
              child: ChatBotSection(),
            ),
          );
        },
      ),


*/

/*

can we make a floting action button or simple chat bot where we will extract some basic info from student & store it in our database
1. Looking for Study Abroad
2. Full name
3. Mobile number
4. Email
5. Higher study you completed
6. preferred country

Question, answer & input section require
border will be red

make it as a section & guide me how to call i on home screen on flutter


do you want to chat with our live agent




*/
