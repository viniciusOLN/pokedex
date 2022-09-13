import 'package:pokedex/app/features/pokemon/data/models/stat_model.dart';
import '../../domain/entities/pokemon.dart';
import 'ability_model.dart';
import 'type_model.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    int? id,
    String? name,
    int? baseExperience,
    int? height,
    bool? isDefault,
    int? weight,
    String? urlImage,
    List<AbilityModel>? abilities,
    List<StatModel>? stats,
    List<TypeModel>? types,
  }) : super(
          id: id,
          name: name,
          baseExperience: baseExperience,
          height: height,
          isDefault: isDefault,
          weight: weight,
          abilities: abilities,
          stats: stats,
          types: types,
        );

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['forms'][0]['name'] ?? 'Não informado';
    baseExperience = json['base_experience'] ?? 0;
    height = json['height'] ?? 0;
    isDefault = json['is_default'] ?? false;
    weight = json['weight'] ?? 0;
    urlImage = json['sprites']['back_default'] ?? 'default';
    if (json['abilities'] != null) {
      abilities = <AbilityModel>[];
      json['abilities'].forEach((v) {
        abilities!.add(AbilityModel.fromJson(v));
      });
    }
    if (json['stats'] != null) {
      stats = <StatModel>[];
      json['stats'].forEach((v) {
        stats!.add(StatModel.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <TypeModel>[];
      json['types'].forEach((v) {
        types!.add(TypeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['base_experience'] = baseExperience;
    data['height'] = height;
    data['is_default'] = isDefault;
    data['weight'] = weight;
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) {
        return AbilityModel(name: v.name, description: v.description).toJson();
      }).toList();
    }
    data['urlImage'] = urlImage;
    if (stats != null) {
      data['stats'] = stats!.map((v) {
        return StatModel(name: v.stat!.name, urlStat: v.stat!.description)
            .toJson();
      }).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) {
        return TypeModel(name: v.type!.name, url: v.type?.description).toJson();
      }).toList();
    }
    return data;
  }
}
