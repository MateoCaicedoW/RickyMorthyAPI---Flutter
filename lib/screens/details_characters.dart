

import 'package:flutter/material.dart';
import 'package:ricky_and_morthy/models/characters.dart';
import 'package:ricky_and_morthy/models/episodes.dart';
import 'package:ricky_and_morthy/provider/fetch_api.dart';
import 'package:ricky_and_morthy/widgets/lists_episodes.dart';

// ignore: must_be_immutable
class DetailsCharactes extends StatefulWidget {
  //we receive the character from the widget CardCharacters
  Character character;
  DetailsCharactes({Key? key, required this.character}) : super(key: key);

  @override
  State<DetailsCharactes> createState() => _DetailsCharactesState();
}

class _DetailsCharactesState extends State<DetailsCharactes> {

  //we create a list of episodes
  //we use the FutureBuilder to get the episodes 
  //We initialized the params needed
  late Future<List<Episodes>> _episodes;
  final _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _episodes = Fetch.getEpisodes(widget.character.episode);
   
  }

  //This method is called when the state is destroyed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            widget.character.name,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                //we show the image of the character
                //we use widget.character to get the character from the widget CardCharacters
                Image.network(widget.character.image,
                    width: double.infinity, fit: BoxFit.contain),
                const Padding(padding: EdgeInsets.all(10)),
                //we show the name, status and gender of the character
                Text(
                  ' ${widget.character.status} - ${widget.character.species} - ${widget.character.gender}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                //we show the origin of the character
                Text(
                  widget.character.location.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                //we show the episodes of the character
                const Text(
                  "Episodes",
                  style:  TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                //we use the FutureBuilder to get the episodes
                //we use the widget ListsEpisodes to show the episodes
                //we use the widget character to get the character from the widget CardCharacters
                FutureBuilder(
                  future: _episodes,
                  builder: (context, AsyncSnapshot snapshot) {
                  //we check if the snapshot has data
                  if (snapshot.hasData) {
                    //we return the widget ListsEpisodes
                    final list = listEpisodes(snapshot.data as List<Episodes>);
                    return ListView(
                      //we use the controller to scroll the list
                      controller: _controller,  
                      shrinkWrap: true,
                      //we use the widget ListsEpisodes to show the episodes
                      children: List.generate(snapshot.data!.length, (index) {
                        return list[index];
                      }),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
              ],
            )
          ],
        ));
  }
}
