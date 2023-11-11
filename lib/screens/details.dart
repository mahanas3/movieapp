import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:movieapp/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import '../watchlist/aboutmovie.dart';
import '../watchlist/cast.dart';
import '../watchlist/reviews.dart';

class Blank extends StatefulWidget {
  Blank({super.key, required this.id});

  String id;

  @override
  State<Blank> createState() => _BlankState();
}

class _BlankState extends State<Blank> with SingleTickerProviderStateMixin {
  TabController? _tabController1;

  @override
  void initState() {
    // TODO: implement initState
    print(widget.id);
    context.read<FirebaseProvider>().details(context, widget.id);
    //context.read<FirebaseProvider>().video(context, widget.id);

    super.initState();
    _tabController1 = TabController(length: 3, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                context.read<FirebaseProvider>().loadUsers(context);
                Navigator.pushNamed(context, '/watchlist');
              },
              child: const Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
            ),
          )
        ],
        backgroundColor: const Color(0xff242A32),
        title: Center(
            child: Text('Details',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'popins2',
                    fontWeight: FontWeight.w800,
                    fontSize: Dimensions.heightCalc(context, 20)))),
      ),
      body: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Consumer<FirebaseProvider>(
                builder: (BuildContext context, value, Widget? child) {
              return value.loading
                  ? const CircularProgressIndicator()
                  : value.detailsdata == null
                      ? const Text('Image not exist')
                      : Container(
                          height: Dimensions.heightCalc(context, 200),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/original${value.detailsdata?.backdropPath}'),
                                  fit: BoxFit.fill)),
                        );
            }),
            Positioned(
              bottom: -80,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Consumer<FirebaseProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                  return value.loading
                      ? const CircularProgressIndicator()
                      : value.detailsdata == null
                          ? const Text('Image not exist')
                          : Container(
                              height: Dimensions.heightCalc(context, 170),
                              width: Dimensions.widthCalc(context, 110),
                              alignment: AlignmentDirectional.bottomEnd,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w780${value.detailsdata!.posterPath!}'),
                                  fit: BoxFit.fill,
                                ),
                              ));
                }),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 50,
              child: Container(
                height: Dimensions.heightCalc(context, 30),
                width: Dimensions.widthCalc(context, 65),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff67686D)),
                child: Row(
                  children: [
                    const Icon(Icons.star_border, color: Color(0xffFF9800)),
                    const SizedBox(
                      width: 5,
                    ),
                    Consumer<FirebaseProvider>(
                        builder: (BuildContext context, value, Widget? child) {
                      return value.loading
                          ? const CircularProgressIndicator()
                          : value.detailsdata == null
                              ? const Text('No data')
                              : Text(
                                  value.detailsdata!.voteCount.toString(),
                                  style:
                                      const TextStyle(color: Color(0xffFF9800)),
                                );
                    })
                  ],
                ),
              ),
            ),
            Positioned(
              top: 160,
              left: 150,
              child: Consumer<FirebaseProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/videoply',
                        arguments: value.videodata!.id);
                  },
                  child: Container(
                    height: 30,
                    width: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black87),
                    child: const Icon(Icons.play_circle),
                  ),
                );
              }),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 155, top: 30),
            child: Consumer<FirebaseProvider>(
                builder: (BuildContext context, value, Widget? child) {
              return value.loading
                  ? const CircularProgressIndicator()
                  : value.detailsdata == null
                      ? const Text('Title not found')
                      : Text(
                          value.detailsdata!.title!,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'popins2',
                              fontWeight: FontWeight.w900,
                              fontSize: Dimensions.heightCalc(context, 20)),
                        );
            }),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 10),
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: Color(0xff92929D),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Consumer<FirebaseProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                  return value.loading
                      ? const CircularProgressIndicator()
                      : value.detailsdata == null
                          ? const Text('No data')
                          : Text(
                              value.detailsdata!.releaseDate.toString(),
                              style: const TextStyle(
                                  color: Color(0xff92929D),
                                  fontFamily: 'popins2'),
                            );
                }),
              ),
              const VerticalDivider(
                color: Colors.black,
                width: 20,
                thickness: 8,
                indent: 20,
                endIndent: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Icon(
                  CupertinoIcons.clock,
                  color: Color(0xff92929D),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Consumer<FirebaseProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                  return value.loading
                      ? const CircularProgressIndicator()
                      : value.detailsdata == null
                          ? const Text('No data')
                          : Text(
                              '${value.detailsdata!.runtime}minutes',
                              style: const TextStyle(
                                  color: Color(0xff92929D),
                                  fontFamily: 'popins2'),
                            );
                }),
              ),
              const VerticalDivider(
                color: Colors.black,
                width: 20,
                thickness: 8,
                indent: 20,
                endIndent: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Icon(
                  Icons.call_to_action,
                  color: Color(0xff92929D),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Action',
                  style: TextStyle(
                      color: Color(0xff92929D), fontFamily: 'popins2'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TabBar(controller: _tabController1, tabs: const [
            Tab(
              child: Text('About Movie',
                  style: TextStyle(fontFamily: 'popins2', color: Colors.white)),
            ),
            Tab(
              child: Text('Reviews',
                  style: TextStyle(fontFamily: 'popins2', color: Colors.white)),
            ),
            Tab(
              child: Text('Cast',
                  style: TextStyle(fontFamily: 'popins2', color: Colors.white)),
            ),
          ]),
          Expanded(
            child: TabBarView(controller: _tabController1, children: [
              const AboutMovie(),
              Reviews(
                id: widget.id,
              ),
              const Cast()
            ]),
          )
        ],
      ),
    );
  }
}
