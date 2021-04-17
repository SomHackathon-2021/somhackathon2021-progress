import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Models/UserModelFirebase.dart';
import 'package:hackathon/Pages/MainApp/ProfileScreen/ProfileChilds/HelpScreen.dart';
import 'package:hackathon/Pages/MainApp/ProfileScreen/ProfileChilds/InformationScreen.dart';
import 'package:hackathon/Pages/MainApp/ProfileScreen/ProfileChilds/Notifiations.dart';
import 'package:hackathon/Services/database.dart';
import 'package:hackathon/Services/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthService _authService = new AuthService();

  UsersDatabase database = new UsersDatabase();
  UserModelFirestore user;

  Future<UserModelFirestore> _getUsername() async {
    UserModelFirestore usermodel =
        await database.getUserData().then((value) => user = value);
    return usermodel;
  }

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                onPressed: () => _authService.signOut()),
          ],
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Perfil",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: FutureBuilder<UserModelFirestore>(
                future: _getUsername(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.62,
                      margin: EdgeInsets.only(top: 60, right: 30, left: 30),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset: Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.settings),
                                    onPressed: null),
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage("assets/frutas-icon.jpg"),
                                ),
                                IconButton(
                                    icon: Icon(Icons.edit), onPressed: null),
                              ],
                            ),
                          ),
                          Center(
                            child: Text(
                              snapshot.data.name,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text("Compras recientes"),
                              leading: Icon(Icons.shopping_bag_outlined),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text("Perfil"),
                              leading: Icon(Icons.person),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NotificationsScreen()));
                            },
                            child: Card(
                              child: ListTile(
                                title: Text("Notificaciones"),
                                leading: Icon(Icons.notifications),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text("Compartir"),
                              leading: Icon(Icons.share),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HelpScreen()));
                            },
                            child: Card(
                              child: ListTile(
                                title: Text("Ayuda"),
                                leading: Icon(Icons.help),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InformationScreen()));
                            },
                            child: Card(
                              child: ListTile(
                                title: Text("Info"),
                                leading: Icon(Icons.info_outline_rounded),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text("Loading data..."),
                    );
                  }
                })));
  }
}

/*
Container(
           height: MediaQuery.of(context).size.height*0.6,
           margin: EdgeInsets.only(top: 60, right:30, left:30),
           decoration: BoxDecoration(
             boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 10,
              blurRadius: 7,
              offset: Offset(0, 3)
            )
          ],
             borderRadius: BorderRadius.circular(20),
             color: Colors.white,
           ),
           child: ListView(
             children: [
               Container(
                 margin: EdgeInsets.all(10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     IconButton(icon: Icon(Icons.settings), onPressed: null),
                     CircleAvatar(
                       radius: 35,
                       backgroundColor: Colors.white,
                       backgroundImage: AssetImage("assets/frutas-icon.jpg"),
                     ),
                     IconButton(icon: Icon(Icons.edit), onPressed: null),
                   ],
                 ),
               ),
               Center(
                 child: Text(user.name, style: TextStyle(color: Colors.grey, fontSize: 20),),
               ),
               Card(
                 child: ListTile(
                   title: Text("Compras recientes"),
                   leading: Icon(Icons.shopping_bag_outlined),
                   trailing: Icon(Icons.arrow_forward_ios),
                 ),
               ),
               
               Card(
                 child: ListTile(
                   title: Text("Perfil"),
                   leading: Icon(Icons.person),
                   trailing: Icon(Icons.arrow_forward_ios),
                 ),
               ),
               
               Card(
                 child: ListTile(
                   title: Text("Notificaciones"),
                   leading: Icon(Icons.notifications),
                   trailing: Icon(Icons.arrow_forward_ios),
                 ),
               ),
               Card(
                 child: ListTile(
                   title: Text("Compartir"),
                   leading: Icon(Icons.share),
                   trailing: Icon(Icons.arrow_forward_ios),
                 ),
               ),
               Card(
                 child: ListTile(
                   title: Text("Ayuda"),
                   leading: Icon(Icons.help),
                   trailing: Icon(Icons.arrow_forward_ios),
                 ),
               ),
               Card(
                 child: ListTile(
                   title: Text("Info"),
                   leading: Icon(Icons.info_outline_rounded),
                   trailing: Icon(Icons.arrow_forward_ios),
                 ),
               ),
             ],
           ),
         ),
       )
       */
