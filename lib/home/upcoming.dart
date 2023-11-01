import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:provider/provider.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FirebaseProvider>().upcomingMovie(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color(0xff242A32),
        body: Consumer<FirebaseProvider>(
            builder: (BuildContext context, value, Widget? child) {
          return value.loading
              ? const CircularProgressIndicator()
              : value.upcomingdata == null
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
                      itemCount: value.upcomingdata!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/blank',arguments: value.upcomingdata![index].id.toString());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w342${value.upcomingdata![index]
                                                .posterPath!}'),
                                    fit: BoxFit.fill)),
                          ),
                        );
                      },
                    );
        }));
  }
}
