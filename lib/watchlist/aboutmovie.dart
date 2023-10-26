import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:provider/provider.dart';

class AboutMovie extends StatefulWidget {
  const AboutMovie({super.key});

  @override
  State<AboutMovie> createState() => _AboutMovieState();
}

class _AboutMovieState extends State<AboutMovie> {
  @override
  void initState() {
    super.initState();
    //context.read<FirebaseProvider>().aboutMovies(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Consumer<FirebaseProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return value.loading
                      ? const CircularProgressIndicator()
                      : value.detailsdata == null
                          ? const Text('No data', style: TextStyle(color: Colors.white),)
                          : Text(value.detailsdata!.overview!,
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: 'popins2'),
                            );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
