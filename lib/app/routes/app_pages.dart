import 'package:get/get.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/bindings/homepage_binding.dart';
import 'package:pokedex/app/features/pokemon/presentation/pokemon_page/views/pokemon_page_view.dart';
import 'package:pokedex/app/routes/app_routes.dart';
import '../features/pokemon/presentation/homepage/views/homepage_view.dart';
import '../features/pokemon/presentation/pokemon_page/bindings/pokemon_page_bindings.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HomePage,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.PokemonPage,
      page: () => PokemonPage(),
      binding: PokemonPageBindings(),
    ),
  ];
}
