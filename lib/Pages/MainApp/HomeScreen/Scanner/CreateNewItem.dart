import 'package:flutter/material.dart';

class CreateNewItem extends StatefulWidget {
  String barcode;
  CreateNewItem({Key key, this.barcode}) : super(key: key);

  @override
  _CreateNewItemState createState() => _CreateNewItemState();
}

class _CreateNewItemState extends State<CreateNewItem> {
  final _formKey = GlobalKey<FormState>();
  
  // Nom 
  // Descripcio
  // Puntuació (distancia - numeroSellos)


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Crear producte", style: TextStyle(color: Colors.black),),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(children: [
        Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Item amb codi de barres " + widget.barcode,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Nom del producte",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Email cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Breu descripció del producte",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Email cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
