import 'package:flutter/material.dart';
import 'package:ricky_and_morthy/provider/fetch_api.dart';
import 'package:ricky_and_morthy/models/characters.dart';
import 'package:ricky_and_morthy/widgets/lists_characters.dart';

class Characters extends StatefulWidget {
  const Characters({Key? key}) : super(key: key);

  @override
  State<Characters> createState() => _CharactersState();
}

class _CharactersState extends State<Characters> {
  //Initialized the needed variables
  late Future<List<Character>> _characters;
  final _controller = ScrollController();
  int pagination = 2;

  void _loadCharacters() async {
    // if the pagination is more than 41, then stop loading more characters
    if (pagination > 41) {
      // Stop the listener
      _controller.dispose();
      return;
    }

    // Fetch the next page of characters
    final page = await Fetch.getCharacters(page: pagination);

    // Add the new characters to the list and increment the pagination
    setState(() {
      pagination++;
      _characters = _characters.then((characters) {
        return [...characters, ...page];
      });
    });
  }
  
  //This method is called when the state is created
  //It is used to initialize the variables
  //It is called only once
  //It is called before the build method
  @override
  void initState() {
    super.initState();
    _characters = Fetch.getCharacters();
    _controller.addListener(() {
       if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadCharacters();
        const snackBar = SnackBar(content: Text('Fetching...'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  //This method is called when the state is destroyed

  @override
  Widget build(BuildContext context) {
    // Return a Scaffold widget that contains a future builder widget that will build the list of characters
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Characteres',
        style: TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),),
      ),

      // Return a FutureBuilder widget that will build the list of characters  
      body: FutureBuilder(
        //Async snapshot that will contain the list of characters

      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to horizontal, this produces 2 rows.
            controller: _controller,
            crossAxisCount: 2,
            //we called the list of characters
            children: listCharacters(snapshot.data),
          );
         
        } else {
          // if there is no data, then return a circular progress indicator
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: _characters)
    );
  }
}
