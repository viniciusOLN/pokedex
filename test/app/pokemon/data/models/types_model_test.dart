import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/features/pokemon/data/models/type_model.dart';
import 'package:pokedex/app/features/pokemon/data/models/types_model.dart';

void main() {
  TypePokemon tType = TypePokemon();
  test('should get a instance of type class', () {
    expect(tType, isA<TypePokemon>());
  });

  test('should get a json from type class', () {
    tType.slot = 1;
    tType.type = TypeModel(name: 'adadada');

    Map<String, dynamic> tJson = tType.toJson();

    expect(tJson, isA<Map<String, dynamic>>());
  });

  test('should get a instance of type class from json', () {
    Map<String, dynamic> tJson = {
      'slot': 1,
      'types': {
        'type': {
          'name': 'eletric',
          'url': 'url',
        }
      }
    };

    TypePokemon tResult = TypePokemon.fromJson(tJson);

    expect(tResult, isA<TypePokemon>());
  });
}
