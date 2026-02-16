import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/Cubit/characters_cubit.dart';
import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/repository/character_repository.dart';
import 'package:flutter_breaking/presentation/widgets/character_item.dart';


class CharactersScreen extends StatefulWidget {

 const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
List <Character> allCharacters = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }
  Widget builtBlocWidget(){
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
       if  (state is CharatersLoaded){
        allCharacters = state.characters;
          return buildLoadedListWidgets();
       }else{
        return showLoadingIndicator() ;
       }
      },
    );
  }
  Widget showLoadingIndicator(){
    return Center(
      child:  CircularProgressIndicator (
        color : MyColors.myYellow
      ),
    );
  }
  Widget buildLoadedListWidgets(){
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGray,
        child: Column(
          children: [
            buildCharacterList()
          ],
        ) ,
      ),
    );

  }
 Widget buildCharacterList(){
return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2/3,crossAxisSpacing: 1,mainAxisSpacing: 1),
shrinkWrap: true,
physics: const ClampingScrollPhysics(),
padding: EdgeInsets.zero,
itemCount: allCharacters.length,
itemBuilder: (context, index) {
   return CharacterItem(
    character: allCharacters[index],
  );
},);
 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Characters"),backgroundColor: MyColors.myYellow,titleTextStyle: TextStyle(color: MyColors.myGray), 
      ),
      body: builtBlocWidget(),

    );
    
  }
}