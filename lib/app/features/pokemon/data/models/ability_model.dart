import 'package:pokedex/app/features/pokemon/domain/entities/ability.dart';

class AbilityModel extends Ability {
  AbilityModel({
    String? name,
    String? url,
  }) : super(name: name, url: url);

  AbilityModel.fromJson(Map<String, dynamic> json) {
    name = json['ability']['name'];
    url = json['ability']['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
