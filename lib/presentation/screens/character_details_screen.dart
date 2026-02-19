import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({Key? key, required this.character})
    : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGray,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(character.name, style: TextStyle(color: MyColors.myGray)),
        background: Hero(
          tag: character.id,
          child: Image.network(character.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: MyColors.myWhite, fontSize: 16),
          ),
        ],
      ),
    );
  }
  Widget buildDivider(double endIndent){
    return Divider(
      color: MyColors.myYellow,
      endIndent:endIndent ,
      thickness: 2,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('gender : ' ,character.gender), buildDivider(305),
                     characterInfo('status : ' ,character.ifDiedOrAlive), buildDivider(300),
                       characterInfo('species : ' ,character.species), buildDivider(250),
                       characterInfo('created : ' ,character.created), buildDivider(100),
                       SizedBox(height: 20,)
                    ],
                  
                ),
              ),
             //  SizedBox(height: 7,)
             // Spacer()
            ]),
          ),
        ],
      ),
    );
  }
}
