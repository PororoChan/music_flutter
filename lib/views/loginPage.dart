// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, unnecessary_const, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_flutter/models/adminModel.dart';
import 'package:music_flutter/presenters/loginPresenter.dart';
import 'package:music_flutter/contract/loginContract.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_flutter/views/homePage.dart';

class LoginPage extends StatelessWidget implements LoginContract {
  final GlobalKey<FormState> _form = GlobalKey();

  final _emailField = new TextEditingController();
  final _passField = new TextEditingController();
  final LoginPresenter loginpresenter = LoginPresenter();

  LoginPage() {
    loginpresenter.logincontract = this;
  }

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
                        fontFamily: 'Ubuntu',
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
                          fontFamily: 'Ubuntu',
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
                              "Email",
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white54,
                              ),
                            ),
                            TextFormField(
                              controller: _emailField,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Ubuntu'),
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white60,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintText: "Enter your Email",
                                hintStyle: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value == "") {
                                  return "Email can't be empty";
                                } else if (!value.contains("@")) {
                                  return "Email must contains @ characters";
                                }
                              },
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Text(
                              "Enter Password",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Ubuntu'),
                            ),
                            TextFormField(
                                controller: _passField,
                                obscureText: true,
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.password,
                                      color: Colors.white60,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(color: Colors.white)),
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return "Password must fill";
                                  } else if (value.length < 6) {
                                    return "Password must contain minimum 6 characters";
                                  }
                                  return null;
                                }),
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
                                    if (!_form.currentState!.validate()) {
                                      SnackBar(
                                        content: Text("Invalid Form Data"),
                                      );
                                    } else {
                                      String email = _emailField.text;
                                      String password = _passField.text;
                                      loginpresenter.login(email, password);
                                    }
                                  },
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                        fontFamily: 'Ubuntu',
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
                                        fontFamily: 'Ubuntu'),
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
        elevation: 5,
        color: Colors.transparent,
        child: Container(
          height: 150,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign In with :",
                style: TextStyle(
                    fontFamily: 'Ubuntu',
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
  void onLoginFailed(String message) {
    // TODO: implement onLoginFailed
    AlertDialog(
      title: Text("Login Auth"),
      content: Text("Authentication Failed"),
      actions: <Widget>[
        TextButton(
          onPressed: () {},
          child: Text("Cancel"),
        )
      ],
    );
  }

  @override
  void onLoginSuccess(Map dtLogin) {
    // TODO: implement onLoginSuccess
    loginpresenter.isAuth.value = true;
    loginpresenter.email.value = dtLogin['email'];
    loginpresenter.password.value = dtLogin['password'];
    Get.offNamed("/home");
  }
}
