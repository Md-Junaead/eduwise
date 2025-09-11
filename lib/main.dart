import 'package:eduwise/widget/app_bindings.dart';
import 'package:eduwise/widget/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'package:eduwise/configs/core/app_theme.dart';
import 'package:eduwise/configs/routes/routes.dart';
import 'package:eduwise/configs/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

// flutter build apk --build-name=1.0 --build-number=1

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers, // ✅ Provider stays intact
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eduwise',
        theme: AppTheme.light,
        initialRoute: RoutesName.consultantEducationScreen,
        onGenerateRoute: Routes.generateRoute,

        // ✅ Now super clean: just point to AppBindings
        initialBinding: AppBindings(),

        // Optional: Set default transition for navigation
        defaultTransition: Transition.fade,
      ),
    );
  }
}
