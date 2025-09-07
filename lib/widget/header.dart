import 'package:flutter/material.dart';

/// Reusable Header (PreferredSizeWidget) so it can be used as AppBar anywhere.
/// - Red background (as requested)
/// - Leading menu button that opens Drawer.
/// - Sticky behavior is ensured by Scaffold/AppBar/CustomScrollView usage.
class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const AppHeader({super.key, this.title});

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red, // 🔴 Red header background
      elevation: 2,
      centerTitle: false,
      titleSpacing: 0,
      // Use Builder to get a context under the Scaffold to open the drawer.
      leading: Builder(
        builder: (ctx) => IconButton(
          tooltip: 'Menu',
          icon: const Icon(Icons.menu),
          onPressed: () => _openDrawer(ctx),
        ),
      ),
      title: Text(
        title ?? 'EduWise',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


/*

task:
make a header, background red
header will sticky
on the left side there will be drawer, drawer will have user image but now you use icon (I will change it letter)
drawer should have 5 screen linked (about us, contact, profile)
at the bottom of drawer we should have logout button with icon
tell me how to call it on header, Header & drawer will act like reuseable section
that i can use any screen i want
make a modern professional looking header & Drawer
use Algo & Data structure to make it effecent
use provider state management to manage state
tell me what you did
give me full code with comment to better understand

*/