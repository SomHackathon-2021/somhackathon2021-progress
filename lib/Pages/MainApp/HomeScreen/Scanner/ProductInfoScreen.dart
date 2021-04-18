import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackathon/Models/ItemFirebase.dart';
import 'package:hackathon/Pages/MainApp/HomeScreen/Scanner/CreateNewItem.dart';
import 'package:hackathon/Services/database.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProductInfoScreen extends StatelessWidget {
  String id;
  UsersDatabase database = new UsersDatabase();
  ItemFirebase item;
  ProductInfoScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getItemData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (item == null) {
            return Scaffold(
              appBar: AppBar(
                elevation: 1,
                backgroundColor: Colors.white,
                centerTitle: true,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context)),
              ),
              body: Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "L'item que has intentat escanejar no existeix a la nostra base de dades",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateNewItem(
                                      barcode: id,
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 30, bottom: 10, right: 50, left: 50),
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3)),
                          ],
                          color: Colors.orange[400].withOpacity(0.9),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Center(
                          child: Text(
                            "Donar d'alta",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
                appBar: AppBar(
                  elevation: 1,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context)),
                ),
                body: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  margin: EdgeInsets.only(top: 60, right: 30, left: 30),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(item.imgUrl),
                            ),
                            _circlePercent(),
                          ],
                        ),
                      ),
                      Center(
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          item.description,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          (item.country + ", " + item.city),
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.tree,
                              color: _NatureColor(),
                              size: 30,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              FontAwesomeIcons.peopleCarry,
                              color: _WorkersColor(),
                              size: 30,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              FontAwesomeIcons.equals,
                              color: _EqualsColor(),
                              size: 30,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.my_location_sharp,
                              color: _LocationColor(),
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _getNutritionalInfo(),
                      IconButton(
                          iconSize: 40,
                          icon: Icon(Icons.shopping_bag_outlined),
                          onPressed: () {}),
                    ],
                  ),
                ));
          }
        } else {
          return Scaffold(
            body: Center(child: Text("Loading data...")),
          );
        }
      },
    );
  }

  Column _getNutritionalInfo() {
    List<Widget> nutritionalDataList = [];



    item.nutritionalData.forEach((key, value) {
      nutritionalDataList.add(Padding(
        padding: EdgeInsets.only(right: 50, left: 50, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(key),
            Text(value),
          ],
        ),
      ));
    });

    return Column(
      children: nutritionalDataList,
    );
  }

  Future<dynamic> _getItemData() async {
    dynamic itemQuery = await database.getItemData(this.id).then((value) {
      if (value == null) {
        return "404";
      } else {
        item = value;
        return value;
      }
    });
    return itemQuery;
  }

  _circlePercent() {
    if (item.numeroSellos > 0) {
      
      double percent =  (item.numeroSellos/4);

      return CircularPercentIndicator(
        radius: 60,
        lineWidth: 5,
        percent: percent,
        center: new Text((percent*100).toString() + "%"),
        progressColor: Colors.green,
      );
    } else {
      return CircularPercentIndicator(
        radius: 60,
        lineWidth: 5,
        backgroundColor: Colors.red,
        percent: 0,
        center: new Text("0%"),
        progressColor: Colors.green,
      );
    }
  }

  MaterialColor _NatureColor() {
    if(item.respectNature){
      return Colors.green;
    }else{
      return Colors.red;
    }
  }

  MaterialColor _WorkersColor() {
    if(item.respectWorker){
      return Colors.green;
    }else{
      return Colors.red;
    }
  }

  MaterialColor _EqualsColor() {
    if(item.respectEquality){
      return Colors.green;
    }else{
      return Colors.red;
    }
  }

  MaterialColor _LocationColor() {
    if(item.isClose){
      return Colors.green;
    }else{
      return Colors.red;
    }
  }
}
