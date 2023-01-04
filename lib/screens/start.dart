import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/carousal.dart';
// import 'package:flutter_voice/widgets/carousal.dart';
// import 'package:flutter_voice/widgets/main_color.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'login.dart';

import 'dart:ui';

import '../constant.dart';

// import 'package:speech_app/widgets/carousal.dart';

class startPage extends StatefulWidget {
  @override
  _startPageState createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Center(
              child: Text(
                ' Fluencia ',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Montserrat',
                ),
              ),
            )),
        resizeToAvoidBottomInset: true,
        body: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/wp9530753.jpg'),
            )),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomCarousel(),
                  Container(
                      padding:
                          EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30.0),
                          Container(
                              height: 40.0,
                              width: 160,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.purpleAccent,
                                color: Colors.amber,
                                elevation: 15.0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/chatbot');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(
                                        kDefaultPadding * 0.55), // 15
                                    decoration: BoxDecoration(
                                      gradient: kPrimaryGradient,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Text(
                                      " Chatbot",
                                      style: Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(height: 30.0),
                          Container(
                              height: 40.0,
                              width: 160,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.purpleAccent,
                                color: Colors.amber,
                                elevation: 15.0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('/recording_page');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(
                                        kDefaultPadding * 0.55), // 15
                                    decoration: BoxDecoration(
                                      gradient: kPrimaryGradient,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Text(
                                      " Record Your Voice",
                                      style: Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(height: 30.0),
                          Container(
                              height: 40.0,
                              width: 160,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.purpleAccent,
                                color: Colors.amber,
                                elevation: 15.0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('/main_exercise_page');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(
                                        kDefaultPadding * 0.55), // 15
                                    decoration: BoxDecoration(
                                      gradient: kPrimaryGradient,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Text(
                                      " Start Practice",
                                      style: Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      )),
                ])));
  }
}
