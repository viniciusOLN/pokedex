import 'package:dartz/dartz.dart';
import '../../../../cores/error/exceptions.dart';
import '../../../../cores/error/failures.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonByNatureUsecase {
  final PokemonRepository repository;

  GetPokemonByNatureUsecase(this.repository);

  Future<Either<Failure, Pokemon>> getPokemonByNature(String nature) async {
    return await repository.getPokemonByNature(nature);
  }
}
