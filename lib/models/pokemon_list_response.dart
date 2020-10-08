import 'dart:convert';

PokemonListResponse pokemonListResponseFromJson(String str) =>
    PokemonListResponse.fromJson(json.decode(str));

String pokemonListResponseToJson(PokemonListResponse data) =>
    json.encode(data.toJson());

class PokemonListResponse {
  PokemonListResponse({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      PokemonListResponse(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  String extractID() {
    if (this.url == null) return '';

    String url = this.url;
    String last = url.substring(url.length - 1, url.length);
    if (last == '/') {
      url = url.substring(0, url.length - 1);
    }
    var splitted = url.split('/');
    return (splitted.last);
  }
}
