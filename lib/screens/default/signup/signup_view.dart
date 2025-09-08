import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/configs/core/app_theme.dart';
import 'package:eduwise/configs/routes/routes_name.dart';
import 'package:eduwise/provider/sign_in_provider.dart';
import 'package:eduwise/configs/widgets/bottom_border_text_field.dart';
import 'package:eduwise/screens/default/conditions/terms_conditions_screen.dart';
import 'package:eduwise/screens/default/signin/signin_view.dart';
import 'package:eduwise/widget/clickable_text.dart';
import 'package:eduwise/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Sign UP Screen
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  // ✅ Added confirm password controller
  final _confirmPasswordCtrl = TextEditingController();

  String _selectedRole = "student"; // default is student

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose(); // ✅ dispose confirm password controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    final width = MediaQuery.of(context).size.width;

    _emailCtrl.value = _emailCtrl.value.copyWith(
      text: sp.email,
      selection: TextSelection.collapsed(offset: sp.email.length),
    );
    _passwordCtrl.value = _passwordCtrl.value.copyWith(
      text: sp.password,
      selection: TextSelection.collapsed(offset: sp.password.length),
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // =========================
                // 1. TOP SECTION
                // =========================
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.18),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo/logo-red.png',
                      fit: BoxFit.contain,
                      height: 80,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Create an Account to get study tips and consultancy',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87, fontSize: 13),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 12),
                // =========================
                // 2. MIDDLE SECTION (inside Card)
                // =========================
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // ✅ Role selection buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() => _selectedRole = "student");
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: BorderSide(
                                    color: AppTheme.primary,
                                    width: 1.2,
                                  ),
                                  backgroundColor: _selectedRole == "student"
                                      ? AppTheme.primary
                                      : Colors.white,
                                  foregroundColor: _selectedRole == "student"
                                      ? Colors.white
                                      : AppTheme.primary,
                                ),
                                child: const Text(
                                  'Student',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() => _selectedRole = "consultant");
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: BorderSide(
                                    color: AppTheme.primary,
                                    width: 1.2,
                                  ),
                                  backgroundColor: _selectedRole == "consultant"
                                      ? AppTheme.primary
                                      : Colors.white,
                                  foregroundColor: _selectedRole == "consultant"
                                      ? Colors.white
                                      : AppTheme.primary,
                                ),
                                child: const Text(
                                  'Consultant',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Email input
                        BottomBorderTextField(
                          controller: _emailCtrl,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          onChanged: context.read<SignInProvider>().setEmail,
                        ),
                        const SizedBox(height: 8),
                        // Password input
                        BottomBorderTextField(
                          controller: _passwordCtrl,
                          hintText: 'Password',
                          obscureText: sp.obscurePassword,
                          onChanged: context.read<SignInProvider>().setPassword,
                          suffixIcon: IconButton(
                            onPressed: context
                                .read<SignInProvider>()
                                .toggleObscurePassword,
                            icon: Icon(
                              sp.obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey[700],
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // ✅ Confirm Password input
                        BottomBorderTextField(
                          controller:
                              _confirmPasswordCtrl, // use proper controller
                          hintText: 'Confirm Password',
                          obscureText:
                              sp.obscurePassword, // same logic as password
                          onChanged: (_) {},
                          suffixIcon: IconButton(
                            onPressed: context
                                .read<SignInProvider>()
                                .toggleObscurePassword, // same toggle
                            icon: Icon(
                              sp.obscurePassword
                                  ? Icons.visibility_off
                                  : Icons
                                        .visibility, // ✅ same icons as password
                              color: Colors.grey[700],
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Terms and Conditions Checkbox
                        Row(
                          children: [
                            Checkbox(
                              value: sp.rememberMe,
                              onChanged: context
                                  .read<SignInProvider>()
                                  .toggleRememberMe,
                              activeColor: AppTheme.primary,
                              checkColor: Colors.white,
                              side: const BorderSide(
                                color: Colors.black54,
                                width: 1,
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: ClickableText(
                                prefixText: "I accept ",
                                clickableText: "Terms and Conditions",
                                clickableColor: TColors.secondary,
                                destination: const TermsAndConditionsScreen(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Modern Sign Up Button
                        CustomButton(
                          text: "Sign Up",
                          color: TColors.secondary,
                          destination: const SignInScreen(),
                        ),
                        const SizedBox(height: 16),
                        // ✅ Social Signup Options
                        const Divider(height: 28, thickness: 1),
                        const Text(
                          "Or continue with",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/images/icons/google.webp",
                                height: 22,
                              ),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/images/icons/apple.webp",
                                height: 22,
                              ),
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/images/icons/facebook.webp",
                                height: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // =========================
                // 3. BOTTOM SECTION
                // =========================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.signInScreen);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
