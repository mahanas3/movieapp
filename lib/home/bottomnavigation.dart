import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../search/searchmovies.dart';
import '../watchlist/watchlistes.dart';
import 'movielist.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  List navigation = [
    const MovieList(),
    const Search(),
    const WatchList(),
  ];

  void onitemTapped(int num) {
    setState(() {
      index = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigation[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff242A32),
        currentIndex: index,
        onTap: onitemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: 'Watch list'),

        ],
      ),
    );
  }
}
