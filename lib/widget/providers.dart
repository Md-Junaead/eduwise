import 'package:provider/provider.dart';

// 🔹 Import all your providers here
import 'package:eduwise/provider/sign_in_provider.dart';
import 'package:eduwise/screens/consultant-profile/con_provider_model.dart';
import 'package:eduwise/widget/app_state.dart';

/// A central place to manage all app-wide providers.
/// Keeps main.dart clean.
class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<SignInProvider>(create: (_) => SignInProvider()),
    ChangeNotifierProvider<ConsultantProfileProvider>(
      create: (_) => ConsultantProfileProvider(),
    ),
    ChangeNotifierProvider<AppState>(create: (_) => AppState()),
  ];
}
