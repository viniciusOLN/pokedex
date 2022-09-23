import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/cores/error/exceptions.dart';
import 'package:pokedex/app/features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex/app/features/pokemon/data/models/pokemon_thumbnail_model.dart';
import '../../../fixture/fixture.dart';

class MockDio extends Mock implements Dio {}

void main() {
  final client = MockDio();
  const tPagination = 20;
  final datasource = PokemonRemoteDataSourceImpl(
    client: client,
  );

  Response mockDioToReturnJsonStatusCode(int statusCode) {
    return Response(
      data: {'404': statusCode},
      requestOptions: RequestOptions(path: ''),
      statusCode: statusCode,
    );
  }

  Response mockDioToReturnJsonStatusCode200() {
    return Response(
      data: jsonDecode(fixture('teste_thumb.json')),
      requestOptions: RequestOptions(path: ''),
      statusCode: 200,
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

        final result = datasource.getAllPokemons(tPagination);

        await expectLater(() => result, throwsA(equals(exception)));
      },
    );
  }

  test('should get a list of pokemons from api', () async {
    when(() => client.get(any())).thenAnswer(
      (_) async => mockDioToReturnJsonStatusCode200(),
    );

    final result = await datasource.getAllPokemons(tPagination);
    expect(result, isA<List<PokemonThumbnailModel>>());
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
