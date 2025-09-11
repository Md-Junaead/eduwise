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
        initialRoute: RoutesName.bottomNav,
        onGenerateRoute: Routes.generateRoute,

        // ✅ Now super clean: just point to AppBindings
        initialBinding: AppBindings(),

        // Optional: Set default transition for navigation
        defaultTransition: Transition.fade,
      ),
    );
  }
}


/*

For an education consultant service mobile app, the color palette should convey trust, professionalism, and approachability while remaining calm and readable. Here’s a guideline:

Primary Color

Blue shades: Blue is widely associated with trust, intelligence, and reliability.

Examples:

Royal Blue (#2A52BE) – professional, trustworthy

Teal Blue (#008080) – modern and friendly

Sky Blue (#00AEEF) – clean, fresh, approachable

Secondary / Accent Colors

Orange (#FF8C00) – energy, motivation, calls-to-action (buttons)

Green (#28A745) – success messages, highlights

Yellow (#FFD700) – subtle highlights, cheerful elements

Neutral / Background Colors

Light Gray (#F5F5F5) – background areas, safe for text readability

White (#FFFFFF) – forms, cards, main content areas

Dark Gray (#333333) – text for high readability

Suggested Combinations

Primary: Royal Blue
Secondary: Orange (for buttons, highlights)
Neutral: White & Light Gray

Primary: Teal Blue
Secondary: Yellow
Neutral: White & Dark Gray

*/