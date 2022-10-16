import 'package:flutter/material.dart';
import 'package:ricky_and_morthy/models/character.dart' as character;
import 'package:ricky_and_morthy/widgets/card_characters.dart';
//Class ListCharacters is the widget that contains the list of characters
List<Widget> listCharacters(List<character.Character> data){
  //we create a list of widgets
  List<Widget> characters = [];
  for(var item in data){
    //we add the widget CardCharacter to the list
    characters.add(
      //we pass the character to the widget
       CardCharacters(character: item)
    );
  }
  return characters;
}