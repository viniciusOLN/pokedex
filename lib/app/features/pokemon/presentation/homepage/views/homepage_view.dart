import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/controllers/homepage_controller.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/views/widgets/header_homepage.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/views/widgets/loading_pokemons.dart';
import 'widgets/grid_pokemon.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomePageController>();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
          actions: [
            IconButton(
              onPressed: () => controller.favoritePokemons(),
              icon: const Icon(Icons.favorite_border_outlined),
              tooltip: 'Pokemons Favoritos',
            ),
          ],
        ),
        body: HeaderHomePage(
          child: GetBuilder<HomePageController>(
            id: 'cards',
            builder: (_) {
              if (_.isLoading) {
                return const Loading();
              }
              return GridPokemon(controller: _);
            },
          ),
        ),
      ),
    );
  }
}
