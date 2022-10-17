import 'package:flutter/material.dart';
import 'package:ricky_and_morthy/models/character.dart';
import 'package:ricky_and_morthy/screens/details_characters.dart';

// ignore: must_be_immutable
class CardCharacters extends StatefulWidget {
  // receive the character 
  Character character;
  CardCharacters({Key? key, required this.character}) : super(key: key);

  @override
  State<CardCharacters> createState() => _CardCharactersState();
}

class _CardCharactersState extends State<CardCharacters> {
  //This method is called when the state is created
  @override
  Widget build(BuildContext context) {
      return InkWell(
        onTap: (){
          //we navigate to the screen DetailsCharacters
          Navigator.push(
            context,
            //we pass the character to the screen DetailsCharacters
            MaterialPageRoute(
              builder: (context) => DetailsCharactes(character: widget.character),
            ),
          );

        },
        //we show the image of the character
        child: Card(
          child: Stack(
            //we use the Stack widget to show the image and the name of the character
            children: [
              Image.network(widget.character.image, width: double.infinity, fit: BoxFit.fill,),
              //we show the name of the character
              //we use the Align widget to align the text to the bottom
              //we use the Container widget to show the background of the text
              //we use the Text widget to show the name of the character
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.8),
                  padding: const EdgeInsets.all(10),
                  child: Text(widget.character.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15 ,
                    overflow: TextOverflow.fade,
                  ),),
                ),
              ),
             
            ],
          ),
        
        ),
      );
  }
}