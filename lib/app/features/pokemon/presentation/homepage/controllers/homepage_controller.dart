import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex/app/injection_dependencies.dart';
import 'package:pokedex/app/utils/types_pokemon.dart';
import '../../../../../cores/error/failures.dart';
import '../../../../../injection_dependencies.dart';

class HomePageController extends GetxController {
  List<Pokemon> listPokemons = [];
  List<Pokemon> favoritesPokemons = [];
  List<String> typesPokemon = supportedTypes;
  List<String> pokemonsInthatNature = [];
  int pag = 1;
  int limitPokemonsPerRequisition = 20;
  int selectedType = 0;
  bool isLoading = true;
  bool isLoadingMoreData = false;
  bool isFavoriteList = false;
  final controllerScroll = ScrollController();
  late Failure failure;

  @override
  void onInit() {
    getPokemon(pag);
    verifyScroll();
    super.onInit();
  }

  @override
  void onClose() {
    controllerScroll.dispose();
    super.onClose();
  }

  void verifyScroll() {
    controllerScroll.addListener(() {
      double positionScroll = controllerScroll.position.maxScrollExtent;
      bool isEndList = positionScroll == controllerScroll.offset;

      if (isEndList && !isFavoriteList) {
        isLoadingMoreData = true;
        getPokemon(pag);
      }
    });
  }

  void pokemonIsFavorite(bool isFavorite, Pokemon pokemon) {
    if (isFavorite && !favoritesPokemons.contains(pokemon)) {
      favoritesPokemons.add(pokemon);
    } else {
      favoritesPokemons.removeWhere((element) => element.name == pokemon.name);
      if (isFavoriteList) {
        listPokemons.remove(pokemon);
      }
    }
    pokemon.isFavorite = isFavorite;
    update(['cards']);
  }

  void makePokemonFavorite() {
    List<String> pokemons = [];
    for (int i = 0; i < favoritesPokemons.length; i++) {
      pokemons.add(favoritesPokemons[i].name);
    }

    for (int j = 0; j < listPokemons.length; j++) {
      if (pokemons.contains(listPokemons[j].name)) {
        listPokemons[j].isFavorite = true;
      }
    }
  }

  void updatePokemons(int currentPagination) async {
    int newPagination = currentPagination + limitPokemonsPerRequisition;
    final response = await GetAllPokemons.usecase.getAllPokemons(
      pag,
      newPagination,
    );

    pag = newPagination + 1;

    response.fold((l) => print(l.message), (r) {
      listPokemons.addAll(r);
    });

    makePokemonFavorite();
    updateCards();
  }

  void getPokemonByNature(int index) async {
    if (pokemonsInthatNature.isEmpty) {
      final pokemonsInThatNature =
          await GetPokemonsInThatNature.usecase.getPokemonsInThatNature(
        typesPokemon[index],
      );
      pokemonsInThatNature.fold((l) => null, (r) {
        pokemonsInthatNature.addAll(r);
      });
    }

    final pokemons = await GetAllPokemonsByNature.usecase.getPokemonByNature(
      pokemonsInthatNature,
      pokemonsInthatNature.length < limitPokemonsPerRequisition
          ? pokemonsInthatNature.length
          : limitPokemonsPerRequisition,
    );

    pokemons.fold((l) => print(l.message), (r) {
      listPokemons.addAll(r);
    });

    listPokemons.forEach(
      (element) => pokemonsInthatNature.remove(element.name),
    );

    makePokemonFavorite();
    updateCards();
  }

  void getPokemon(int pagination) {
    (selectedType == 0)
        ? updatePokemons(pagination)
        : getPokemonByNature(selectedType);
    update(['cards']);
  }

  void favoritePokemons() {
    listPokemons.clear();
    listPokemons.addAll(favoritesPokemons);
    isFavoriteList = true;

    update(['cards']);
  }

  void modifyChoiceTip() {
    update(['filter']);
    resetGeneralState();
    getPokemon(pag);
  }

  void updateCards() {
    isLoading = false;
    isLoadingMoreData = false;
    update(['cards']);
  }

  void resetGeneralState() {
    listPokemons.clear();
    pokemonsInthatNature.clear();
    isFavoriteList = false;
    isLoading = true;
    isLoadingMoreData = true;
    pag = 1;
  }
}
