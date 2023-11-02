import 'package:flutter/material.dart';
import 'package:movieapp/provider/firebase_provider.dart';
import 'package:movieapp/utilities/dimensions.dart';
import 'package:provider/provider.dart';

class Reviews extends StatefulWidget {
  Reviews({super.key, required this.id});

  String id;

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FirebaseProvider>().reviews(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff242A32),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Dimensions.heightCalc(context, 300),
                child: Consumer<FirebaseProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                  return ListView.builder(
                      itemCount: value.reviewdata?.length,

                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const Image(
                              image: AssetImage('assets/images/person1.png')),
                          title: Text(value.reviewdata![index].author!,
                              style: const TextStyle(
                                  fontFamily: 'popins2', color: Colors.white)),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(value.reviewdata![index].content!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'popins2')),
                          ),
                        );
                      });
                }),
              ),
            ],
          ),
        ));
  }
}
