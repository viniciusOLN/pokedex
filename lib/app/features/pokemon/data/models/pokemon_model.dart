import 'package:pokedex/app/features/pokemon/data/models/stat_model.dart';
import '../../domain/entities/pokemon.dart';
import 'ability_model.dart';
import 'type_model.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    String name = '',
    int baseExperience = 0,
    int height = 0,
    bool isDefault = false,
    int weight = 0,
    String imageUrl = '',
    required List<AbilityModel> abilities,
    required List<StatModel> stats,
    required List<TypeModel> types,
  }) : super(
          name: name,
          baseExperience: baseExperience,
          height: height,
          isDefault: isDefault,
          weight: weight,
          abilities: abilities,
          imageUrl: imageUrl,
          stats: stats,
          types: types,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    List<AbilityModel> abilities = [];
    List<StatModel> stats = [];
    List<TypeModel> types = [];
    if (json['abilities'] != null) {
      json['abilities'].forEach((v) {
        abilities.add(AbilityModel.fromJson(v));
      });
    }
    if (json['stats'] != null) {
      json['stats'].forEach((v) {
        stats.add(StatModel.fromJson(v));
      });
    }
    if (json['types'] != null) {
      json['types'].forEach((v) {
        types.add(TypeModel.fromJson(v));
      });
    }
    return PokemonModel(
      name: json['forms'][0]['name'] ?? 'Não informado',
      baseExperience: json['base_experience'] ?? 0,
      height: json['height'] ?? 0,
      isDefault: json['is_default'] ?? false,
      weight: json['weight'] ?? 0,
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      abilities: abilities,
      stats: stats,
      types: types,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['base_experience'] = baseExperience;
    data['height'] = height;
    data['is_default'] = isDefault;
    data['weight'] = weight;
    data['abilities'] = abilities.map((v) {
      return AbilityModel(name: v.name, url: v.url).toJson();
    }).toList();
    data['urlImage'] = imageUrl;
    data['stats'] = stats.map((v) {
      return StatModel(
        baseStat: v.baseStat,
        effort: v.effort,
        name: v.name,
        url: v.url,
      ).toJson();
    }).toList();
    data['types'] = types.map((v) {
      return TypeModel(name: v.name, url: v.url).toJson();
    }).toList();
    return data;
  }
}
