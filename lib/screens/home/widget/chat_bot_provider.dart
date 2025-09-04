// import 'package:flutter/material.dart';

// class ChatBotProvider extends ChangeNotifier {
//   bool lookingForAbroad = false;
//   String? fullName;
//   String? mobile;
//   String? email;
//   String? studyCompleted;
//   String? preferredCountry;

//   int currentStep = 0;

//   /// Update methods
//   void toggleAbroad(bool value) {
//     lookingForAbroad = value;
//     nextStep();
//   }

//   void setFullName(String value) {
//     fullName = value;
//     nextStep();
//   }

//   void setMobile(String value) {
//     mobile = value;
//     nextStep();
//   }

//   void setEmail(String value) {
//     email = value;
//     nextStep();
//   }

//   void setStudyCompleted(String value) {
//     studyCompleted = value;
//     nextStep();
//   }

//   void setPreferredCountry(String value) {
//     preferredCountry = value;
//     nextStep();
//   }

//   void nextStep() {
//     currentStep++;
//     notifyListeners();
//   }

//   void reset() {
//     lookingForAbroad = false;
//     fullName = null;
//     mobile = null;
//     email = null;
//     studyCompleted = null;
//     preferredCountry = null;
//     currentStep = 0;
//     notifyListeners();
//   }

//   Map<String, dynamic> get getData => {
//     "lookingForAbroad": lookingForAbroad,
//     "fullName": fullName,
//     "mobile": mobile,
//     "email": email,
//     "studyCompleted": studyCompleted,
//     "preferredCountry": preferredCountry,
//   };
// }

import 'package:flutter/material.dart';

class ChatBotProvider extends ChangeNotifier {
  bool lookingForAbroad = false;
  String? fullName;
  String? mobile;
  String? email;
  String? studyCompleted;
  String? preferredCountry;

  int currentStep = 0;

  /// Update methods
  void toggleAbroad(bool value) {
    lookingForAbroad = value;
    debugPrint("✅ toggleAbroad → $lookingForAbroad");
    nextStep();
  }

  void setFullName(String value) {
    fullName = value;
    debugPrint("✅ setFullName → $fullName");
    nextStep();
  }

  void setMobile(String value) {
    mobile = value;
    debugPrint("✅ setMobile → $mobile");
    nextStep();
  }

  void setEmail(String value) {
    email = value;
    debugPrint("✅ setEmail → $email");
    nextStep();
  }

  void setStudyCompleted(String value) {
    studyCompleted = value;
    debugPrint("✅ setStudyCompleted → $studyCompleted");
    nextStep();
  }

  void setPreferredCountry(String value) {
    preferredCountry = value;
    debugPrint("✅ setPreferredCountry → $preferredCountry");
    nextStep();
  }

  void nextStep() {
    if (currentStep < 6) {
      currentStep++;
      debugPrint("➡️ nextStep → $currentStep");
      notifyListeners();
    } else {
      debugPrint("⚠️ nextStep ignored → already at $currentStep");
    }
  }

  void reset() {
    lookingForAbroad = false;
    fullName = null;
    mobile = null;
    email = null;
    studyCompleted = null;
    preferredCountry = null;
    currentStep = 0;
    debugPrint("🔄 ChatBot state reset");
    notifyListeners();
  }

  Map<String, dynamic> get getData => {
    "lookingForAbroad": lookingForAbroad,
    "fullName": fullName,
    "mobile": mobile,
    "email": email,
    "studyCompleted": studyCompleted,
    "preferredCountry": preferredCountry,
  };
}
