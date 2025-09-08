import 'package:eduwise/configs/constants/colors.dart';
import 'package:eduwise/configs/core/app_theme.dart';
import 'package:eduwise/configs/routes/routes_name.dart';
import 'package:eduwise/provider/sign_in_provider.dart';
import 'package:eduwise/configs/widgets/bottom_border_text_field.dart';
import 'package:eduwise/widget/bottom_nav.dart';
import 'package:eduwise/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Sign In Screen
/// Sections: Top (logo + texts), Middle (inputs/actions), Bottom (signup)
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
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
      // ✅ updated background to light grey for modern feel
      backgroundColor: Colors.grey[100], // <-- updated
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ), // <-- updated spacing
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // =========================
                // 1. TOP SECTION
                // =========================
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.20),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo/logo-red.png',
                      fit: BoxFit.contain,
                      height: 96,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Sign In for getting Information about study abroad',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ), // <-- softer black
                ),
                const SizedBox(height: 8),

                const Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 24, // <-- slightly larger for hierarchy
                  ),
                ),
                const SizedBox(height: 24),

                // =========================
                // 2. MIDDLE SECTION (inside Card)
                // =========================
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // <-- rounded card
                  ),
                  elevation: 4, // <-- soft shadow
                  child: Padding(
                    padding: const EdgeInsets.all(20), // <-- internal padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BottomBorderTextField(
                          controller: _emailCtrl,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          onChanged: context.read<SignInProvider>().setEmail,
                        ),
                        const SizedBox(height: 20),

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
                              color: Colors.grey[700], // <-- softer icon color
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Remember Me + Forgot Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // <-- updated alignment
                          children: [
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
                                    color: Colors.black54, // <-- softer border
                                    width: 1,
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                const Text(
                                  'Remember Me',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ), // <-- softer text
                                ),
                              ],
                            ),
                            const Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: AppTheme
                                    .primary, // <-- highlight in theme color
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        CustomButton(
                          text: "SignIn",
                          color: TColors.secondary,
                          destination: const BottomNav(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // =========================
                // 3. BOTTOM SECTION
                // =========================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black87),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.signUpScreen);
                      },
                      child: const Text(
                        'SignUP',
                        style: TextStyle(
                          color: AppTheme.primary, // <-- theme color highlight
                          fontWeight: FontWeight.w700,
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


/*
Code SigninScreen:

Code SignupScreen:

Task:
SignupScreen looks good to me but it's taking too much space & text, icon & button looks bigger then it should be
can we solve this issue, how can we do it
Check my code & update full code
tell me what you did
commnet the code you update



*/