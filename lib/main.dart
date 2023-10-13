import 'package:flutter/material.dart';
import 'package:movieapp/screens/bottomnavigation.dart';
import 'package:movieapp/screens/nowplaying.dart';
import 'package:movieapp/screens/screen1.dart';
import 'package:movieapp/screens/login.dart';
import 'package:movieapp/screens/splashscreen.dart';
import 'package:movieapp/screens/toprated.dart';
import 'package:movieapp/screens/upcoming.dart';

void main(){
  runApp(const Main());
}
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
