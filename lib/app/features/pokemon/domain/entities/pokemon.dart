import 'package:pokedex/app/features/pokemon/domain/entities/ability.dart';
import 'stats.dart';
import 'types.dart';

class Pokemon {
  int? id;
  String? name;
  int? baseExperience;
  int? height;
  bool? isDefault;
  int? order;
  int? weight;
  List<Ability>? abilities;
  String? urlImage;
  List<Stats>? stats;
  List<TypePokemon>? types;

  Pokemon({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
    this.stats,
    this.types,
  });
}
