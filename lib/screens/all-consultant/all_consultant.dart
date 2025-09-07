import 'package:eduwise/screens/home/widget/our_con_section.dart'; // ✅ Reuse ConsultantCard & Provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllConsultantScreen extends StatelessWidget {
  const AllConsultantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConsultantProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "All Consultants",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.redAccent,
          elevation: 2,
        ),
        body: Consumer<ConsultantProvider>(
          builder: (context, provider, _) {
            if (provider.consultants.isEmpty) {
              return const Center(
                child: Text(
                  "No consultants available",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: provider.consultants.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // ✅ Only one card per row
                  mainAxisSpacing: 16, // Vertical spacing
                  childAspectRatio: 1.2, // Adjust card height ratio
                ),
                itemBuilder: (context, index) {
                  return ConsultantCard(
                    consultant: provider.consultants[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}




/*


task:
I will reuse model & ConsultantProvider
I like the ConsultantCard design as well
but i need to update it for AllConsultantScreen

i want to show 2 cart on a row, Profile & service button should place one bellow another so we don't get any issue
so give me update code for AllConsultantScreen & AllConsultantCard section
make sure i can reuse AllConsultantCard section anywhere i want


use proper state management via provider, use algorithem & data structure as you see fit
comment the code for better understand



*/