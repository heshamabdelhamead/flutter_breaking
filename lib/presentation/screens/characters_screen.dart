import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/Cubit/characters_cubit.dart';
import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/repository/character_repository.dart';
import 'package:flutter_breaking/presentation/widgets/character_item.dart';
import 'package:flutter_offline/flutter_offline.dart';


class CharactersScreen extends StatefulWidget {

 const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
List <Character> allCharacters = [];
List <Character> searchedCharacters = [];
bool _isSearching = false ;
final _searchTextController = TextEditingController();

// implement searchField
 Widget _buildSearchField(){
  return TextField(
    controller: _searchTextController,
    cursorColor: MyColors.myGray,
    decoration: InputDecoration(
      hintText: 'find a character ....',
      border: InputBorder.none,
      hintStyle: TextStyle(color: MyColors.myGray,fontSize: 18)

    ),
     style :  TextStyle(color: MyColors.myGray,fontSize: 18),
     onChanged: (searchCharacter) {
      addSearchedItemsToSearchedLish(searchCharacter);
     },

  );

 }
 // function to set searched items 
 void addSearchedItemsToSearchedLish(String searchCharacter){
  searchedCharacters = allCharacters.where((character) => character.name.toLowerCase().startsWith(searchCharacter)).toList() ;
  setState(() {
  });
 }
//buitl app bar 
List<Widget> _buildAppBarActions(){
  if (_isSearching){
  return[ 
    // this is the x button 
    IconButton.outlined(onPressed:(){
      _clearSearch();
      Navigator.pop(context);
    } , icon: Icon(Icons.clear,color: MyColors.myGray))
  ];
  }else{
return[ 
    IconButton.outlined(onPressed:
      _startSearch
       , icon: Icon(Icons.search,color: MyColors.myGray))
  ];
  }
}
void _startSearch(){
ModalRoute.of(context)?.addLocalHistoryEntry(LocalHistoryEntry(onRemove:_stopSearching ));
setState(() {
  _isSearching = true;
});
}
void _stopSearching(){
 _clearSearch();
 setState(() {
   _isSearching = false;
 });
}
void _clearSearch(){
  _searchTextController.clear();
}
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
itemCount:  _isSearching ? searchedCharacters.length  :allCharacters.length,
itemBuilder: (context, index) {
   return CharacterItem(
    character:  _isSearching ? searchedCharacters[index] : allCharacters[index],
  );
},);
 }

Widget _builtAppBarTitile(){
  return Text("Characters",style: TextStyle(color: MyColors.myGray));
}
Widget thereNoInternet(){
  return Center(
    child: Column(
      spacing: 40,
      mainAxisAlignment: .center,
    children: [Icon(Icons.signal_wifi_connected_no_internet_4,),
    Text("you need to check your internet connection",style:TextStyle(color:Colors.red), ),
    ],
    
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: MyColors.myYellow,titleTextStyle: TextStyle(color: MyColors.myGray), 
      title: _isSearching ? _buildSearchField() : _builtAppBarTitile() ,
      actions:  _buildAppBarActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ){
         
          final bool connected = !connectivity.contains(ConnectivityResult.none);
          if(connected)  {
            return builtBlocWidget() ;

          }else{
           return child;
          }

        },
        child: thereNoInternet())
     //  builtBlocWidget(),

    );
    
  }
}