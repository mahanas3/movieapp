import 'dart:async';

import 'package:flutter/material.dart';

import '../home/movielist.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MovieList()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff33363D),
      body: Center(
        child: Container(
          child: Image.asset('assets/images/pop.png'),
        ),
      ),
    );
  }
}
