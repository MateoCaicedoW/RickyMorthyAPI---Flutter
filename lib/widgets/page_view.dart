import 'package:flutter/material.dart';
import 'package:ricky_and_morthy/models/character.dart';
import 'package:ricky_and_morthy/provider/fetch_api.dart';
import 'package:ricky_and_morthy/widgets/lists_characters.dart';

class PageViewCharacter extends StatefulWidget {
  const PageViewCharacter({super.key});

  @override
  State<PageViewCharacter> createState() => _PageViewCharacterState();
}

class _PageViewCharacterState extends State<PageViewCharacter> {
  late Future<List<Character>> _characters;
  late PageController _scrollController;
  

  @override
  void initState() {
    super.initState();
    _characters = Fetch.getCharacters();
    _scrollController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    //we use the FutureBuilder to get the characters
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 160,
      //we use the PageView.builder to show the characters
      child: FutureBuilder<List<Character>>(
          future: _characters,
          builder: (context, snapshot) {
            //we check if the data is null
            if (snapshot.hasData) {
              //called the listCharacters method to get the list of characters
               final list =listCharacters(snapshot.data as List<Character>);
              return PageView.builder(
                //we use the controller to control the scroll
                itemCount: snapshot.data!.length,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  //we show the character
                  return list[index] ;
                },
                
              );
            } else {
              //if the data is null we show a CircularProgressIndicator
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  
}