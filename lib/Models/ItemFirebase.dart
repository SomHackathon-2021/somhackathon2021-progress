class ItemFirebase {
  String id;
  String name;
  String description;
  String imgUrl;
  String city;
  String country;
  int numeroSellos;
  bool respectEquality;
  bool respectNature;
  bool respectWorker;
  bool isClose;
  Map<String, dynamic> nutritionalData;  
  ItemFirebase({this.id, this.name, this.description, this.imgUrl, this.nutritionalData, this.city, this.country, this.numeroSellos, this.isClose, this.respectEquality, this.respectNature, this.respectWorker});
}