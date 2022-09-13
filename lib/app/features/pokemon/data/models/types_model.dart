import 'package:pokedex/app/features/pokemon/data/models/type_model.dart';

import 'ability_model.dart';

class TypePokemon {
  int? slot;
  TypeModel? type;

  TypePokemon({this.slot, this.type});

  TypePokemon.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? TypeModel.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}
