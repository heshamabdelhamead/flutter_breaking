

import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';

class CharactersRepsitory{
  final CharactersWebServices charactersWebServices;

  CharactersRepsitory({required this.charactersWebServices});
  Future<List<Character>> getAllCharacters()async{
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => Character.formJson(character)).toList();
  }
}