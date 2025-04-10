import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homzes_app/screens/onboarding_screen.dart';


class HomzesApp extends StatelessWidget {
  const HomzesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homzes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4CAF50)),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}