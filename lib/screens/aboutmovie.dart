import 'package:flutter/material.dart';

class AboutMovie extends StatefulWidget {
  const AboutMovie({super.key});

  @override
  State<AboutMovie> createState() => _AboutMovieState();
}

class _AboutMovieState extends State<AboutMovie> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff242A32),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(28.0),
              child: Text(
                'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
                style: TextStyle(color: Colors.white,fontFamily: 'popins2'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
