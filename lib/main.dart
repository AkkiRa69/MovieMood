import 'package:flutter/material.dart';
import 'package:flutter_homework_3_movie_ui/views/main_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.spaceGroteskTextTheme(),
      ),
      home: const MainView(),
    );
  }
}
