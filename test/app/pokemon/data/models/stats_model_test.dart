import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/features/pokemon/data/models/stat_model.dart';

void main() {
  StatModel tStat = StatModel();
  test('should get a instance from stats class', () {
    expect(tStat, isA<StatModel>());
  });

  test('should get a json from a stats class', () {
    tStat.baseStat = 0;
    tStat.effort = 0;
    tStat.name = 'static';
    tStat.url = 'url';

    Map<String, dynamic> tJson = tStat.toJson();

    expect(tJson, isA<Map<String, dynamic>>());
  });

  test('should get a instance from a json', () {
    Map<String, dynamic> tJson = {
      'baseStat': 0,
      'effort': 0,
      'stat': {
        'name': 'aaaaa',
        'url': 'url',
      }
    };

    StatModel tResult = StatModel.fromJson(tJson);

    expect(tResult, isA<StatModel>());
  });
}
