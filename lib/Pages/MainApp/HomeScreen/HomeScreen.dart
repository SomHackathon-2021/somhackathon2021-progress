import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hackathon/Components/FeedItem.dart';
import 'package:hackathon/Pages/MainApp/HomeScreen/Scanner/ProductInfoScreen.dart';
import 'package:hackathon/Pages/MainApp/HomeScreen/MessagesScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String barcode = "Unknown";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.camera_alt_outlined, color: Colors.black),
              onPressed: () => scanBarcorde()),
          title: Text("Home", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.message,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MessagesScreen()));
                }),
            SizedBox(
              width: 5,
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              child: Expanded(
                flex: 1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    StoryItem(
                      asset: "assets/bebidas-icon.jpg",
                    ),
                    StoryItem(
                      asset: "assets/carniceria-icon.jpg",
                    ),
                    StoryItem(
                      asset: "assets/frutas-icon.jpg",
                    ),
                    StoryItem(
                      asset: "assets/moda-icon.jpg",
                    ),
                    StoryItem(
                      asset: "assets/ropa-icon.jpg",
                    ),
                    StoryItem(
                      asset: "assets/bebidas-icon.jpg",
                    ),
                    StoryItem(
                      asset: "assets/carniceria-icon.jpg",
                    ),
                    StoryItem(
                      asset: "assets/frutas-icon.jpg",
                    ),
                    StoryItem(
                      asset: "assets/moda-icon.jpg",
                    ),
                    StoryItem(
                      asset: "assets/ropa-icon.jpg",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child: ListView(
                  children: [
                    FeedItem(
                      asset: "assets/carniceria-icon.jpg",
                      description: "Ya tenemos carne de calidad disponible!",
                      name: "Carniceria San José",
                    ),
                    FeedItem(
                      asset: "assets/frutas-icon.jpg",
                      description: "Ya tenemos fruta de calidad disponible!",
                      name: "Fruteria Rosa",
                    ),
                    FeedItem(
                      asset: "assets/moda-icon.jpg",
                      description: "Ya tenemos zapatos de calidad disponible!",
                      name: "Moda la Reina",
                    ),
                    FeedItem(
                      asset: "assets/ropa-icon.jpg",
                      description: "Ya tenemos ropa de calidad disponible!",
                      name: "Zara Progre",
                    ),
                  ],
                ))
          ],
        ));
  }

  Future<void> scanBarcorde() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      if (!mounted) {
        return;
      } else {
        setState(() {
          this.barcode = barcode;
          if (barcode == "-1") {
            return;
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductInfoScreen(
                          id: barcode,
                        )));
          }
        });
      }
    } on PlatformException {
      barcode = "Failed to get platform version";
    }
  }
}

class StoryItem extends StatelessWidget {
  final String asset;
  const StoryItem({Key key, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 0, left: 0),
      child: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(asset),
      ),
    );
  }
}
