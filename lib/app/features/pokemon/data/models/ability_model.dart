import 'package:pokedex/app/features/pokemon/domain/entities/ability.dart';

class AbilityModel extends Ability {
  AbilityModel({
    String? name,
    String? description,
  }) : super(name: name);

  AbilityModel.fromJson(Map<String, dynamic> json) {
    name = json['ability']['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }

  String? get getDescription {
    return description;
  }

  set setDescription(String? description) {
    description = description;
  }
}
