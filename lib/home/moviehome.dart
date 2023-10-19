import 'package:flutter/material.dart';
import 'package:movieapp/home/popular.dart';
import 'package:movieapp/home/toprated.dart';
import 'package:movieapp/home/tvshows.dart';
import 'package:movieapp/home/upcoming.dart';
import '../widgets/custom_textfield.dart';
import 'nowplaying.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final searchcontroller = TextEditingController();

  TabController? _tabController;

  List images = [
    'assets/images/images1.jfif',
    'assets/images/image2.jfif',
    'assets/images/image3.jfif',
    'assets/images/image4.jfif',
    'assets/images/image5.jfif'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'What do you want to watch?',
                  style: TextStyle(
                      fontFamily: 'popins2',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 330,
              child: CustomTextField(
                  controller: searchcontroller,
                  text1: 'Search',
                  text2: "Search",
                  icon: const Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 210,
              width: double.infinity,
              child: ListView.separated(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.fill)),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TabBar(
                controller: _tabController,
                labelColor: const Color(0xff67686D),
                isScrollable: true,
                tabs: [
                  InkWell(
                    onTap: () {},
                    child: const Tab(
                      child: Text(
                        'Now Playing',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'popins2'),
                      ),
                    ),
                  ),
                  const Tab(
                    child: Text('Upcoming',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'popins2')),
                  ),
                  const Tab(
                    child: Text('Top rated',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'popins2')),
                  ),
                  const Tab(
                    child: Text('Popular',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'popins2')),
                  ),
                  const Tab(
                    child: Text(
                      'Tv shows',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'popins2'),
                    ),
                  )
                ]),
            Expanded(
              child: TabBarView(controller: _tabController, children: const [
                Playing(),
                Upcoming(),
                TopRated(),
                Popular(),
                Tvshow()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
