import 'package:eduwise/screens/default/consultant-profile/con_profile_view.dart';
import 'package:eduwise/screens/default/home/home_screen.dart';
import 'package:eduwise/screens/default/profile/profile_view.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0; // Track which tab is selected

  // ✅ Use IndexedStack for persistent navigation
  final List<Widget> _screens = const [
    HomeScreen(),
    ConsultantProfileScreen(index: 0),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Keeps state of all screens (doesn't rebuild)
      body: IndexedStack(index: _currentIndex, children: _screens),

      // ----------------- Bottom Navigation Bar -----------------
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black, // Background color Black
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: BottomAppBar(
          color: Colors.black,
          shape:
              const CircularNotchedRectangle(), // Makes middle button stand out
          notchMargin: 8.0,
          child: SizedBox(
            height: 60, // Height of navbar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Home Tab
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.red, size: 28),
                  onPressed: () =>
                      setState(() => _currentIndex = 0), // ✅ Switch tab
                ),

                // Empty space for middle large button
                const SizedBox(width: 40),

                // Profile Tab
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.red, size: 28),
                  onPressed: () =>
                      setState(() => _currentIndex = 2), // ✅ Switch tab
                ),
              ],
            ),
          ),
        ),
      ),

      // ----------------- Floating Middle Button -----------------
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        elevation: 5,
        onPressed: () => setState(() => _currentIndex = 1), // ✅ Switch tab
        child: const Icon(
          Icons.support_agent, // Consultant Icon
          color: Colors.red,
          size: 35, // Larger size for modern look
        ),
      ),
    );
  }
}



/*

This is my bottom nav bar, i want to use it any screen on my mobile app, 
how to update it to reuseable
or is there any way to make my bottom nav bar to view any screen user open
no matter where it is, or do i need to call it on every screen



*/