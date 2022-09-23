import 'package:dio/dio.dart';

import 'features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'features/pokemon/domain/usecases/get_all_pokemons.dart';
import 'features/pokemon/domain/usecases/get_pokemon_by_nature.dart';
import 'features/pokemon/domain/usecases/get_pokemons_in_that_nature.dart';

class GetAllPokemons {
  static PokemonRemoteDataSourceImpl datasource = PokemonRemoteDataSourceImpl(
    client: Dio(),
  );
  static PokemonRepositoryImpl repository = PokemonRepositoryImpl(
    remoteDataSource: GetAllPokemons.datasource,
  );
  static GetAllPokemonsUsecase usecase = GetAllPokemonsUsecase(
    GetAllPokemons.repository,
  );
}

class GetAllPokemonsByNature {
  static PokemonRemoteDataSourceImpl datasource = PokemonRemoteDataSourceImpl(
    client: Dio(),
  );
  static PokemonRepositoryImpl repository = PokemonRepositoryImpl(
    remoteDataSource: GetAllPokemonsByNature.datasource,
  );
  static GetPokemonByNatureUsecase usecase = GetPokemonByNatureUsecase(
    GetAllPokemonsByNature.repository,
  );
}

class GetPokemonsInThatNature {
  static PokemonRemoteDataSourceImpl datasource = PokemonRemoteDataSourceImpl(
    client: Dio(),
  );
  static PokemonRepositoryImpl repository = PokemonRepositoryImpl(
    remoteDataSource: GetPokemonsInThatNature.datasource,
  );
  static final usecase = GetPokemonsInThatNatureUsecase(
    GetAllPokemonsByNature.repository,
  );
}
