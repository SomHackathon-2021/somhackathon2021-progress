import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({Key key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool shopNotification = false;
  bool sendNotification = false;
  bool discountNotification = true;

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
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
            child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text("Compra"),
                leading: Icon(Icons.shopping_bag_outlined),
                trailing: Checkbox(
                    value: shopNotification,
                    onChanged: (value) {
                      setState(() {
                        shopNotification = value;
                      });
                    }),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Envio"),
                leading: Icon(Icons.local_shipping_outlined),
                trailing: Checkbox(
                    value: shopNotification,
                    onChanged: (value) {
                      setState(() {
                        discountNotification = value;
                      });
                    }),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Descuento"),
                leading: Icon(Icons.attach_money),
                trailing: Checkbox(
                    value: shopNotification,
                    onChanged: (value) {
                      setState(() {
                        shopNotification = value;
                      });
                    }),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
