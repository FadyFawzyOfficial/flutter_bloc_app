import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/character.dart';
import '../../data/repositories/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  late List<Character> characters;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> get allCharacters {
    charactersRepository.allCharacters.then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
