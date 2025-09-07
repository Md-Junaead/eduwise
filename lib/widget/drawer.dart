import 'package:flutter/material.dart';

/// Reusable Drawer.
/// - Top: user avatar + default username (Junaead)
/// - Middle: navigation items
/// - Bottom: Modern Logout section (UI only, no logic)
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7, // 🔹 Drawer width = 70%
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Header with avatar + username
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Row(
                children: const [
                  CircleAvatar(radius: 24, child: Icon(Icons.person, size: 28)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Junaead", // ✅ Default username
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),

            // 🔹 Navigation items
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text("Consultants"),
              onTap: () {
                Navigator.pushNamed(context, "/allConsultant");
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About"),
              onTap: () {
                Navigator.pushNamed(context, "/about");
              },
            ),

            const Spacer(),

            // 🔹 Modern Logout Section (bottom)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1), // light red background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.logout, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
