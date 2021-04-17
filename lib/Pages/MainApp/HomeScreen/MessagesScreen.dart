import 'package:flutter/material.dart';
import 'package:hackathon/Pages/MainApp/HomeScreen/ChatScreen.dart';

class MessagesScreen extends StatefulWidget {
  MessagesScreen({Key key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
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
          "Conversations",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
          child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 5),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 1))
                ]),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                  hintText: "Search"),
            ),
          ),
          MessageItem(
            path: "assets/bebidas-icon.jpg",
            name: "Bebidas San José",
            lastMessage: "Todo ok!",
            lastSeen: "Today",
            chatId: "J6W78D9F",
            isRead: true,
          ),
          MessageItem(
            path: "assets/carniceria-icon.jpg",
            name: "Carnica Juan",
            lastMessage: "Todo ok!",
            lastSeen: "31 November",
            chatId: "J6W78D9F",
            isRead: false,
          ),
          MessageItem(
            path: "assets/business-logo.jpg",
            name: "Ropa Rosa",
            lastMessage: "Todo ok!",
            lastSeen: "2 June",
            chatId: "J6W78D9F",
            isRead: true,
          ),
          MessageItem(
            path: "assets/ropa-icon.jpg",
            name: "Calzado Enrique",
            lastMessage: "Todo ok!",
            lastSeen: "28 Abril",
            chatId: "J6W78D9F",
            isRead: false,
          ),
          
        ],
      )),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String path;
  final String name;
  final String lastMessage;
  final String lastSeen;
  final String chatId;
  final bool isRead;

  const MessageItem(
      {Key key,
      this.name,
      this.lastSeen,
      this.lastMessage,
      this.path,
      this.chatId,
      this.isRead})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatScreen(id: chatId, shopId: "182712893", path: path, name: name);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(path),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(lastMessage ,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: isRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(lastSeen,style: TextStyle(fontSize: 12,fontWeight: isRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}
