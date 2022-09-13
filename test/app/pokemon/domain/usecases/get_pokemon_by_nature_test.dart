import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/ability.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/stats.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/types.dart';
import 'package:pokedex/app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/app/features/pokemon/domain/usecases/get_pokemon_by_nature.dart';

class MockGetPokemonByNature extends Mock implements PokemonRepository {}

void main() {
  MockGetPokemonByNature repository = MockGetPokemonByNature();
  GetPokemonByNatureUsecase usecase = GetPokemonByNatureUsecase(repository);
  String tNature = "ground";
  Pokemon tPokemon = Pokemon(
    id: 1,
    name: 'Pikachu',
    baseExperience: 20,
    height: 100,
    isDefault: false,
    order: 2,
    weight: 100,
    abilities: [Ability(name: 'voar')],
    stats: [Stats(baseStat: 100, effort: 100, stat: Ability(name: 'aadad'))],
    types: [TypePokemon(slot: 20, type: Ability(name: 'ground'))],
  );

  test('should return a pokemon by his nature from repository', () async {
    when(() => repository.getPokemonByNature(tNature)).thenAnswer(
      (_) async => Right(tPokemon),
    );

    final result = await usecase.getPokemonByNature(tNature);

    expect(result, Right(tPokemon));
    verify(() => repository.getPokemonByNature(tNature));
    verifyNoMoreInteractions(repository);
  });
}
