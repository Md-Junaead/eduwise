import 'package:eduwise/screens/home/widget/search_box.dart';
import 'package:eduwise/screens/home/widget/services_section.dart';
import 'package:eduwise/screens/home/widget/top_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Optional: Precache images here if needed
  // @override
  // void initState() {
  //   super.initState();
  //   precacheImage(AssetImage('assets/images/home/hero/students/students.png'), context);
  //   // For multi-threading: compute(loadImagesOrData).then(...);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TopSection(),
            SearchBox(),
            SizedBox(height: 30),
            // ServicesSection(),
          ],
        ),
      ),
    );
  }
}

/*

Assessment Service
File Processing Service Service
Visa Processing Service Service
Corresponding Service Service
Ticketing update Service Service
Features Service Service


Task:
This is the 6 service that my company offer
i want to show it under Services Section as card
Name, Icon, 1-2 Line Paragraph
How to show it to look professional & color design
this is image link "assets/images/home/services/1.png" etc
can you give me 3 professional design so that i can check which one look profssional,
this is a student consultuncy flutter mobile app
comment the code
do not change anything else
tell me what you did


How to convert it to multi threat so that main threat does not overload
can i convert this code as component?
if yes, then convet it to different component & use it on home_screen.dart file
update the full code
Tell me what you did




*/
