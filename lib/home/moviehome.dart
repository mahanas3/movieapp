import 'package:flutter/material.dart';
import 'package:movieapp/home/popular.dart';
import 'package:movieapp/home/searchDelegate.dart';
import 'package:movieapp/home/toprated.dart';
import 'package:movieapp/home/upcoming.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:provider/provider.dart';
import 'nowplaying.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final searchcontroller = TextEditingController();

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    context.read<FirebaseProvider>().moviesList(context);
  }

  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      return await false;
    }, child: Consumer<FirebaseProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(value!.isDark ? "Dark Mode" : "Light Mode"),
          actions: [
            IconButton(
                icon: Icon(
                    value.isDark ? Icons.nightlight_round : Icons.wb_sunny),
                onPressed: () {
                  value.isDark ? value.isDark = false : value.isDark = true;
                })
          ],
        ),
        //backgroundColor: const Color(0xff242A32),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
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
                child: Consumer<FirebaseProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                  return value.loading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            //backgroundColor: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            showSearch(
                                context: context,
                                delegate: CustomSearchedelegate());
                          },
                          child: const Text(
                            'Search',
                            style: TextStyle(fontFamily: 'popins2'),
                          ));
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 210,
                width: double.infinity,
                child: Consumer<FirebaseProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    bool isDark = value.isDark;
                    isDark ? Colors.black : Colors.white;
                    return value.loading
                        ? const CircularProgressIndicator()
                        : value.moviesdata == null
                            ? const Center(
                                child: Text(
                                  'No data',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            : ListView.separated(
                                itemCount: value.moviesdata!.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://image.tmdb.org/t/p/w300${value.moviesdata![index].posterPath!}'),
                                            fit: BoxFit.fill)),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                  width: 20,
                                ),
                              );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  controller: _tabController,
                  //labelColor: Theme.of(context),
                  //labelColor: const Color(0xff67686D),
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      child: Text(
                        'Now Playing',
                        style: TextStyle(fontFamily: 'popins2'),
                      ),
                    ),
                    Tab(
                      child: Text('Upcoming',
                          style: TextStyle(fontFamily: 'popins2')),
                    ),
                    Tab(
                      child: Text('Top rated',
                          style: TextStyle(fontFamily: 'popins2')),
                    ),
                    Tab(
                      child: Text('Popular',
                          style: TextStyle(fontFamily: 'popins2')),
                    ),
                  ]),
              Expanded(
                child: TabBarView(controller: _tabController, children: const [
                  Playing(),
                  Upcoming(),
                  TopRated(),
                  Popular(),
                ]),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
