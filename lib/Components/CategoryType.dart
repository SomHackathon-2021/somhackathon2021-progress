import 'package:flutter/material.dart';
 
class CategoryType extends StatelessWidget {

  final double height;
  final double width;
  final String path;
  final String typeTitle;

  const CategoryType({Key key, this.height, this.width, this.path, this.typeTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        height: this.height * 0.3,
        width: this.width * 0.44,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.19),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(this.path),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.15), BlendMode.multiply),
          ),
        ),
        child: Center(
          child: Text(
            typeTitle,
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
