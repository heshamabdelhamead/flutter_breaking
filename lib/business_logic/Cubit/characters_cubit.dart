import 'package:bloc/bloc.dart';
import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/repository/character_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState>{
   final CharactersRepsitory characterRepsitory ;
 late  List<Character> characters;
  CharactersCubit({required this.characterRepsitory}): super (CharactersInitial());
    List<Character> getAllCharacters(){
      characterRepsitory.getAllCharacters().then((characters){
        emit(CharatersLoaded(characters));
        this.characters = characters;

      });
      return  characters;
    }

}

