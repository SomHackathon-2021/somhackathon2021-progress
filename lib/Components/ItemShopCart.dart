import 'package:flutter/material.dart';

class ItemShopCart extends StatelessWidget {
 
  final double height;
  final double width;
  final String name;
  final int items;
  final double price;
  final String asset;

  const ItemShopCart({Key key, this.height, this.width, this.name, this.items, this.price, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        height: this.height * 0.1,
        width: this.width,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.black))
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(asset),
                radius: 28,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(this.price.toString() + "€", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),),
                  Text(this.name, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),),
                  Text("Unidades: " + this.items.toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),),
                ],
              )
            ],
          ),
        ));
  }
}
