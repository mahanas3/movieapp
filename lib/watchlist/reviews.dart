import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xff242A32),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Image(image: AssetImage('assets/images/person1.png')),
                title: Text('Iqbal Shafiq Rozaan',
                    style:
                    TextStyle(fontFamily: 'popins2', color: Colors.white)),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                      'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government.',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'popins2')),
                ),
              ),
              SizedBox(height: 20,),
              ListTile(
                leading: Image(image: AssetImage('assets/images/person1.png')),
                title: Text('Iqbal Shafiq Rozaan',
                    style:
                    TextStyle(fontFamily: 'popins2', color: Colors.white)),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                      'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government.',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'popins2')),
                ),
              )
            ],
          ),
        ));
  }
}
