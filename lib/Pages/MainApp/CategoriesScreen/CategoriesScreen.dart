import 'package:flutter/material.dart';
import 'package:hackathon/Components/CategoryType.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
} 

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Categorias",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top:20, left:10, right: 10, bottom: 5),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: "Search"),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  CategoryType(
                    height: height,
                    width: width,
                    path: "assets/carniceria-icon.jpg",
                    typeTitle: "Carn",
                  ),
                  CategoryType(
                    height: height,
                    width: width,
                    path: "assets/pescado-icon.jpg",
                    typeTitle: "Peix",
                  ),
                ],
              ),
              Row(
                children: [
                  CategoryType(
                    height: height,
                    width: width,
                    path: "assets/bebidas-icon.jpg",
                    typeTitle: "Begudes",
                  ),
                  CategoryType(
                    height: height,
                    width: width,
                    path: "assets/frutas-icon.jpg",
                    typeTitle: "Fruites",
                  ),
                ],
              ),
              Row(
                children: [
                  CategoryType(
                    height: height,
                    width: width,
                    path: "assets/moda-icon.jpg",
                    typeTitle: "Calçat",
                  ),
                  CategoryType(
                    height: height,
                    width: width,
                    path: "assets/ropa-icon.jpg",
                    typeTitle: "Roba",
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
