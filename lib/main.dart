import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'auth/login_page.dart';
import 'core/dependency_injection/app_component.dart';
import 'navigation/app_navigator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// flag modified by unit tests so that app's code can adapt to unit tests
/// (i.e: disable animations in progress bars etc.)
bool isUnitTests = false;

void main() {
  configureDependencies();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (BuildContext context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Template',
      useInheritedMediaQuery: true, // for DevicePreview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      navigatorKey: AppNavigator.navigatorKey,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff0a5bfe),
          // primary: const Color(0xff0a5bfe),
          // secondary: const Color(0xff0a5bfe),
          // error: const Color(0xffff0000),
          // background: const Color(0xffffffff),
          // surface: const Color(0xffFC224F),
          // tertiary: const Color(0xffF3C913),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          // elevation causes an unexpectable tint - disable it here by making tint white
          surfaceTintColor: Colors.white,
        ),
        textTheme: _buildTextTheme(),
      ),
      home: serviceLocator<LoginPage>(),
    );
  }
}

TextTheme _buildTextTheme() {
  return GoogleFonts.dmSansTextTheme(
    const TextTheme(
      headline1: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        // used in appBar, source: https://api.flutter.dev/flutter/material/TextTheme/headline6.html
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
      ),
    ),
  );
}
