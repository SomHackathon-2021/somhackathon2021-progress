import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hackathon/Services/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    bool _obscureText = true;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.yellow,
              Colors.orange,
            ])),
        child: ListView(children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(top: 40, bottom: 5, right: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                  child: Image(
                      width: 150, image: AssetImage('assets/leaficon.png')),
                ),
              ),
              Text(
                "L Commerce",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green[600],
                ),
              ),
              // Login Form
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          style: TextStyle(
                            color: Color(0xff25282C),
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 0),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Your email',
                            hintStyle: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF747679),
                                height: 0.6),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Register Button
              GestureDetector(
                onTap: () => AuthService().signInAnon(),
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  height: height * 0.06,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3)),
                    ],
                    color: Colors.orange[400],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      "Recuperar Contrassenya",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              // Go back button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  height: height * 0.06,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3)),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      "Tornar",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
