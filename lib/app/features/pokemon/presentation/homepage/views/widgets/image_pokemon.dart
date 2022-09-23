import 'package:flutter/material.dart';

import '../../../../../../utils/pokemon_type_colors.dart';

// ignore: must_be_immutable
class ImagePokemon extends StatelessWidget {
  String typeName;
  String urlImage;
  ImagePokemon({
    Key? key,
    required this.typeName,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorBackgroundCard[typeName] ?? Colors.blueGrey,
        borderRadius: BorderRadius.circular(400),
      ),
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent? loadingProgress,
        ) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
