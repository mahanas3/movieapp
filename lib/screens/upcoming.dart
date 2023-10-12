import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List images2 = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh-1cLUSqn8YYvEt5ePA-uKfcQbHy5PcegRWj_y_S68dQJZaGD3uetHU7pmD8pz2VXMM0&usqp=CAU',
    'https://m.media-amazon.com/images/M/MV5BZjQ5ZDNlZWMtZTA2Mi00MDRjLWE1NTItYWI0ZjQzNjkwYTUyXkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWnnl7bh7FIs6Uh45xBQ3s9M47r5sElSVQIA&usqp=CAU',
    'https://igimages.gumlet.io/tamil/home/mrx-arya-gauthamkarthik-2062023.jpg?w=376&dpr=2.6',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8XcOaS5QYcvijOgG1ONcAJ2k5u2IlPsj10xiAyDk_3Naauno3OyuY_1XyKgW0IpRiJpY&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJfZWBMqYfwSWNzcgNkLLC_OgaFBaQbh0eF9XtvUaqhpBxdSu7fSUKR1VxAmPE89UECG4&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff242A32),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 3,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8),
          itemCount: images2.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: NetworkImage(images2[index]),fit: BoxFit.fill)),
            );
          },
        ));
  }
}
