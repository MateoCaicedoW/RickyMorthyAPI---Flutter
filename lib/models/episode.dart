
import 'dart:math';

//Class Character is the model of the characters
class Episode {
  //we have all atrributes of the characters
    Episode({
        required this.id,
        required this.name,
        required this.airDate,
        required this.episode,
        required this.url
    });

    //initialization of the attributes
    int id;
    String name;
    String airDate;
    String episode;
    String url;
    
    //we created a list of images becaouse in the api there weren't images from the episodes
    List<String> images = ['https://cdn.mos.cms.futurecdn.net/T7XVEDX27hxmVEV7nVir5K.jpg',
    'https://cdn.mos.cms.futurecdn.net/iPgBzYHZpG54etp7bT2h8J.jpg',
    'https://assets3.thrillist.com/v1/image/1874782/792x435/scale;webp=auto;jpeg_quality=60;progressive.jpg',
    'https://i.gadgets360cdn.com/large/rick-and-morty-season-5-episode-1_1624251363828.jpeg',
    'https://thecinemaholic.com/wp-content/uploads/2021/06/rick-and-morty-season-five-hbo-go-1623227884638.jpeg',
    'https://fr.web.img2.acsta.net/newsv7/20/05/15/10/45/1035449.jpg',
    'https://static1.purebreak.com/articles/5/19/77/25/@/721603-rick-et-morty-saison-5-les-createurs-d-opengraph_1200-2.jpg',
    'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2021/07/rick-morty-5x03-2396073.jpg?itok=1W-_gUIL',
    'https://i.blogs.es/cfa26e/rickandmortycabecera/1366_2000.jpg'];

    //method that converts the json to a character
    factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        url: json["url"],
    );

    //method that converts the character to a json
    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "url": url,
    };
    
    //method that returns a random image
    String returnImage(List<String> list ){
      return list[Random().nextInt(list.length)];
    }
}
