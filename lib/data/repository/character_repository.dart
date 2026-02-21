

import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';

class CharactersRepsitory{
  final CharactersWebServices charactersWebServices;

  CharactersRepsitory({required this.charactersWebServices});
  Future<List<Character>> getAllCharacters() async {
    final data = await charactersWebServices.getAllCharacters();

    List characters = data['results'] ?? [];
      
    List <Character> charactersList =
        characters.map((e) => Character.formJson(e)).toList();


    return charactersList;
  }
}