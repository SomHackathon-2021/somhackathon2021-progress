class ItemFirebase {
  String id;
  String name;
  String description;
  String imgUrl;
  Map<String, dynamic> nutritionalData;  
  bool isLocal;

  ItemFirebase({this.id, this.name, this.description, this.imgUrl, this.nutritionalData, this.isLocal});

}