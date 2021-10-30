import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/characters_cubit.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_widgets.dart';
import '../../data/models/character.dart';
import '../widgets/characters_grid.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();

    allCharacters = BlocProvider.of<CharactersCubit>(context).allCharacters;
  }

  @override
  Widget build(BuildContext context) {
    print('CharactersScreen Build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        title: const Text(
          'Characters',
          style: TextStyle(color: AppColors.grey),
        ),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = state.characters;
            return CharactersGrid(allCharacters: allCharacters);
          } else {
            return AppWedgets.centerLoading;
          }
        },
      ),
    );
  }
}
