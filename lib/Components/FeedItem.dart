import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  final asset;
  final name;
  final description;
  const FeedItem({Key key, this.asset, this.name, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/business-logo.jpg"),
              ),
              title: Text(this.name),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(this.description),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(this.asset),
            )
          ],
        ),
    );
  }
}
