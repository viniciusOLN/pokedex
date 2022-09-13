import 'package:pokedex/app/features/pokemon/domain/entities/ability.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/types.dart';

class TypeModel extends TypePokemon {
  String? name;
  String? url;

  TypeModel({
    this.name,
    this.url,
  }) : super(type: Ability(name: name, description: url));

  TypeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }

  String? get getUrlType {
    return url;
  }

  set setUrlType(String? url) {
    url = url;
  }
}
