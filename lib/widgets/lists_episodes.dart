import 'package:flutter/material.dart';
import 'package:ricky_and_morthy/models/episodes.dart' as episodes;
import 'package:ricky_and_morthy/widgets/card_episode.dart';
//Created a method to return a list of widgets
List<Widget> listEpisodes(List<episodes.Episodes> data){
  //we create a list of widgets
  List<Widget> episodes = [];
  for(var item in data){
    //we add the widget CardEpisode to the list
    episodes.add(
      //we pass the episode to the widget
        CardEpisode(episode: item)

    );
  }
  return episodes;
}