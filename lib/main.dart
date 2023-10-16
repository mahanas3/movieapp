import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:movieapp/screens/blank.dart';
import 'package:movieapp/screens/login.dart';
import 'package:provider/provider.dart';
import 'home/bottomnavigation.dart';
import 'home/movielist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
