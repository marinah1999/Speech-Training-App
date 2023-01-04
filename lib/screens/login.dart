import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/loginWidget.dart';
import 'dart:ui';
import 'package:hexcolor/hexcolor.dart';
import 'sidebar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      resizeToAvoidBottomInset: true,
      body: LoginW(),
    );
  }
}
