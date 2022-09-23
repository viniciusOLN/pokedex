import 'package:get/get.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/controllers/homepage_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomePageController(),
    );
  }
}
