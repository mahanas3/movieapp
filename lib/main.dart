import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:movieapp/screens/blank.dart';
import 'package:movieapp/screens/bottomnavigation.dart';
import 'package:movieapp/screens/login.dart';
import 'package:movieapp/screens/screen1.dart';
import 'package:movieapp/screens/search.dart';
import 'package:movieapp/screens/signup.dart';
import 'package:movieapp/screens/watchlist.dart';
import 'package:provider/provider.dart';

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
        '/signuptextbutton': (context) => const Signup(),
        '/signup': (context) => const Screen1(),
        '/signin': (context) => const Login(),
        '/blank': (context) => const Blank(),
        '/rocking': (context) => const Blank(),
        '/singham': (context) => const Blank(),
        '/adipurush': (context) => const Blank(),
        '/salaar': (context) => const Blank(),
        '/yaaryaan': (context) => const Blank(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
