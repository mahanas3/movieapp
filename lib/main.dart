import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:movieapp/screens/blank.dart';
import 'package:movieapp/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home/bottomnavigation.dart';
import 'home/movielist.dart';

bool? email;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    email=prefs?.getBool('emailcontroller')??false;

  runApp(ChangeNotifierProvider(
    create: (context) => FirebaseProvider(),
    child: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/login': (context) => const BottomNavigation(),
        '/signup': (context) => const MovieList(),
        '/blank': (context) => const Blank(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
