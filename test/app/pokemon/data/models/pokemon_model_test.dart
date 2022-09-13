import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/features/pokemon/data/models/ability_model.dart';
import 'package:pokedex/app/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokedex/app/features/pokemon/data/models/stats_model.dart';
import 'package:pokedex/app/features/pokemon/data/models/types_model.dart';

void main() {
  Pokemon tPokemon = Pokemon();
  test('should get a instance of pokemon class', () {
    expect(tPokemon, isA<Pokemon>());
  });

  test('should get a json from a pokemon class', () {
    Ability a = Ability(name: 'asdad');
    tPokemon.id = 1;
    tPokemon.name = 'pikachu';
    tPokemon.height = 10;
    tPokemon.baseExperience = 1;
    tPokemon.isDefault = false;
    tPokemon.urlImage = 'adadaddada';
    tPokemon.stats = [Stats(baseStat: 0, effort: 0)];
    tPokemon.abilities = [a];
    tPokemon.weight = 20;
    tPokemon.types = [
      TypePokemon(
        slot: 1,
      )
    ];

    Map<String, dynamic> tJson = tPokemon.toJson();

    expect(tJson, isA<Map<String, dynamic>>());
  });

  test('should get a instance from json', () {
    Map<String, dynamic> tJson = {
      'id': 1,
      'name': 'Vinicius',
      'base_experience': 1,
      'height': 12,
      'isDefault': false,
      'order': 1,
      'weight': 1,
      'sprites': {
        'back_default': 'aaa',
      },
      'abilities': [
        {
          'name': 'aaa',
        }
      ],
      'stats': [
        {
          'baseStat': 1,
          'effort': 2,
          'stat': {
            'name': 'aaaa',
          }
        }
      ],
      'types': [
        {
          'slot': 1,
          'type': {
            'name': 'aaaa',
          }
        },
      ],
    };

    Pokemon tResult = Pokemon.fromJson(tJson);

    expect(tResult, isA<Pokemon>());
  });
}
