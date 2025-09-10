import 'package:eduwise/screens/student-dashboard/qualification/s_h_e_view.dart';
import 'package:eduwise/screens/student-dashboard/qualification/student-academic/stu_aca_view.dart';
import 'package:flutter/material.dart';

import 'package:eduwise/configs/routes/routes_name.dart';
import 'package:eduwise/screens/default/conditions/terms_conditions_screen.dart';
import 'package:eduwise/screens/default/all-consultant/all_consultant.dart';
import 'package:eduwise/screens/default/consultant-profile/con_profile_view.dart';
import 'package:eduwise/screens/default/home/home_screen.dart';
import 'package:eduwise/screens/default/profile/profile_view.dart';
import 'package:eduwise/screens/default/signin/signin_view.dart';
import 'package:eduwise/screens/default/signup/signup_view.dart';
import 'package:eduwise/screens/student-dashboard/choice/student_choice_view.dart';
import 'package:eduwise/screens/student-dashboard/profile/profile_view.dart';
import 'package:eduwise/widget/bottom_nav.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.signInScreen:
        return MaterialPageRoute(builder: (context) => SignInScreen());

      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());

      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case RoutesName.termsAndConditionsScreen:
        return MaterialPageRoute(
          builder: (context) => TermsAndConditionsScreen(),
        );

      case RoutesName.bottomNav:
        return MaterialPageRoute(builder: (context) => BottomNav());

      case RoutesName.profileScreen:
        return MaterialPageRoute(builder: (context) => ProfileScreen());

      case RoutesName.consultantProfileScreen:
        return MaterialPageRoute(
          builder: (context) => ConsultantProfileScreen(index: 0),
        );

      case RoutesName.allConsultantScreen:
        return MaterialPageRoute(builder: (context) => AllConsultantScreen());

      // Student Portal
      case RoutesName.studentProfileScreen:
        return MaterialPageRoute(builder: (context) => StudentProfileScreen());

      case RoutesName.studentChoiceScreen:
        return MaterialPageRoute(builder: (context) => StudentChoiceScreen());

      case RoutesName.studentHEScreen:
        return MaterialPageRoute(builder: (context) => StudentHEScreen());

      case RoutesName.studentAcademicScreen:
        return MaterialPageRoute(builder: (context) => StudentAcademicScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
