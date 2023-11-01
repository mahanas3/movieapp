import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:movieapp/routs/route.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? email;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs?.getBool('islogedIn') ?? false;

  runApp(ChangeNotifierProvider(
    create: (context) => FirebaseProvider(),
    child: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseProvider = context.watch<FirebaseProvider>();

    final isDarkMode = firebaseProvider.isDark;

    return Consumer<FirebaseProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return MaterialApp(
        title: 'Light Theme',
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        darkTheme: _buildDarkTheme(),
        theme: _buildLightTheme(),
        initialRoute: email == false ? '/' : '/home',
        onGenerateRoute: AppRoute.routesetting,
        debugShowCheckedModeBanner: false,
      );
    });
  }

  ThemeData _buildDarkTheme() {
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

  ThemeData _buildLightTheme() {
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
  }
}
