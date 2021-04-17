import 'package:flutter/material.dart';
import 'package:hackathon/Services/database.dart';
import 'dart:ui';

import 'package:hackathon/Services/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final AuthService _auth = AuthService();
  String error = "";
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController nameRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController = TextEditingController();
  UsersDatabase database = new UsersDatabase();
  bool isB2b = false;
  
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
   

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
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Enter a Name";
                            } else {
                              return null;
                            }
                          },
                          controller: nameRegisterController,
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
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.red)),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Your name',
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
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Enter an email";
                            }else{
                              return null;
                            }
                          },
                          controller: emailRegisterController,
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
                                borderRadius: BorderRadius.circular(20),
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
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(children: [
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter a password";
                              }else{
                                return null;
                              }
                            },
                            controller: passwordRegisterController,
                            obscureText: _obscureText,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Color(0xff25282C),
                            ),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
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
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.red)),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
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
                        ]),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("En cas de ser empresa marca aquesta opció", style: TextStyle(color: Colors.green[600], fontWeight: FontWeight.normal),),
                        value: isB2b,
                        checkColor: Colors.orange,
                        activeColor: Colors.yellow,
                        onChanged: (value) {
                        setState(() {
                          if(value){
                            isB2b = true;
                          }                        
                        });
                      }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
              // Register Button
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(emailRegisterController.text, passwordRegisterController.text);
                    if(result == null){
                      setState(() {
                        error = "please suply a valid email";
                      }
                      );
                    }else{
                      database.createUser(nameRegisterController.text, emailRegisterController.text, isB2b);
                      Navigator.pop(context);
                    }
                  } else {
                    print("invalid");
                  }
                },
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
                      "Register",
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
                      "Go back",
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
