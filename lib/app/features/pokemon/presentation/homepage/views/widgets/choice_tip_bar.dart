import 'package:flutter/material.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/controllers/homepage_controller.dart';

import '../../../../../../utils/pokemon_type_colors.dart';

class ChoiceTipBar extends StatelessWidget {
  HomePageController controller;
  ChoiceTipBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(controller.typesPokemon.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: ChoiceChip(
              selected: controller.selectedType == index,
              label: Text(
                controller.typesPokemon[index],
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              elevation: 0,
              pressElevation: 3,
              labelPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              backgroundColor: Color.fromARGB(255, 145, 145, 145),
              selectedColor:
                  colorBackgroundCard[controller.typesPokemon[index]],
              onSelected: (bool selected) {
                if (selected) {
                  controller.selectedType = index;
                }
                controller.modifyChoiceTip();
              },
            ),
          );
        }),
      ),
    );
  }
}
