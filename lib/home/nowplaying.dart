import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:provider/provider.dart';

class Playing extends StatefulWidget {
  const Playing({super.key});

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  @override
  Widget build(BuildContext context) {
    context.read<FirebaseProvider>().nowPlaying(context);
    return Scaffold(
      // backgroundColor: const Color(0xff242A32),
      body: SingleChildScrollView(
        child: Consumer<FirebaseProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return value.loading
                ? const CircularProgressIndicator()
                : value.nowplayingdata == null
                    ? const Center(
                        child: Text(
                          'No data',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : GridView.builder(
                        itemCount: value.nowplayingdata!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2 / 3,
                                crossAxisCount: 3,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8),
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/blank',
                                    arguments: value.nowplayingdata![index].id
                                        .toString());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500${value.nowplayingdata![index].posterPath!}'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          );
                        },
                      );
          },
        ),
      ),
    );
  }
}
