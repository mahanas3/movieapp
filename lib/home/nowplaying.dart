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
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FirebaseProvider>().nowPlaying(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: SingleChildScrollView(
        child: Consumer<FirebaseProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return value.loading
                ? const CircularProgressIndicator()
                : GridView.builder(
                    itemCount: value.datas.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3,
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8),
                    itemBuilder: (BuildContext context, int index) {
                      if(value.datas!=null) {
                        return SizedBox(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/blank');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${value.datas![index].posterPath!}'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      );
                      }
                    },
                  );
          },
        ),
      ),
    );
  }
}
