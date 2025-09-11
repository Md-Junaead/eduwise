import 'package:eduwise/screens/default/consultant-profile/con_profile_view.dart';
import 'package:eduwise/screens/default/home/home_screen.dart';
import 'package:eduwise/screens/student-dashboard/dashboard/stu_dboard_view.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // Track active tab index

  // ✅ Screens with persistent state using IndexedStack
  final List<Widget> _screens = const [
    HomeScreen(), // index 0
    ConsultantProfileScreen(index: 0), // index 1
    StudentDashBoardScreen(), // ✅ replaced ProfileScreen with StudentDashBoardScreen
  ];

  @override
  Widget build(BuildContext context) {
    final bool isSelected = _currentIndex == 1; // check if middle tab active

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),

      // ---------------- Modern Bottom Navbar ----------------
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 0,
            indicatorColor: Colors.transparent, // no default ripple bg
            labelTextStyle: WidgetStateProperty.all(
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            height: 65,
            selectedIndex: _currentIndex == 2 ? 1 : 0, // ✅ fix selection
            onDestinationSelected: (index) {
              // index 0 → Home
              // index 1 → Student Dashboard (Profile)
              if (index == 0) setState(() => _currentIndex = 0);
              if (index == 1) setState(() => _currentIndex = 2);
            },
            destinations: [
              // Home Tab
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                ),
                selectedIcon: const Icon(Icons.home, color: Colors.blue),
                label: 'Home',
              ),

              // Profile Tab
              NavigationDestination(
                icon: Icon(
                  Icons.person_outline,
                  color: _currentIndex == 2 ? Colors.red : Colors.grey,
                ),
                selectedIcon: const Icon(Icons.person, color: Colors.red),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),

      // ---------------- Center Sticky Animated Button ----------------
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () =>
            setState(() => _currentIndex = 1), // ✅ middle button -> Consultant
        child: AnimatedScale(
          scale: isSelected ? 1.2 : 1.0, // bounce effect
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Colors.red, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? Colors.blue.withOpacity(0.6)
                      : Colors.red.withOpacity(0.3),
                  blurRadius: isSelected ? 25 : 12,
                  spreadRadius: isSelected ? 4 : 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(
              Icons.school, // 🎓 Education themed icon
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
