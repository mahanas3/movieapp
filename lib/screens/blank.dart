import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../watchlist/aboutmovie.dart';
import '../watchlist/cast.dart';
import '../watchlist/reviews.dart';

class Blank extends StatefulWidget {
  const Blank({super.key});

  @override
  State<Blank> createState() => _BlankState();
}

class _BlankState extends State<Blank>
    with SingleTickerProviderStateMixin {
  TabController? _tabController1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController1 = TabController(length: 3, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: const Color(0xff242A32),
        title: const Center(
            child: Text('Detail',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'popins2',
                    fontWeight: FontWeight.w800,
                    fontSize: 20))),
      ),
      body: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm47mhbz0nvrVN13cC9766wtMveD6_Kz4zzA&usqp=CAU'),
                      fit: BoxFit.fill)),
            ),
            Positioned(
              bottom: -80,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                    height: 170,
                    width: 110,
                    alignment: AlignmentDirectional.bottomEnd,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM9NpldoJ-BR9C38MH-Hxf5FpTxofIXIELTQ&usqp=CAUa'),
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 50,
              child: Container(
                height: 30,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff67686D)),
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Icon(Icons.star_border, color: Color(0xffFF9800)),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '9.5',
                        style: TextStyle(color: Color(0xffFF9800)),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
          const Padding(
            padding: EdgeInsets.only(left: 155, top: 30),
            child: Text(
              'Spiderman No Way Home',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'popins2',
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 40),
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: Color(0xff92929D),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  '2021',
                  style: TextStyle(
                      color: Color(0xff92929D), fontFamily: 'popins2'),
                ),
              ),
              VerticalDivider(
                color: Colors.black,
                width: 20,
                thickness: 8,
                indent: 20,
                endIndent: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Icon(
                  CupertinoIcons.clock,
                  color: Color(0xff92929D),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  '148 minutes',
                  style: TextStyle(
                      color: Color(0xff92929D), fontFamily: 'popins2'),
                ),
              ),
              VerticalDivider(
                color: Colors.black,
                width: 20,
                thickness: 8,
                indent: 20,
                endIndent: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Icon(
                  Icons.call_to_action,
                  color: Color(0xff92929D),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
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
            child: TabBarView(
                controller: _tabController1,
                children: const [AboutMovie(), Reviews(), Cast()]),
          )
        ],
      ),
    );
  }
}
