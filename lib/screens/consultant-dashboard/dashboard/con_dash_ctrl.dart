import 'package:eduwise/screens/consultant-dashboard/add-service/con_service_view.dart';
import 'package:eduwise/screens/consultant-dashboard/educational-qualification/con_edu_qua_view.dart';
import 'package:eduwise/screens/consultant-dashboard/experience/con_work_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// ------------------- CONTROLLER -------------------
/// Using GetX for state management
class ConsultantDashboardController extends GetxController {
  /// Menu items stored in a list of maps for easy access
  /// This makes UI building O(n) for n items and lookup O(1)
  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Work Experience",
      "icon": Icons.work,
      "destination": const ConsultantWorkExperienceScreen(),
    },
    {
      "title": "Education",
      "icon": Icons.school,
      "destination": const ConsultantEducationScreen(),
    },
    {
      "title": "Create Service",
      "icon": Icons.add_box,
      "destination": ConsultantServiceCreateView(),
    },
    {
      "title": "Service",
      "icon": Icons.design_services,
      "destination": null, // TODO: Replace with your Service screen
    },
    {
      "title": "Review",
      "icon": Icons.reviews,
      "destination": null, // TODO: Replace with your Review screen
    },
    {
      "title": "Training Course",
      "icon": Icons.menu_book,
      "destination": null, // TODO: Replace with your Training Course screen
    },
    {
      "title": "Profile",
      "icon": Icons.person,
      "destination": null, // TODO: Replace with your Profile screen
    },
  ];
}
