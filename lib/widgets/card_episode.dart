
import 'package:flutter/material.dart';
import 'package:ricky_and_morthy/models/episodes.dart';

class CardEpisode extends StatefulWidget {
  //Receive the episode
  final Episodes episode;
   const CardEpisode({Key? key, required this.episode}) : super(key: key);

  @override
  State<CardEpisode> createState() => _CardEpisodeState();
}

class _CardEpisodeState extends State<CardEpisode> {

  //This method is called when the state is created
  @override
  Widget build(BuildContext context) {
    return Card(
      //we show the image of the episode
      //we use widget.episode to get the episode from the widget CardEpisode
        child: Stack(
          children: [
            Image.network(widget.episode.returnImage(widget.episode.images)),
            //we show the name of the episode
            //we use the Align widget to align the text to the bottom
            //we use the Container widget to show the background of the text
            //we use the Text widget to show the name of the episode
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(10),
                child: Text('Name: ${widget.episode.name} \nAir Date: ${widget.episode.airDate} \nEpisode: ${widget.episode.episode}',
                 
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                ),),
              ),
            ),
           
          ],
        ),
      );
  }
}