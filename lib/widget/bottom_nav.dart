import 'package:eduwise/screens/consultant-dashboard/dashboard/con_dash_view.dart';
import 'package:eduwise/screens/default/home/home_screen.dart';
import 'package:eduwise/screens/student-dashboard/dashboard/stu_dboard_view.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0; // Track active tab index

  // ✅ Screens with persistent state using IndexedStack
  final List<Widget> _screens = const [
    HomeScreen(), // index 0 → Home
    ConsultantDashboardView(), // index 1 → Consultants
    StudentDashBoardScreen(), // index 2 → Students
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: IndexedStack(index: _currentIndex, children: _screens),

      // ---------------- Modern Bottom Navbar ----------------
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
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
            indicatorColor: Colors.transparent,
            labelTextStyle: WidgetStateProperty.all(
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            height: 65,
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() => _currentIndex = index);
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

              // Consultants Tab (Middle)
              NavigationDestination(
                icon: Icon(
                  Icons.school_outlined,
                  color: _currentIndex == 1 ? Colors.purple : Colors.grey,
                ),
                selectedIcon: const Icon(Icons.school, color: Colors.purple),
                label: 'Consultants',
              ),

              // Students Tab
              NavigationDestination(
                icon: Icon(
                  Icons.person_outline,
                  color: _currentIndex == 2 ? Colors.red : Colors.grey,
                ),
                selectedIcon: const Icon(Icons.person, color: Colors.red),
                label: 'Students',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
