import 'package:pokedex/app/features/pokemon/data/models/pokemon_thumbnail_model.dart';
import '../../../../cores/error/exceptions.dart';
import '../models/pokemon_model.dart';
import 'package:dio/dio.dart';

abstract class PokemonRemoteDataSource {
  Future<List<String>> getPokemonByNature(String nature);
  Future<PokemonModel> getAllPokemons(int idPokemon);
  Future<PokemonModel> getPokemonByName(String name);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  Dio client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<String>> getPokemonByNature(String nature) async {
    Response res;
    res = await client.get("https://pokeapi.co/api/v2/type/$nature/").timeout(
      const Duration(minutes: 2),
      onTimeout: (() {
        return Response(
          statusCode: 408,
          requestOptions: RequestOptions(path: ''),
        );
      }),
    );

    if (res.statusCode == 200) {
      List<String> response = [];
      List data = res.data['pokemon'];

      for (var e in data) {
        response.add(e['pokemon']['name']);
      }

      return response;
    }
    throw Errors.handleError(statusCode: res.statusCode);
  }

  @override
  Future<PokemonModel> getAllPokemons(int idPokemon) async {
    Response res;
    res = await client
        .get("https://pokeapi.co/api/v2/pokemon/${idPokemon}/")
        .timeout(
      const Duration(minutes: 2),
      onTimeout: (() {
        return Response(
          statusCode: 408,
          requestOptions: RequestOptions(path: ''),
        );
      }),
    );

    if (res.statusCode == 200) {
      return PokemonModel.fromJson(res.data);
    }
    throw Errors.handleError(statusCode: res.statusCode);
  }

  @override
  Future<PokemonModel> getPokemonByName(String name) async {
    Response res;
    res = await client.get("https://pokeapi.co/api/v2/pokemon/$name").timeout(
      const Duration(minutes: 2),
      onTimeout: (() {
        return Response(
          statusCode: 408,
          requestOptions: RequestOptions(path: ''),
        );
      }),
    );

    if (res.statusCode == 200) {
      return PokemonModel.fromJson(res.data);
    }
    throw Errors.handleError(statusCode: res.statusCode);
  }
}
