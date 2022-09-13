import 'package:pokedex/app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex/app/cores/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import '../../../../cores/error/failures.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Pokemon>>> getAllPokemons() {
    // TODO: implement getAllPokemons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemonByName(String name) async {
    try {
      final pokemonRequest = await remoteDataSource.getPokemonByName(name);
      return Right(pokemonRequest);
    } catch (e) {
      return Left(
        Failures().handleFailures(e),
      );
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemonByNature(String nature) {
    // TODO: implement getPokemonByNature
    throw UnimplementedError();
  }
}
