import 'package:pokedex/app/features/pokemon/domain/entities/ability.dart';
import 'stats.dart';
import 'types.dart';

class Pokemon {
  String name;
  int baseExperience;
  int height;
  bool isDefault;
  int weight;
  List<Ability> abilities;
  List<Stat> stats;
  List<TypePokemon> types;
  String imageUrl;
  bool isFavorite = false;

  Pokemon({
    this.name = '',
    this.baseExperience = 0,
    this.height = 0,
    this.isDefault = false,
    this.weight = 0,
    required this.abilities,
    this.imageUrl = '',
    required this.stats,
    required this.types,
  });
}
