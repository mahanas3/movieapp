import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:provider/provider.dart';

class TopRated extends StatefulWidget {
  const TopRated({super.key});

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FirebaseProvider>().topRatedMovies(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff242A32),
        body: Consumer<FirebaseProvider>(
            builder: (BuildContext context, value, Widget? child) {
          return value.loading
              ? const CircularProgressIndicator()
              : value.toprateddata == null
                  ? const Center(
                      child: Text(
                      'No data',
                      style: TextStyle(color: Colors.white),
                    ))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2 / 3,
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8),
                      itemCount: value.toprateddata?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/blank');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/original' +
                                            value.toprateddata![index]
                                                .posterPath!),
                                    fit: BoxFit.fill)),
                          ),
                        );
                      },
                    );
        }));
  }
}
