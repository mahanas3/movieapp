import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeServices{
  static  ThemeData buildDarkTheme() {
    return ThemeData(
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff242A32)),
      primarySwatch: Colors.blue,
      tabBarTheme: const TabBarTheme(labelColor: Colors.white),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
      textTheme: TextTheme(
        headline4: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.yellowAccent,
        ),
        headline3: GoogleFonts.oswald(
          fontSize: 30,
          fontStyle: FontStyle.italic,
          color: Colors.red,
        ),
      ),
    );
  }

  static ThemeData buildLightTheme() {
    return ThemeData(
      bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Colors.grey),
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black)),
      tabBarTheme: const TabBarTheme(labelColor: Colors.black),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
      ),
      textTheme: TextTheme(
        headline4: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
        headline3: GoogleFonts.oswald(
          fontSize: 30,
          fontStyle: FontStyle.italic,
          color: Colors.orange,
        ),
      ),
    );
}}