import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:movieapp/routs/route.dart';
import 'package:movieapp/services/theme_services.dart';
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

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    final firebaseProvider = context.watch<FirebaseProvider>();

    final isDarkMode = firebaseProvider.isDark;

    return Consumer<FirebaseProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return MaterialApp(
        title: 'Light Theme',
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        darkTheme: ThemeServices.buildDarkTheme(),
        theme: ThemeServices.buildLightTheme(),
        initialRoute: email == false ? '/' : '/home',
        onGenerateRoute: AppRoute.routesetting,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
