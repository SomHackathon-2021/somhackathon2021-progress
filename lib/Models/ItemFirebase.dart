class ItemFirebase {
  String id;
  String name;
  String description;
  String imgUrl;
  String city;
  String country;
  int numeroSellos;
  Map<String, dynamic> nutritionalData;  
  ItemFirebase({this.id, this.name, this.description, this.imgUrl, this.nutritionalData, this.city, this.country, this.numeroSellos});
}