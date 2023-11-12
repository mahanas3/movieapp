import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:provider/provider.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, ()
    {
      context.read<FirebaseProvider>().popularMovie(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: const Color(0xff242A32),
        body: Consumer<FirebaseProvider>(
            builder: (BuildContext context, value, Widget? child) {
          return value.loading
              ? const CircularProgressIndicator()
              : value.populardata == null
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
                      itemCount: value.populardata!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/blank',arguments: value.populardata![index].id.toString());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/original${value.populardata![index]
                                                .posterPath!}'),
                                    fit: BoxFit.fill)),
                          ),
                        );
                      });
        }));
  }
}
