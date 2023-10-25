import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:provider/provider.dart';

class CustomSearchedelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<FirebaseProvider>().searchMovies(context, query);
    return Consumer<FirebaseProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return value.loading
          ? const CircularProgressIndicator()
          : value.searchdata == null
              ? const Text('No data')
              : Container(
                  color: const Color(0xff242A32),
                  child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: value.searchdata!.length,
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
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w300${value.searchdata![index].posterPath!}'),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.searchdata![index].title!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'popins2',
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Row(
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
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Row(
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
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Row(
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
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Row(
                                    children: [
                                      Icon(CupertinoIcons.clock,
                                          color: Colors.white),
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
                          )),
                );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<FirebaseProvider>().searchMovies(context, query);
    return Consumer<FirebaseProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return Container(
        color: const Color(0xff242A32),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: value.searchdata!.length,
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
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w300${value.searchdata![index].posterPath!}'),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value.searchdata![index].title!,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'popins2',
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
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
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
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
                                  color: Colors.white, fontFamily: 'popins2'),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
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
                                  fontFamily: 'popins2', color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          children: [
                            Icon(CupertinoIcons.clock, color: Colors.white),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '139 minutes',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'popins2'),
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
                )),
      );
    });
  }
}
