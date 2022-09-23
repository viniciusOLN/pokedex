import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pokedex/app/features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex/app/features/pokemon/data/models/pokemon_model.dart';

String fixture(String name) =>
    File('test/app/fixture/$name').readAsStringSync();

// void main() async {
//   // final response = await Dio().get("https://pokeapi.co/api/v2/pokemon/pikachu");
//   // //final a = Pokemon.fromJson(json.decode());
//   // final a = json.decode(fixture('teste.json'));

//   PokemonRemoteDataSourceImpl aa = PokemonRemoteDataSourceImpl(client: Dio());
//   // final result = await aa.getPokemonByName('pikachu');
//   // print(result.name);
//   // print(result.abilities![0].name);
//   // print(result.abilities![0].url);
//   // print(result.baseExperience);
//   // print(result.id);
//   // print(result.isDefault);
//   // print(result.weight);
//   // print(result.urlImage);
//   // print(result.stats![0].name);
//   // print(result.stats![0].baseStat);
//   // print(result.stats![0].effort);
//   // print(result.types![0].name);
//   final a = await aa.getAllPokemons();
//   print(a[1].imageUrl);
// }
