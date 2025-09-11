import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StudentDashboardController extends GetxController {
  // Simple static list (no need for reactivity since it doesn’t change)
  final menuItems = [
    {"title": "Account", "icon": Icons.person},
    {"title": "Balance", "icon": Icons.account_balance_wallet},
    {"title": "Your Choice", "icon": Icons.favorite},
    {"title": "Qualification", "icon": Icons.school},
    {"title": "Service", "icon": Icons.design_services},
    {"title": "Consultant", "icon": Icons.support_agent},
    {"title": "Logout", "icon": Icons.logout},
  ];
}

/// ----------------- CONTROLLER -----------------
/// Using GetX controller to manage dashboard state
// class StudentDashboardController extends GetxController {
//   // Menu items stored in a list of maps (acts like an algorithmic data structure for easy iteration)
//   final menuItems = [
//     {"title": "Account", "icon": Icons.person},
//     {"title": "Balance", "icon": Icons.account_balance_wallet},
//     {"title": "Your Choice", "icon": Icons.favorite},
//     {"title": "Qualification", "icon": Icons.school},
//     {"title": "Service", "icon": Icons.design_services},
//     {"title": "Consultant", "icon": Icons.support_agent},
//     {"title": "Logout", "icon": Icons.logout},
//   ];
// }

/*
Account -- StudentProfileScreen
Balance -- None
Your Choice -- StudentChoiceScreen
Qualification -- StudentHEScreen
Service -- None
Consultunt -- StudentConsultantScreen
Logout -- None


*/
