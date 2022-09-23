import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/features/pokemon/data/models/ability_model.dart';
import 'package:pokedex/app/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokedex/app/features/pokemon/data/models/type_model.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/stats.dart';

void main() {
  PokemonModel tPokemon = PokemonModel(
    abilities: [],
    types: [],
    stats: [],
  );
  test('should get a instance of pokemon class', () {
    expect(tPokemon, isA<PokemonModel>());
  });

  test('should get a json from a pokemon class', () {
    tPokemon.abilities = [AbilityModel(name: 'oi', url: 'ada')];
    tPokemon.baseExperience = 20;
    tPokemon.height = 20;
    tPokemon.isDefault = false;
    tPokemon.name = 'aaaa';
    tPokemon.stats = [
      Stat(baseStat: 20, effort: 20, name: 'static', url: 'addaa')
    ];
    tPokemon.imageUrl = 'adadada';
    tPokemon.weight = 20;
    tPokemon.types = [TypeModel(name: 'sa', url: 'adada')];

    Map<String, dynamic> tJson = tPokemon.toJson();

    expect(tJson, isA<Map<String, dynamic>>());
  });

  test('should get a instance from json', () {
    Map<String, dynamic> tJson = {
      'id': 1,
      'forms': [
        {'name': 'pikachu'},
      ],
      'base_experience': 1,
      'height': 12,
      'isDefault': false,
      'weight': 1,
      'sprites': {
        'other': {
          'official-artwork': {'front_default': 'aaaa'}
        }
      },
      'abilities': [
        {
          'ability': {
            'name': 'static',
            'url': 'aaaa',
          }
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
          'type': {
            'name': 'aaaa',
            'url': 'url',
          }
        },
      ],
    };

    PokemonModel tResult = PokemonModel.fromJson(tJson);

    expect(tResult, isA<PokemonModel>());
  });
}
