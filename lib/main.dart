import 'package:flutter/material.dart';
import 'package:game_template/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Template',
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
          surfaceTintColor:
              Colors.white, // elevation causes an unexpectable tint - disable it here by making tint white
        ),
        textTheme: _buildTextTheme(),
      ),
      home: const MyHomePage(title: 'Game Template'),
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
