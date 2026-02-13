part of 'characters_cubit.dart';

@immutable 
abstract class CharactersState {
  
}
class CharactersInitial extends CharactersState{}

class CharatersLoaded extends CharactersState{
final List<Character> characters;
  CharatersLoaded(this.characters);
}