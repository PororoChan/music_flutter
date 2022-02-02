// ignore_for_file: unnecessary_const, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_flutter/views/addFormPage.dart';
import 'package:music_flutter/views/homePage.dart';
import 'package:music_flutter/views/loginPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/home",
    routes: <String, WidgetBuilder> {
      "/login": (context) => LoginPage(),
      "/home": (context) => HomePage(),
    },
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
