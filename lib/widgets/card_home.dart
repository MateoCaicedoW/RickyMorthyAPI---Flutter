import 'package:flutter/material.dart';

class CardHome extends StatefulWidget {
  const CardHome({Key? key}) : super(key: key);

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Stack(
      children: [
        //Created a Container to show the image of the home screen
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
              //This image is from the internet
                'https://i.blogs.es/cfa26e/rickandmortycabecera/1366_2000.jpg'),
            fit: BoxFit.cover,
          )),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.8),
            padding: const EdgeInsets.all(16),
            //Added a Description of the application
            child: const Text(
              'Name: Ricky and Morthy api \n \nAir Date: You can see the characters and episodes\n \nEpisode: Version 1.0',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        )
      ],
    ));
  }
}