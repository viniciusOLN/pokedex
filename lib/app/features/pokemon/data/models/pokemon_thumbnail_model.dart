import 'package:pokedex/app/features/pokemon/domain/entities/pokemon_thumbnail.dart';

/*
links: https://github.com/Kilo-Loco/30DaysOfFlutter/blob/main/day16_pokedex_app/lib/pokemon_repository.dart
https://github.com/Kilo-Loco/30DaysOfFlutter/blob/main/day16_pokedex_app/lib/pokemon_page_response.dart
https://github.com/RenatoLucasMota/PokedexFlutterYoutube
https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png
https://pokeapi.co/api/v2/pokemon/
 */

class PokemonThumbnailModel extends PokemonThumbnail {
  // static int idPokemon = 0;
  PokemonThumbnailModel({
    required int id,
    required String name,
    required String url,
  }) : super(id: id, name: name, url: url);

  factory PokemonThumbnailModel.fromJson(Map json) {
    return PokemonThumbnailModel(
      id: int.parse(json['url'].split('/')[6]),
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
