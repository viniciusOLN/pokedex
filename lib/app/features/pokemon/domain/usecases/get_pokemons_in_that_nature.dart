import 'package:dartz/dartz.dart';
import '../../../../cores/error/exceptions.dart';
import '../../../../cores/error/failures.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonsInThatNatureUsecase {
  final PokemonRepository repository;

  GetPokemonsInThatNatureUsecase(this.repository);

  Future<Either<Failure, List<String>>> getPokemonsInThatNature(
    String nature,
  ) async {
    return await repository.getPokemonsInThatNature(nature);
  }
}
