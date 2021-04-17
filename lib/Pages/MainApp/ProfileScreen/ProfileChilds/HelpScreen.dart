import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key key}) : super(key: key);

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
          "Help",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
          child: Container(
            child: TextButton(
            onPressed: (){}, child: Text("Enviar solicitud"),),
          ),
      ),
    );
  }
}