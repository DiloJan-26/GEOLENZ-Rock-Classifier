import 'package:flutter/material.dart';
import 'logo_page.dart';

void main() {
  runApp(const GeoLenzApp());
}

class GeoLenzApp extends StatelessWidget {
  const GeoLenzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GeoLenz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 4, 121, 109)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 212, 236, 228),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 190, 239, 212), // Global AppBar background color
          foregroundColor: Color.fromARGB(255, 3, 2, 69), // Global AppBar text/icon color
        ),
        useMaterial3: true,
      ),
      home: const LogoPage(),
    );
  }
}
