class Character {
 late int id ;
 late String name;
 late  String ifDiedOrAlive;
 late String species;
 late String type;
 late String gender;
 late String image;
 //late List <String> epsides;
 late String created;
  Character.formJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    species = json['species'];
    image = json['image'];
    ifDiedOrAlive = json['status'];
    type = json['type'];
    gender = json['gender'];
    //epsides = json['episode']; // apearence of seasons 
    created = json['created'];

  }
}