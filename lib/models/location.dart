class Location {
  //we have all atrributes of the locations
    Location({
        required this.name,
        required this.url,
    });
  //initialization of the attributes
    String name;
    String url;
  //method that converts the json to a location
    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
    );
    //method that converts the location to a json
    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
