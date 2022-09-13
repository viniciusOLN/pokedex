import 'dart:convert';
import '../../../../cores/error/exceptions.dart';
import '../models/pokemon_model.dart';
import 'package:dio/dio.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonModel> getPokemonByNature(String nature);
  Future<List<PokemonModel>> getAllPokemons();
  Future<PokemonModel> getPokemonByName(String name);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  Dio client = Dio();

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<PokemonModel> getPokemonByNature(String nature) {
    throw UnimplementedError();
  }

  @override
  Future<List<PokemonModel>> getAllPokemons() {
    throw UnimplementedError();
  }

  @override
  Future<PokemonModel> getPokemonByName(String name) async {
    final res =
        await client.get("https://pokeapi.co/api/v2/pokemon/$name").timeout(
      const Duration(minutes: 2),
      onTimeout: (() {
        return Response(
          statusCode: 408,
          requestOptions: RequestOptions(path: ''),
        );
      }),
    );
    if (res.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(res.data));
    }
    throw Errors.handleError(statusCode: res.statusCode);
  }
}
