import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/controllers/homepage_controller.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/views/widgets/card_struct.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/views/widgets/image_pokemon.dart';
import '../../../../../../utils/pokemon_type_colors.dart';

class CardPokemon extends StatelessWidget {
  Pokemon pokemon;
  CardPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        '/pokemon-page',
        arguments: {
          'pokemon': pokemon,
          'color':
              colorBackgroundCard[pokemon.types[0].name] ?? Colors.blueGrey,
        },
      ),
      child: CardStruct(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  pokemon.types[0].name,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: colorBackgroundCard[pokemon.types[0].name] ??
                        Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Hero(
              tag: pokemon.imageUrl,
              child: ImagePokemon(
                typeName: pokemon.types[0].name,
                urlImage: pokemon.imageUrl,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    pokemon.name.toUpperCase(),
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Color.fromARGB(158, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final controller = Get.find<HomePageController>();
                    controller.pokemonIsFavorite(
                      !pokemon.isFavorite,
                      pokemon,
                    );
                  },
                  child: Icon(
                    pokemon.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Color.fromARGB(200, 244, 67, 54),
                    size: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
