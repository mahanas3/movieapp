import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List filmimages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl7Lc-RGJiHw764puwyAElGyy6_pJi5f7YeA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMpHAJj9qDK_ZxenCgb_0otJHiRDp-RKqcCw&usqp=CAU'
  ];

  final searchcontroller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: const Color(0xff242A32),
        title: const Center(
            child: Text('Search',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'popins2',
                    fontWeight: FontWeight.w800,
                    fontSize: 20))),
      ),
      backgroundColor: const Color(0xff242A32),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 50,
              width: 330,
              child: CustomTextField(
                  text1: 'Spiderman',
                  text2: 'search',
                  icon: const Icon(Icons.search),
                  controller: searchcontroller1),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemCount: filmimages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Container(
                          height: 200,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(filmimages[index]),
                                  fit: BoxFit.fill)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Spiderman',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'popins2',
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: Color(0xffFF9800),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '9.5',
                                  style: TextStyle(color: Color(0xffFF9800)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.call_to_action,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Action',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'popins2'),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '2019',
                                  style: TextStyle(
                                      fontFamily: 'popins2',
                                      color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(CupertinoIcons.clock, color: Colors.white),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '139 minutes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'popins2'),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: 20,
                    ))
          ]),
        ),
      ),
    );
  }
}
