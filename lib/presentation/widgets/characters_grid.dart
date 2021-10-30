import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../data/models/character.dart';
import 'character_item.dart';

class CharactersGrid extends StatelessWidget {
  final List<Character> allCharacters;
  const CharactersGrid({Key? key, required this.allCharacters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Characters Grid Build');
    return Container(
      color: AppColors.grey,
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: allCharacters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) => CharacterItem(
          character: allCharacters[index],
        ),
      ),
    );
  }
}
