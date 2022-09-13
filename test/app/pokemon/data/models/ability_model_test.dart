import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/features/pokemon/data/models/ability_model.dart';

void main() {
  Ability tAbility = Ability();
  test('should get a instance of ability class', () {
    expect(tAbility, isA<Ability>());
  });

  test('should get a json from ability instance', () {
    tAbility.name = "Vinicius";
    tAbility.description = "teste";

    Map<String, dynamic> tResult = tAbility.toJson();

    expect(tResult, isA<Map>());
  });

  test('should get a instance with values from json', () {
    Map<String, dynamic> tJson = {"name": 'Pikachu', 'description': 'aaaa'};

    Ability tResult = Ability.fromJson(tJson);

    expect(tResult, isA<Ability>());
  });
}
