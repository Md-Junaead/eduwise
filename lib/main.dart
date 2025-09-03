import 'package:eduwise/configs/routes/routes.dart';
import 'package:eduwise/configs/routes/routes_name.dart';
import 'package:eduwise/provider/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'configs/core/app_theme.dart';

void main() {
  runApp(const MyApp());
}

// flutter build apk --build-name=1.0 --build-number=1

//Root widget with Provider for state management.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Register all app-wide providers here
      providers: [ChangeNotifierProvider(create: (_) => SignInProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eduwise',
        theme: AppTheme.light, // Centralized theme
        // 👇 Added Routing system
        initialRoute: RoutesName.homeScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
