// import 'package:eduwise/screens/consultant-profile/con_provider_model.dart';
// import 'package:eduwise/screens/consultant-profile/widget/con_profile_header.dart';
// import 'package:eduwise/screens/consultant-profile/widget/con_profile_review_section.dart';
// import 'package:eduwise/screens/consultant-profile/widget/con_profile_tab_section.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// /// 🔹 Main Screen for Consultant Profile
// class ConsultantProfileScreen extends StatelessWidget {
//   final int index; // to select which consultant profile

//   const ConsultantProfileScreen({super.key, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     final consultant = context
//         .read<ConsultantProfileProvider>()
//         .consultants[index];

//     return Scaffold(
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         physics:
//             const BouncingScrollPhysics(), // ✅ modern iOS/Android bounce effect
//         children: [
//           ConsultantProfileHeader(consultant: consultant),
//           const SizedBox(height: 20),
//           ConsultantTabSection(consultant: consultant),
//           const SizedBox(height: 20),
//           ConsultantReviewSection(consultant: consultant),
//           const SizedBox(height: 20),
//           // const ConsultantActionButtons(),
//         ],
//       ),
//     );
//   }
// }

import 'package:eduwise/screens/consultant-profile/con_provider_model.dart';
import 'package:eduwise/screens/consultant-profile/widget/con_profile_header.dart';
import 'package:eduwise/screens/consultant-profile/widget/con_profile_review_section.dart';
import 'package:eduwise/screens/consultant-profile/widget/con_profile_tab_section.dart';
import 'package:eduwise/widget/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 🔹 Main Screen for Consultant Profile
class ConsultantProfileScreen extends StatelessWidget {
  final int index; // to select which consultant profile

  const ConsultantProfileScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final consultant = context
        .read<ConsultantProfileProvider>()
        .consultants[index];

    return AppShell(
      body: ListView(
        padding: const EdgeInsets.all(16),
        physics:
            const BouncingScrollPhysics(), // ✅ modern iOS/Android bounce effect
        children: [
          ConsultantProfileHeader(consultant: consultant),
          const SizedBox(height: 20),
          ConsultantTabSection(consultant: consultant),
          ConsultantReviewSection(consultant: consultant),
          // const ConsultantActionButtons(),
        ],
      ),
    );
  }
}
