class PokemonThumbnail {
  int id = 0;
  String name = '';
  String url = '';
  String get imageUrl {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  PokemonThumbnail({required this.id, required this.name, required this.url});
}
