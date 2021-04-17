import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          "Information",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
          child: Container(
            child: Text(
              "Benvinguts a la nostra aplicació de la sóm hackathon desenvolupada per l'equip de progress!"
            ),
          ),
      ),
    );
  }
}