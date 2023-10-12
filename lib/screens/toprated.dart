import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopRated extends StatefulWidget {
  const TopRated({super.key});

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {

  List image3=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTETd4x8EckrVgCD_QGb3Wi5dQwIQ90CVWdF3rbuw4-5T78UFqt5BwGNBWT4sAgwegdEho&usqp=CAU',
  'https://www.mumbailive.com/images/media/images/bollywood_1674817732983.jpg?fm=webp&w=700',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRGR6rleEjKhhrD2jQyL6WjQ6eJPHMKv6EFvvenAFvr0AEsctVTpXsHayPxc2KUyVPiKc&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO0demobYh7PXqvXyJuBrIVPwJn7k5kK-XgA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI99EZMfIUS2eA_rncsfZWPJyxlv57lOjKaA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrV9LA-hoUBrALMv8I2TqwEUhknr6e4SA6KUJmjVeGVIk7Jo5c1NfjBXvHYcqMKO27z_Y&usqp=CAU'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xff242A32),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 3,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8),
          itemCount: image3.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: NetworkImage(image3[index]),fit: BoxFit.fill)),
            );
          },
        )
    );
  }
}
