import 'package:get/get.dart';

import '../controllers/pokemon_page_controller.dart';

class PokemonPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PokemonPageController(),
    );
  }
}
