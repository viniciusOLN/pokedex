import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pokedex/app/features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex/app/features/pokemon/data/models/pokemon_model.dart';

String fixture(String name) =>
    File('test/app/fixture/$name').readAsStringSync();

// void main() async {
//   final response = await Dio().get("https://pokeapi.co/api/v2/pokemon/pikachu");
//   //final a = Pokemon.fromJson(json.decode());
//   final a = json.decode(fixture('teste.json'));

//   PokemonRemoteDataSourceImpl aa = PokemonRemoteDataSourceImpl(client: Dio());
//   Pokemon result = await aa.getPokemonByName('pikachu');
//   print(result.name);
// }
