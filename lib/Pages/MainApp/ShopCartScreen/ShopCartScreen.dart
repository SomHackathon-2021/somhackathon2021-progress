import 'package:flutter/material.dart';
import 'package:hackathon/Components/ItemShopCart.dart';
import 'package:hackathon/Models/UserModelFirebase.dart';
import 'package:hackathon/Services/database.dart';

class ShopCartScreen extends StatefulWidget {
  ShopCartScreen({Key key}) : super(key: key);

  @override
  _ShopCartScreenState createState() => _ShopCartScreenState();
} 

class _ShopCartScreenState extends State<ShopCartScreen> {
  int articulos = 6;
  double precio = 44.5;

  UsersDatabase database = new UsersDatabase();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "Pagar",
                  style: TextStyle(color: Colors.white),
                ))
          ],
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Carro",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column(children: [
          Container(
            height: height * 0.05,
            color: Colors.white,
            child: Center(
              child: Text(
                articulos.toString() +
                    " Articles: Total (sense enviament)) " +
                    precio.toString() +
                    "€",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ItemShopCart(
                  height: height,
                  width: width,
                  items: 2,
                  price: 23.2,
                  name: "Carn de qualitat",
                  asset: "assets/carniceria-icon.jpg",
                ),
                ItemShopCart(
                    height: height,
                    width: width,
                    items: 4,
                    price: 3.2,
                    name: "Sabates noves",
                    asset: "assets/moda-icon.jpg"),
                ItemShopCart(
                    height: height,
                    width: width,
                    items: 1,
                    price: 54.2,
                    name: "Fruita",
                    asset: "assets/frutas-icon.jpg"),
                ItemShopCart(
                    height: height,
                    width: width,
                    items: 2,
                    price: 23.2,
                    name: "Vi Priorat",
                    asset: "assets/bebidas-icon.jpg"),
                ItemShopCart(
                    height: height,
                    width: width,
                    items: 3,
                    price: 55.2,
                    name: "Camisa",
                    asset: "assets/ropa-icon.jpg"),
                GestureDetector(
                  onTap: () async{
                    
                  },
                                  child: Container(
                    margin: EdgeInsets.only(top: 30, bottom: 10, right: 50, left: 50),
                    height: height * 0.06,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3)),
                      ],
                      color: Colors.orange[400],
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                      child: Text(
                        "Pay",
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
        ]));
  }

  List<Widget> _printArticles(double height, double width) {
    List<Widget> articlesList = [];

    for (var i = 0; i < articulos; i++) {
      articlesList.add(ItemShopCart(
        height: height,
        width: width,
        items: 2,
        price: 23.2,
        name: "Item",
      ));
    }

    return articlesList;
  }
}
