import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/pokemon_type_colors.dart';
import '../controllers/pokemon_page_controller.dart';

class PokemonPage extends StatelessWidget {
  PokemonPageController controller = Get.find();
  PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthPage = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        backgroundColor: controller.colorPokemon,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: controller.colorPokemon,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: Hero(
                        tag: controller.pokemonData.imageUrl,
                        child: Image.network(controller.pokemonData.imageUrl)),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              controller.pokemonData.name,
              style: TextStyle(
                color: Color.fromARGB(198, 24, 24, 24),
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children:
                  List.generate(controller.pokemonData.types.length, (index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorBackgroundCard[
                            controller.pokemonData.types[index].name] ??
                        Colors.blueGrey,
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Text(
                    controller.pokemonData.types[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Peso',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(213, 53, 53, 53),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '${controller.numberFormated(controller.pokemonData.weight)} KG',
                      style: TextStyle(
                        color: Color.fromARGB(255, 75, 75, 75),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 80),
                Column(
                  children: [
                    Text(
                      'Altura',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(213, 53, 53, 53),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '${controller.numberFormated(controller.pokemonData.height)} M',
                      style: TextStyle(
                        color: Color.fromARGB(255, 75, 75, 75),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Abilidades',
              style: TextStyle(
                color: Color.fromARGB(198, 24, 24, 24),
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5),
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                controller.pokemonData.abilities.length,
                (index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colorBackgroundCard[
                              controller.pokemonData.types[0].name] ??
                          Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      controller.pokemonData.abilities[index].name ?? '',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Stats',
              style: TextStyle(
                color: Color.fromARGB(198, 24, 24, 24),
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            Column(
              children:
                  List.generate(controller.pokemonData.stats.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.pokemonData.stats[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(198, 24, 24, 24),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          // Text(controller.pokemonData.stats[index].baseStat.toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: controller.barWidth(
                                  controller.pokemonData.stats[index].baseStat,
                                ),
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: colorStatPokemon[
                                      controller.pokemonData.stats[index].name],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                controller.pokemonData.stats[index].baseStat
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(197, 67, 67, 67),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
