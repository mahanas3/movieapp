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
    context.read<FirebaseProvider>().popularMovie();
  }
  List image4 = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR37DYMRWemepJ5GMmCTwZIxs2M0LMDemuGHXjsF5ePiC8mSMt0hWWr7LqS3MUi9d8MDng&usqp=CAU',
    'https://akm-img-a-in.tosshub.com/sites/visualstory/wp/2023/07/Snapinsta.app_285644098_3149813968666247_5541496698373498368_n_1080.jpg?size=*:900',
    'https://i.pinimg.com/1200x/e9/f1/48/e9f148899b76bedbea4c3f2f4758201d.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT50aNBty24Q7MU2xMMXTpow93a7HnxoiR0odJL7JJhvjqYWb6NIyOPBVX_VSoFmeuO8V0&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzqg3_2sxwLcJiTjAkB5wr_lMzNIuwu_qhrPYT4SXB1_YTyU7LBbIFI3gHvgTumXupAdY&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVHtUo2hODTa6zJEFzxmulz8be0bNMU9rfgA&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xff242A32),
        body: Consumer<FirebaseProvider>(
            builder: (BuildContext context, value, Widget? child) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 3,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8),
            itemCount: value.populardata.length,
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
                              'https://image.tmdb.org/t/p/w500' +
                                  value.populardata[index].posterPath!
                          ),
                          fit: BoxFit.fill)),
                ),
              );
            },
          );
        }));
  }
}
