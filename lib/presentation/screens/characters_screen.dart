import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/characters_cubit.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_widgets.dart';
import '../../data/models/character.dart';
import '../widgets/characters_grid.dart';
import '../widgets/search_field.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final _searchController = TextEditingController();
  late List<Character> allCharacters;
  late List<Character> searchedCharacters;
  var _isSearching = false;

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() => _isSearching = true);
  }

  void _stopSearch() => setState(() {
        _searchController.clear();
        _isSearching = false;
      });

  void _clearSearchOrPop() => _searchController.text.isNotEmpty
      ? setState(() => _searchController.clear())
      : Navigator.pop(context);

  void _updateSearchedCharacters(String keyword) =>
      setState(() => searchedCharacters = allCharacters
          .where((character) =>
              character.name.toLowerCase().startsWith(keyword.toLowerCase()))
          .toList());

  AppBar _buildSearchableAppBar() {
    return AppBar(
      backgroundColor: AppColors.yellow,
      iconTheme: const IconThemeData(color: AppColors.grey),
      title: _isSearching
          ? SearchField(
              searchController: _searchController,
              onChange: _updateSearchedCharacters,
            )
          : const Text(
              'Characters',
              style: TextStyle(color: AppColors.grey),
            ),
      actions: _isSearching
          ? [
              IconButton(
                icon: const Icon(Icons.clear_rounded),
                onPressed: () => _clearSearchOrPop(),
              ),
            ]
          : [
              IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: _startSearch,
              ),
            ],
    );
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharactersCubit>(context).allCharacters;
  }

  @override
  Widget build(BuildContext context) {
    print('Characters Screen Build');
    return Scaffold(
      appBar: _buildSearchableAppBar(),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = state.characters;
            return CharactersGrid(
                characters: _searchController.text.isEmpty
                    ? allCharacters
                    : searchedCharacters);
          } else {
            return AppWedgets.centerLoading;
          }
        },
      ),
    );
  }
}
