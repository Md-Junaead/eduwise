import 'package:flutter/material.dart';

/// Lightweight UI state for the Sign In screen (Provider + ChangeNotifier).
class SignInProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _rememberMe = false;
  bool _obscurePassword = true;

  // We’ll track button press (for visual feedback), though styling handles it.
  bool _isSigningIn = false;

  // Getters
  String get email => _email;
  String get password => _password;
  bool get rememberMe => _rememberMe;
  bool get obscurePassword => _obscurePassword;
  bool get isSigningIn => _isSigningIn;

  // Setters with notifyListeners()
  void setEmail(String value) {
    if (value == _email) return;
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    if (value == _password) return;
    _password = value;
    notifyListeners();
  }

  void toggleRememberMe(bool? value) {
    _rememberMe = value ?? false;
    notifyListeners();
  }

  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  /// Simulates a tap/press visual state only (no auth per spec).
  Future<void> pressSignInButton() async {
    _isSigningIn = true;
    notifyListeners();

    // Small delay purely to demonstrate pressed-state styling in UI.
    await Future.delayed(const Duration(milliseconds: 150));

    _isSigningIn = false;
    notifyListeners();
  }

  /// Optional: reset form (not required, but handy).
  void reset() {
    _email = '';
    _password = '';
    _rememberMe = false;
    _obscurePassword = true;
    _isSigningIn = false;
    notifyListeners();
  }
}
