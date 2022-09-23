import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/features/pokemon/data/models/ability_model.dart';

void main() {
  AbilityModel tAbility = AbilityModel();
  test('should get a instance of ability class', () {
    expect(tAbility, isA<AbilityModel>());
  });

  test('should get a json from ability instance', () {
    tAbility.name = "Vinicius";
    tAbility.url = "teste";

    Map<String, dynamic> tResult = tAbility.toJson();

    expect(tResult, isA<Map>());
  });

  test('should get a instance with values from json', () {
    Map<String, dynamic> tJson = {
      'ability': {
        "name": 'Pikachu',
        'url': 'aaaa',
      }
    };

    AbilityModel tResult = AbilityModel.fromJson(tJson);

    expect(tResult, isA<AbilityModel>());
  });
}
