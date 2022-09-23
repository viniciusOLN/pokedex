import 'dart:ffi';

import 'package:get/get.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/pokemon.dart';

class PokemonPageController extends GetxController {
  Pokemon pokemonData = Get.arguments['pokemon'];
  final colorPokemon = Get.arguments['color'];
  final widthPage = Get.size.width;
  double limitStatPokemon = 30;

  double barWidth(int statPoint) {
    double porcentBar = (statPoint * 100) / widthPage;
    return porcentBar > limitStatPokemon ? limitStatPokemon : porcentBar * 10;
  }

  String numberFormated(int number) => (number / 10).toString();
}
