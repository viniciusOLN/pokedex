import 'package:pokedex/app/features/pokemon/domain/entities/stats.dart';

class StatModel extends Stat {
  StatModel({
    int baseStat = 0,
    int effort = 0,
    String name = '',
    String url = '',
  }) : super(baseStat: baseStat, effort: effort, name: name, url: url);

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      baseStat: json['base_stat'] ?? 0,
      effort: json['effort'] ?? 0,
      name: json['stat']['name'] ?? '',
      url: json['stat']['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'base_stat': baseStat,
      'effort': effort,
      'stat': {
        'name': name,
        'url': url,
      }
    };
    return data;
  }
}
