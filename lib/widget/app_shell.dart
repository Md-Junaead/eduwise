import 'package:eduwise/widget/drawer.dart';
import 'package:eduwise/widget/appbar.dart';
import 'package:flutter/material.dart';

/// AppShell is your reusable Scaffold that provides:
/// - Sticky red header (AppHeader)
/// - Drawer (AppDrawer) that always has access to Provider<AppState>
/// - Body injected from screens
/// Use this in every screen to keep consistent UI.
class AppShell extends StatelessWidget {
  final String? title;
  final Widget body;

  const AppShell({super.key, this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: title),
      // ❌ OLD (caused provider issue)
      // drawer: const AppDrawer(),

      // ✅ FIX: build AppDrawer inside context that has providers
      drawer: Builder(builder: (context) => AppDrawer()),
      body: body,
    );
  }
}
