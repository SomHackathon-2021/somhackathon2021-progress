import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({Key key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 500,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Shop 1", style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Text("Shop photos"),
            ),
            height: 310,
            width: 260,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                ),
                child: Center(
                  child: IconButton(
                    alignment: Alignment.center,
                    iconSize: 60,
        
                    icon: Icon(Icons.favorite,), onPressed: ()=>{
                    print("like")
                  }),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  iconSize: 60,
                  icon: Icon(Icons.not_interested_rounded), onPressed: ()=>{
                  print("dislike")
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}