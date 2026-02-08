import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<charactersState>{
  CharactersCubit(): super(CharacterInitial());
}
