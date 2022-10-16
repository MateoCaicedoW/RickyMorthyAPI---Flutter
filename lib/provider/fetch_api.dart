
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ricky_and_morthy/models/character.dart';
import 'package:ricky_and_morthy/models/episode.dart';

/// Service to fetch data from the Rick and Morty API
///
/// https://rickandmortyapi.com/
class Fetch {
  /// Base URL for the Rick and Morty API
  static const String _baseUrl = 'rickandmortyapi.com';

  /// Fetches a list of all characters
  /// We have to use Future because the data is not available immediately
  /// We have to use async because we are using await
  /// We have an optional parameter [page] to fetch a specific page of characters
  
  static Future<List<Character>> getCharacters({int page = 1}) async {
    // Create the URL
    final response = await fetcher('/character', page: page.toString());
    // Decode the JSON
    var results = response['results'];
    // Map the results to a list of characters
    List<Character> characters = results.map<Character>((character) {
      return Character.fromJson(character);
    }).toList();
    // Return the list of characters
    return characters;
  }

  /// Fetches a list of all episodes
  /// We have to use Future because the data is not available immediately
  /// We have to use async because we are using await
  /// we have a parameter [list] to fetch a specific list of episodes
  static Future<List<Episode>> getEpisodes(List<String> list) async {
    
    // Create the URL
    final response = await fetcher('/episode/$list');
    // Decode the JSON
    List<Episode> episodes = response.map<Episode>((episode) {
      return Episode.fromJson(episode);
    }).toList();

    // Return the list of episodes
    return episodes;
    
  }

  /// Method to fetch data from the Rick and Morty API
  /// We have to use Future because the data is not available immediately
  /// We have to use async because we are using await
  /// We have an optional parameter [page] to fetch a specific page 
  /// 
  static Future fetcher(String endpoint, { String page = '1'}) async {
    // Create the URL
    // We use Uri to create the URL
    // Uri is a class that represents a Uniform Resource Identifier (URI)
    // https://api.dart.dev/stable/2.10.4/dart-core/Uri-class.html

    final url = Uri.https(_baseUrl, '/api/$endpoint', {'page': page});
    // Fetch the data from the API
    // We use http.get to fetch the data
    final res = await http.get(url);
    
    //if the response is not ok, we throw an error
    if (res.statusCode != 200) {
      throw Exception("Failed to load data");
    } 
    // Decode the JSON
    // We use jsonDecode to decode the JSON
    // https://api.dart.dev/stable/2.10.4/dart-convert/jsonDecode.html
    // Return the decoded JSON
    String body = utf8.decode(res.bodyBytes);
    final results = jsonDecode(body);
    return results;
  }
}