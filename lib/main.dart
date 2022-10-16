import 'package:flutter/material.dart';
import 'package:ricky_and_morthy/screens/home.dart';

//method main is the entry point of the app
void main() {
  runApp(const MyApp());
}

//class MyApp is the root widget of the app
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyWidgetState createState() => _MyWidgetState();
}

//class _MyWidgetState is the state of the root widget
class _MyWidgetState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      //home is the first screen of the app
      home:  Home(),
    );
  }
}

