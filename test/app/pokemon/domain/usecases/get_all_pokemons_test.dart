import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/ability.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/stats.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/types.dart';
import 'package:pokedex/app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/app/features/pokemon/domain/usecases/get_all_pokemons.dart';

class MockGetAllPokemonsRepository extends Mock implements PokemonRepository {}

void main() {
  MockGetAllPokemonsRepository repository = MockGetAllPokemonsRepository();
  GetAllPokemonsUsecase usecase = GetAllPokemonsUsecase(repository);
  List<Pokemon> tPokemon = [
    Pokemon(
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
    ),
  ];

  test('should get a pokemon from the repository', () async {
    when(() => repository.getAllPokemons()).thenAnswer(
      (_) async => Right(tPokemon),
    );

    final result = await usecase.getAllPokemons();
    expect(result, Right(tPokemon));
    verify(() => repository.getAllPokemons());
    verifyNoMoreInteractions(repository);
  });
}
