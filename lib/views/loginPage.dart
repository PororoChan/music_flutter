// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, unnecessary_const, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_flutter/coloring.dart';
import 'package:music_flutter/models/adminModel.dart';
import 'package:music_flutter/presenters/adminPresenter.dart';
import 'package:music_flutter/contract/adminContract.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_flutter/views/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements AdminContract {
  final GlobalKey<FormState> _form = GlobalKey();

  final _unameField = new TextEditingController();
  final _passField = new TextEditingController();

  AdminPresenter adminPresenter = AdminPresenter();

  Coloring color = Coloring();

  _LoginPageState() {
    adminPresenter.adminContract = this;
    adminPresenter.loadData();
  }

  List<Admin> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.lightBlue, Colors.lightGreen]),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(65),
                      topRight: Radius.circular(45)),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Proton',
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Welcome, come and Log In",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 26,
                          fontFamily: 'Proton',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Form(
                      key: _form,
                      child: Container(
                        margin: EdgeInsets.only(right: 55),
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 50.0, 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Username",
                              style: TextStyle(
                                fontFamily: 'Proton',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white54,
                              ),
                            ),
                            TextFormField(
                              controller: _unameField,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Proton'),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintText: "Enter username",
                                hintStyle: TextStyle(
                                  fontFamily: 'Proton',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Proton'),
                            ),
                            TextFormField(
                              controller: _passField,
                              obscureText: true,
                              style: TextStyle(
                                fontFamily: 'Proton',
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  hintText: "Enter Password",
                                  hintStyle: TextStyle(color: Colors.white)),
                            ),
                            SizedBox(
                              height: 75.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                RaisedButton(
                                  hoverColor: Colors.white,
                                  hoverElevation: 0,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 35, vertical: 15.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(color: Colors.white)),
                                  color: Colors.transparent,
                                  elevation: 0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  },
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                        fontFamily: 'Proton',
                                        color: Colors.white,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 35.0,
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Create an account",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white54,
                                        decorationThickness: 1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Proton'),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          height: 150,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              boxShadow: <BoxShadow>[
                BoxShadow(blurRadius: 1, color: Colors.white70)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign In with :",
                style: TextStyle(
                    fontFamily: 'Proton',
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    child: FlatButton(
                      padding: EdgeInsets.all(8),
                      onPressed: () {},
                      splashColor: Colors.white30,
                      shape: CircleBorder(),
                      child: IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.white,
                        ),
                        iconSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.purpleAccent,
                    child: FlatButton(
                      padding: EdgeInsets.all(8),
                      splashColor: Colors.white30,
                      color: Colors.transparent,
                      onPressed: () {},
                      shape: CircleBorder(),
                      child: IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                        ),
                        iconSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                    child: FlatButton(
                      padding: EdgeInsets.all(8),
                      splashColor: Colors.white30,
                      color: Colors.transparent,
                      onPressed: () {},
                      shape: CircleBorder(),
                      child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onAddFailed(String message) {
    print(message);
  }

  @override
  void onAddSuccess(List<Admin> admin) {
    data = admin;
  }
}
