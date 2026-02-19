import 'package:flutter/material.dart';
import 'package:flutter_breaking/business_logic/Cubit/characters_cubit.dart';
import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/repository/character_repository.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';
import 'package:flutter_breaking/presentation/screens/character_Details_screen.dart';
import 'package:flutter_breaking/presentation/screens/characters_screen.dart';
import 'constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRouter{
  late CharactersCubit charactersCubit;
  late CharactersRepsitory charactersRepsitory;
  AppRouter(){
    charactersRepsitory = CharactersRepsitory(charactersWebServices: CharactersWebServices());
    charactersCubit = CharactersCubit(characterRepsitory: charactersRepsitory);
  }

  Route ? generateRoute(RouteSettings settings){
switch(settings.name){
  case charactersScreen :
  return MaterialPageRoute(builder: (_) => BlocProvider(
    create: (context) => charactersCubit,
    child: CharactersScreen(),
    ), 
    );
  case characterDetailsScreen :
  final  character  = settings.arguments as Character;
  return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character : character)) ;
  
}

  }
}