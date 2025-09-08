import 'package:eduwise/configs/routes/routes_name.dart';
import 'package:eduwise/screens/default/conditions/terms_conditions_screen.dart';
import 'package:eduwise/screens/default/all-consultant/all_consultant.dart';
import 'package:eduwise/screens/default/consultant-profile/con_profile_view.dart';
import 'package:eduwise/screens/default/home/home_screen.dart';
import 'package:eduwise/screens/default/profile/profile_view.dart';
import 'package:eduwise/screens/default/signin/signin_view.dart';
import 'package:eduwise/screens/default/signup/signup_view.dart';
import 'package:eduwise/screens/student-dashboard/profile/profile_view.dart';
import 'package:eduwise/widget/bottom_nav.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //SignInScreen routes name

      case RoutesName.signInScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignInScreen(),
        );

      case RoutesName.signUpScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignUpScreen(),
        );

      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );

      case RoutesName.termsAndConditionsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => TermsAndConditionsScreen(),
        );

      // Bottom Nav Bar Nevigation

      case RoutesName.bottomNav:
        return MaterialPageRoute(
          builder: (BuildContext context) => BottomNav(),
        );

      case RoutesName.profileScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ProfileScreen(),
        );

      case RoutesName.consultantProfileScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ConsultantProfileScreen(index: 0),
        );

      case RoutesName.allConsultantScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => AllConsultantScreen(),
        );

      // Student Portal
      case RoutesName.studentProfileScreen:
        return MaterialPageRoute(
          builder: (context) => const StudentProfileScreen(), // ✅ Correct way
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
