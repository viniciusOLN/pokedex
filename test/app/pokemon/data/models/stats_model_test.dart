import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/features/pokemon/data/models/ability_model.dart';
import 'package:pokedex/app/features/pokemon/data/models/stats_model.dart';

void main() {
  Stats tStat = Stats();
  test('should get a instance from stats class', () {
    expect(tStat, isA<Stats>());
  });

  test('should get a json from a stats class', () {
    tStat.baseStat = 0;
    tStat.effort = 0;
    tStat.stat = Ability(name: 'adadad');

    Map<String, dynamic> tJson = tStat.toJson();

    expect(tJson, isA<Map<String, dynamic>>());
  });

  test('should get a instance from a json', () {
    Map<String, dynamic> tJson = {
      'baseStat': 0,
      'effort': 0,
      'stat': {
        'name': 'aaaaa',
      }
    };

    Stats tResult = Stats.fromJson(tJson);

    expect(tResult, isA<Stats>());
  });
}
