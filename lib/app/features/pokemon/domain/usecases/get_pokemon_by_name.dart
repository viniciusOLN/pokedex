import 'package:dartz/dartz.dart';

import '../../../../cores/error/failures.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonByNameUsecase {
  final PokemonRepository repository;

  GetPokemonByNameUsecase(this.repository);

  Future<Either<Failure, Pokemon>> getPokemonByName(String name) async {
    return await repository.getPokemonByName(name);
  }
}
