import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/app_colors.dart';
import '../../data/models/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Character Item Build');
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: character.imageUrl.isNotEmpty
            ? FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: character.imageUrl,
                fit: BoxFit.cover,
              )
            : Image.asset('assets/images/no_image.png'),
        footer: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.black54,
          child: Text(
            character.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
