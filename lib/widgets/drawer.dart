import 'package:flutter/material.dart';
import 'package:ricky_and_morthy/screens/characters.dart' as character;

class MyDrawer extends StatelessWidget {
const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    //Created a drawer widget that contains a list of items
    return Drawer(
      //we use the ListView widget to show the list of items
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  //we show the image of the drawer
                  image: AssetImage("assets/header.jpg"),
                     fit: BoxFit.cover)
              ),
              child: Text(
                //we show the name of the application
                'Ricky and Morthy Api',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            //we show the item Characters
            ListTile(
              //we show the icon of the item
              leading: const Icon(Icons.account_circle),
              //we show the name of the item
              title: const Text('Characters'),
              onTap: () {
                //we navigate to the screen Characters
                Navigator.of(context).pop();
                //we navigate to the screen Characters
                Navigator.of(context).push(
                  //we use the MaterialPageRoute widget to navigate to the screen Characters
                  MaterialPageRoute(builder:(BuildContext context) => const character.Characters() )
                );
                 // close the drawer
              },
            ),
            
          ],
        ),
      );
  }
}