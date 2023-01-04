import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/signupWidget.dart';
import 'dart:ui';
import 'package:hexcolor/hexcolor.dart';
import 'sidebar.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      resizeToAvoidBottomInset: true,
      body: SignupW(),
    );
  }
}
