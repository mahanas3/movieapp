import 'package:flutter/material.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  List images1 = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv_6EsxkRhJ8Kb4nBduZLpmiZVHRQSfiQcBA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-7kfyDOsgKleOcV5Br0lbxqujraF561NK3qTOI_8m4Fx-oxTUhVmWNrMpBA-pgbECFD8&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyDhqaE3mB_f7zh6tntFkPZAPvd9wteqa92Q&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxIFV718HSS5lACC4T8cBi-oHXXt_mNQFbPw&usqp=CAU',
    'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC:q-80/et00301886-jjbpcvcxfc-portrait.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHt3M6IPGfw80QrJu34p6brXr6-u44sph_Iycdoc0jv-bkADikWemAFpvMRpO27h7Fo-4&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: SingleChildScrollView(
        child: GridView.builder(
          itemCount: images1.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 3,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8),
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              child: InkWell(onTap: (){
                Navigator.pushNamed(context, '/blank');
              },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(images1[index]), fit: BoxFit.fill)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
