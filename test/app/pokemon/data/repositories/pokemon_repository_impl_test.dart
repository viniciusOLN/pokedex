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
  final respository = PokemonRepositoryImpl(
    remoteDataSource: datasource,
  );
  final tPokemonModel = PokemonModel.fromJson(
    jsonDecode(fixture('teste.json')),
  );
  final tPokemon = tPokemonModel;

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

      when(() => datasource.getPokemonByName(pokemon)).thenThrow(
        exception,
      );

      final result = await respository.getPokemonByName('pikachu');
      result.fold((failureA) => failureToTest = failureA, (pokemon) => null);

      verify(() => datasource.getPokemonByName(pokemon));
      expect(failureToTest!.message, equals(messageFailure));
    });
  }

  group('data |', () {
    test('should get a pokemon by his name from api', () async {
      when(() => datasource.getPokemonByName('pikachu')).thenAnswer(
        (_) async => tPokemonModel,
      );

      final result = await respository.getPokemonByName('pikachu');

      expect(result, equals(Right(tPokemon)));
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
      messageFailure: 'Pokemon não encontrado.',
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
      messageFailure: 'Erro ao tentar encontrar o pokemon, tente novamente.',
    );
  });
}
