// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_breaking/app_router.dart';
import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/constants/strings.dart';

import 'package:flutter_breaking/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8)

      ),
      child:InkWell(
        onTap: () {
          Navigator.pushNamed(context, characterDetailsScreen , arguments: character);
        },
        child: GridTile(child: 
        Hero(
          tag: character.id,
          child: Container(
            color: MyColors.myGray,
            child: FadeInImage.assetNetwork(
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: 'assets/images/loading.png',
            image: character.image,
          ),
          ),
        ),
        footer: Container(
          width:  double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text('${character.name}',
          style: TextStyle(height: 1.3,fontSize: 16,color: MyColors.myWhite,fontWeight: FontWeight.bold),
           overflow: TextOverflow.ellipsis,
           maxLines: 2,
           textAlign: TextAlign.center,
        ),
        ) ,
        ),
      )
    );
    throw UnimplementedError();
  }
}
