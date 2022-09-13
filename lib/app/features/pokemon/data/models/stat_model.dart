import 'package:pokedex/app/features/pokemon/domain/entities/ability.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/stats.dart';

class StatModel extends Stats {
  String? name;
  String? urlStat;

  StatModel({
    this.name,
    this.urlStat,
  }) : super(stat: Ability(name: name, description: urlStat));

  StatModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }

  String? get getUrlStat {
    return urlStat;
  }

  set setUrlStat(String? description) {
    description = description;
  }
}
