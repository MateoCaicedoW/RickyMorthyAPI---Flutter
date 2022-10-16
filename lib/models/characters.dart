import 'dart:convert';
import 'package:ricky_and_morthy/models/location.dart';

//Class Character is the model of the characters
class Character {
  //we have all atrributes of the characters
    Character({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.location,
        required this.image,
        required this.episode,
    });
    //initialization of the attributes
    int id;
    String name;
    String status;
    String species;
    String type;
    String gender;
    Location location;
    String image;
    List<String> episode;

    //method that converts the json to a character
    factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        location: Location.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x.split('/').last)),
      
    );

    //method that converts the character to a json
    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "location": location.toJson(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
    };
}

