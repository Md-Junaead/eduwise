import 'package:eduwise/screens/consultant-dashboard/add-service/con_service_view.dart';
import 'package:eduwise/screens/consultant-dashboard/dashboard/con_dash_view.dart';
import 'package:eduwise/screens/consultant-dashboard/educational-qualification/con_edu_qua_view.dart';
import 'package:eduwise/screens/consultant-dashboard/experience/con_work_view.dart';
import 'package:eduwise/screens/student-dashboard/consultant/stu_cons_view.dart';
import 'package:eduwise/screens/student-dashboard/dashboard/stu_dboard_view.dart';
import 'package:eduwise/screens/student-dashboard/qualification/stu_high_edu_view.dart';
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

      case RoutesName.studentConsultantScreen:
        return MaterialPageRoute(
          builder: (context) => StudentConsultantScreen(),
        );

      case RoutesName.studentDashBoardScreen:
        return MaterialPageRoute(
          builder: (context) => StudentDashBoardScreen(),
        );

      // Consultunt Profile

      case RoutesName.consultantWorkExperienceScreen:
        return MaterialPageRoute(
          builder: (context) => ConsultantWorkExperienceScreen(),
        );

      case RoutesName.consultantServiceCreateView:
        return MaterialPageRoute(
          builder: (context) => ConsultantServiceCreateView(),
        );

      case RoutesName.consultantEducationScreen:
        return MaterialPageRoute(
          builder: (context) => ConsultantEducationScreen(),
        );

      case RoutesName.consultantDashboardView:
        return MaterialPageRoute(
          builder: (context) => ConsultantDashboardView(),
        );

      // Default Profile

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
