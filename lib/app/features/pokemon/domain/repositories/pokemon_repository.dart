import 'package:dartz/dartz.dart';
import 'package:pokedex/app/cores/error/exceptions.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/pokemon.dart';

import '../../../../cores/error/failures.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokemon>> getPokemonByName(String name);
  Future<Either<Failure, List<Pokemon>>> getAllPokemons();
  Future<Either<Failure, Pokemon>> getPokemonByNature(String nature);
}
