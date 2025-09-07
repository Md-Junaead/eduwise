import 'package:eduwise/model/menu_item.dart';
import 'package:flutter/material.dart';

/// Global app state with Provider:
/// - Current selected section
/// - Logout handler (stub)
class AppState extends ChangeNotifier {
  AppSection _current = AppSection.home;
  AppSection get current => _current;

  void setSection(AppSection section) {
    if (_current == section) return; // no-op if unchanged
    _current = section;
    notifyListeners();
  }

  /// Replace with your real auth sign-out.
  Future<void> logout(BuildContext context) async {
    // TODO: clear tokens, caches, etc.
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Logged out')));
    // Optionally navigate to a login screen.
  }
}
