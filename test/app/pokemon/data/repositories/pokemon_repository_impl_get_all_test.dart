import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/cores/error/exceptions.dart';
import 'package:pokedex/app/cores/error/failures.dart';
import 'package:pokedex/app/features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex/app/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokedex/app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import '../../../fixture/fixture.dart';

class MockDatasource extends Mock implements PokemonRemoteDataSourceImpl {}

void main() {
  const pokemonName = 'pikachu';
  final datasource = MockDatasource();
  const tPaginationStarts = 1;
  int tPokemonId = 1;
  const tPaginationEnds = 21;
  final json = jsonDecode(fixture('teste_thumb.json'));
  PokemonModel tPokemonModel = PokemonModel(
    abilities: [],
    stats: [],
    types: [],
  );
  List<PokemonModel> tListPokemonModel = [];

  final respository = PokemonRepositoryImpl(
    remoteDataSource: datasource,
  );

  void testFailure({
    required String describe,
    required Failure failure,
    required Exception exception,
    required String pokemon,
  }) {
    test(describe, () async {
      Failure? failureToTest;

      when(() => datasource.getPokemonByName(pokemon)).thenThrow(
        exception,
      );

      final result = await respository.getPokemonByName('pikachu');
      result.fold((failureA) => failureToTest = failureA, (pokemon) => null);

      verify(() => datasource.getPokemonByName(pokemon));
      expect(failureToTest, equals(failure));
    });
  }

  void testFailureMessage({
    required String describe,
    required Failure failure,
    required Exception exception,
    required String pokemon,
    required String messageFailure,
  }) {
    test(describe, () async {
      Failure? failureToTest;

      when(() => datasource.getAllPokemons(any())).thenThrow(
        exception,
      );

      final result =
          await respository.getAllPokemons(tPaginationStarts, tPaginationEnds);
      result.fold((failureA) => failureToTest = failureA, (pokemon) => null);

      verify(() => datasource.getAllPokemons(tPokemonId));
      expect(failureToTest!.message, equals(messageFailure));
    });
  }

  group('data |', () {
    test('should get a list of PokemonThumbnail from api', () async {
      when(() => datasource.getAllPokemons(any())).thenAnswer(
        (_) async => tPokemonModel,
      );

      final result =
          await respository.getAllPokemons(tPaginationStarts, tPaginationEnds);

      late List<PokemonModel> response;
      result.fold((f) => null, (r) => response = r);

      expect(response, isA<List<PokemonModel>>());
    });
  });

  group('failures |', () {
    testFailure(
      describe: 'should return a NotFound Failure',
      failure: NotFoundFailure(),
      exception: NotFoundException(),
      pokemon: pokemonName,
    );

    testFailure(
      describe: 'should return a TimeOut Failure',
      failure: TimeOutFailure(),
      exception: TimeOutException(),
      pokemon: pokemonName,
    );

    testFailure(
      describe: 'should return a Server Failure',
      failure: ServerFailure(),
      exception: ServerException(),
      pokemon: pokemonName,
    );

    testFailure(
      describe: 'should return a Other Failure',
      failure: OtherFailure(),
      exception: OtherError(),
      pokemon: pokemonName,
    );
  });

  group('failures messages |', () {
    testFailureMessage(
      describe: 'should return a not found failure message',
      failure: NotFoundFailure(),
      exception: NotFoundException(),
      pokemon: pokemonName,
      messageFailure: 'Pokemons não encontrados.',
    );

    testFailureMessage(
      describe: 'should return a timeOut failure message',
      failure: TimeOutFailure(),
      exception: TimeOutException(),
      pokemon: pokemonName,
      messageFailure: 'Tempo limite de resposta do servidor esgotado.',
    );

    testFailureMessage(
      describe: 'should return a server failure message',
      failure: ServerFailure(),
      exception: ServerException(),
      pokemon: pokemonName,
      messageFailure: 'Erro ao tentar acessar o servidor.',
    );

    testFailureMessage(
      describe: 'should return a other failure message',
      failure: OtherFailure(),
      exception: OtherError(),
      pokemon: pokemonName,
      messageFailure: 'Erro! Por favor, tente novamente.',
    );
  });
}
