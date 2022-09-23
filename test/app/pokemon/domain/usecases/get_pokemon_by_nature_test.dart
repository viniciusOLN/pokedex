import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/features/pokemon/data/models/stat_model.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/ability.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/types.dart';
import 'package:pokedex/app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/app/features/pokemon/domain/usecases/get_pokemon_by_nature.dart';

class MockGetPokemonByNature extends Mock implements PokemonRepository {}

void main() {
  MockGetPokemonByNature repository = MockGetPokemonByNature();
  GetPokemonByNatureUsecase usecase = GetPokemonByNatureUsecase(repository);
  String tNature = "ground";
  Pokemon tPokemon = Pokemon(
    name: 'Pikachu',
    baseExperience: 20,
    height: 100,
    isDefault: false,
    weight: 100,
    abilities: [Ability(name: 'voar')],
    stats: [StatModel(baseStat: 100, effort: 100, name: 'name', url: 'url')],
    types: [TypePokemon(name: 'name', url: 'url')],
  );

  List<Pokemon> tPokemons = [];
  List<String> pokemonNames = [];

  test('should return a pokemon by his nature from repository', () async {
    when(() => repository.getPokemonByNature(any(), any())).thenAnswer(
      (_) async => Right(tPokemons),
    );

    final result = await usecase.getPokemonByNature(pokemonNames, 1);

    expect(result, Right(tPokemons));
    verify(() => repository.getPokemonByNature(pokemonNames, 1));
    verifyNoMoreInteractions(repository);
  });
}
