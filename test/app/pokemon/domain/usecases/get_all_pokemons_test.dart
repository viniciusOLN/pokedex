import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokedex/app/features/pokemon/data/models/pokemon_thumbnail_model.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/pokemon_thumbnail.dart';
import 'package:pokedex/app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/app/features/pokemon/domain/usecases/get_all_pokemons.dart';

import '../../../fixture/fixture.dart';

class MockGetAllPokemonsRepository extends Mock implements PokemonRepository {}

void main() {
  MockGetAllPokemonsRepository repository = MockGetAllPokemonsRepository();
  GetAllPokemonsUsecase usecase = GetAllPokemonsUsecase(repository);
  const tPagination = 20;
  const tPaginationStarts = 1;
  const tPaginationEnds = 21;
  final json = jsonDecode(fixture('teste_thumb.json'));
  List<PokemonModel> tListPokemonThumbnailModel = [];
  List<PokemonModel> tListPokemonThumbnail = tListPokemonThumbnailModel;

  test('should get a list of PokemonsThumbnail from the repository', () async {
    when(() => repository.getAllPokemons(any(), any())).thenAnswer(
      (_) async => Right(tListPokemonThumbnailModel),
    );

    final result = await usecase.getAllPokemons(
      tPaginationStarts,
      tPaginationEnds,
    );

    expect(result, Right(tListPokemonThumbnail));
    verify(() => repository.getAllPokemons(tPaginationStarts, tPaginationEnds));
    verifyNoMoreInteractions(repository);
  });
}
