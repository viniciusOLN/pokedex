import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/views/widgets/choice_tip_bar.dart';
import '../../controllers/homepage_controller.dart';

// ignore: must_be_immutable
class HeaderHomePage extends StatelessWidget {
  Widget child;
  HeaderHomePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<HomePageController>(
          id: 'filter',
          builder: (_) {
            return ChoiceTipBar(controller: _);
          },
        ),
        Expanded(child: child),
      ],
    );
  }
}
