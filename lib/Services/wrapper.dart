import 'package:flutter/material.dart';
import 'package:hackathon/Models/UserModel.dart';
import 'package:hackathon/Pages/Login/LoginScreen.dart';
import 'package:hackathon/Pages/MainApp/NavBarController.dart';
import 'package:hackathon/Services/database.dart';
import 'package:provider/provider.dart';

 
class Wrapper extends StatelessWidget {

  UsersDatabase database = new UsersDatabase();
  
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<UserModel>();
    if (firebaseUser == null) {
      return LoginScreen();
    } else {
      return NavBarController();
    }
  }
}