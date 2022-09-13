import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/cores/error/exceptions.dart';
import 'package:pokedex/app/features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/app/features/pokemon/data/models/pokemon_model.dart';
import '../../../fixture/fixture.dart';

class MockDio extends Mock implements Dio {}

void main() {
  const pokemonName = "pikachu";
  final client = MockDio();
  final datasource = PokemonRemoteDataSourceImpl(
    client: client,
  );

  Response mockDioToReturnJsonStatusCode200() {
    return Response(
      data: fixture('teste.json'),
      requestOptions: RequestOptions(path: ''),
      statusCode: 200,
    );
  }

  Response mockDioToReturnJsonStatusCode(int statusCode) {
    return Response(
      data: {'404': statusCode},
      requestOptions: RequestOptions(path: ''),
      statusCode: statusCode,
    );
  }

  void testException({
    required String describe,
    required int statusCode,
    required Exception exception,
  }) {
    test(
      describe,
      () async {
        when(() => client.get(any())).thenAnswer(
          (_) async => mockDioToReturnJsonStatusCode(statusCode),
        );

        final result = datasource.getPokemonByName(pokemonName);

        await expectLater(() => result, throwsA(equals(exception)));
      },
    );
  }

  group('requisitions |', () {
    test(
      'should make a GET requisition to pokeApi',
      () async {
        when(() => client.get(any())).thenAnswer(
          (_) async => mockDioToReturnJsonStatusCode200(),
        );

        await datasource.getPokemonByName(pokemonName);

        verify(
          () => client.get(
            'https://pokeapi.co/api/v2/pokemon/$pokemonName',
          ),
        );
      },
    );

    test(
      'should make a GET requisition to pokeApi and return a pokemon',
      () async {
        when(() => client.get(any())).thenAnswer(
          (_) async => mockDioToReturnJsonStatusCode200(),
        );

        final result = await datasource.getPokemonByName(pokemonName);

        expect(result, isA<PokemonModel>());
      },
    );
  });

  group('failures |', () {
    testException(
      describe: 'should return a NotFound Exception',
      statusCode: 404,
      exception: NotFoundException(),
    );

    testException(
      describe: 'should return a TimeOutException',
      statusCode: 408,
      exception: TimeOutException(),
    );

    testException(
      describe: 'should return a ServerException',
      statusCode: 500,
      exception: ServerException(),
    );

    testException(
      describe: 'should return a generic error exception',
      statusCode: 502,
      exception: OtherError(),
    );
  });
}
