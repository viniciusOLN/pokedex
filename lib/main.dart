import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/features/pokemon/presentation/homepage/bindings/homepage_binding.dart';
import 'package:pokedex/app/routes/app_pages.dart';
import 'package:pokedex/app/routes/app_routes.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HomePage,
      initialBinding: HomePageBinding(),
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
