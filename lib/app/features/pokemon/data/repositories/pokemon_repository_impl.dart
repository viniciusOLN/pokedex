import 'package:pokedex/app/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/pokemon.dart';
import 'package:dartz/dartz.dart';
import '../../../../cores/error/failures.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PokemonModel>>> getAllPokemons(
    int paginationStart,
    int paginationEnds,
  ) async {
    try {
      List<PokemonModel> pokemonRequest = [];
      for (int i = paginationStart; i <= paginationEnds; i++) {
        final response = await remoteDataSource.getAllPokemons(i);
        pokemonRequest.add(response);
      }
      return Right(pokemonRequest);
    } catch (e) {
      return Left(
        Failures(
          notFoundMessage: 'Pokemons não encontrados.',
        ).handleFailures(e),
      );
    }
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
  Future<Either<Failure, List<Pokemon>>> getPokemonByNature(
    List<String> pokemonNames,
    int pagination,
  ) async {
    try {
      List<Pokemon> pokemonRequests = [];
      for (int i = 0; i < pagination; i++) {
        final pokemonRequest = await remoteDataSource.getPokemonByName(
          pokemonNames[i],
        );
        pokemonRequests.add(pokemonRequest);
      }
      return Right(pokemonRequests);
    } catch (e) {
      return Left(
        Failures(
          notFoundMessage: 'Pokemons não encontrados.',
        ).handleFailures(e),
      );
    }
  }

  @override
  Future<Either<Failure, List<String>>> getPokemonsInThatNature(
      String nature) async {
    try {
      final pokemonRequest = await remoteDataSource.getPokemonByNature(
        nature,
      );
      return Right(pokemonRequest);
    } catch (e) {
      return Left(
        Failures().handleFailures(e),
      );
    }
  }
}
