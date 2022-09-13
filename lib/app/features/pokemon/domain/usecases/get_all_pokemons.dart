import 'package:pokedex/app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex/app/cores/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import '../../../../cores/error/failures.dart';
import '../repositories/pokemon_repository.dart';

class GetAllPokemonsUsecase {
  final PokemonRepository repository;

  GetAllPokemonsUsecase(this.repository);

  Future<Either<Failure, List<Pokemon>>> getAllPokemons() async {
    return await repository.getAllPokemons();
  }
}
