import 'package:flutter/material.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/controllers/homepage_controller.dart';

import 'card_pokemon.dart';

class GridPokemon extends StatelessWidget {
  HomePageController controller;
  GridPokemon({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            controller: controller.controllerScroll,
            itemCount: controller.listPokemons.length,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.82,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              if (index < controller.listPokemons.length) {
                return CardPokemon(
                  pokemon: controller.listPokemons[index],
                );
              }
              return Container();
            },
          ),
        ),
        controller.isLoadingMoreData
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Center(child: CircularProgressIndicator()),
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
