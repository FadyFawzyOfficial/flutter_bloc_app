import '../models/character.dart';
import '../services/character_service.dart';

class CharactersRepository {
  final CharacterService characterService;

  CharactersRepository(this.characterService);

  Future<List<Character>> get allCharacters async {
    final characters = await characterService.allCharacters;
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
