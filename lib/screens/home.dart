import 'package:flutter/material.dart';
import 'package:ricky_and_morthy/widgets/card_home.dart';
import 'package:ricky_and_morthy/widgets/drawer.dart';
import 'package:ricky_and_morthy/widgets/page_view.dart';

//Class Home is the first screen of the app
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
//Class _HomeState is the state of the first screen of the app
class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: const MyDrawer(),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
         //expanded is used to occupy the entire space of the parent widget
          const Expanded(flex: 4, child: CardHome(),),
          //Adding padding to the widget
          const Padding(padding:  EdgeInsets.all(10)),
          //Adding Some characters like description
          const  Expanded(flex: 1, child: Text("Some characters", 
          style: TextStyle(
            color: Colors.greenAccent,
            fontSize: 30,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 20.0,
                color: Colors.greenAccent,
                offset: Offset(0, 6),
              ),
            ],
           
            ),
           ),),
           // show the list of characters
          const Expanded(flex: 7, child: PageViewCharacter(),),
        ],

      )
    );
  }
}
