import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:hexcolor/hexcolor.dart';
import 'sidebar.dart';

class MyCardPage extends StatefulWidget {
  @override
  _MyCardPageState createState() => _MyCardPageState();
}

class _MyCardPageState extends State<MyCardPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // actions: [
            //   IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
            // ],
            // title: Center(
            //   child: Text(
            //     ' Fluencia ',
            //     style: TextStyle(
            //       fontSize: 25.0,
            //       fontWeight: FontWeight.bold,
            //       fontStyle: FontStyle.italic,
            //       fontFamily: 'Montserrat',
            //       color: Colors.white,
            //     ),
            //   ),
            // )
          ),
          body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    HexColor('#020024'),
                    HexColor('#090979'),
                    HexColor('#00d4ff'),
                    // HexColor('#6dd5ed'),
                  ],
                  stops: const [0, 0.40, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(100.0, 150.0, 80.0, 0.0),
                    child: Stack(
                      children: const <Widget>[
                        CircleAvatar(
                          radius: 80.0,
                          backgroundImage:
                              AssetImage('images/photo6035299808710866580.jpg'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(100.0, 0.0, 80.0, 0.0),
                      child: Image.asset(
                        'images/fluencia kitabe white (2).png',
                        fit: BoxFit.fill,
                      )),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(100.0, 0.0, 80.0, 0.0),
                      child: Center(
                        child: Text(
                          'version 1.0.0',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      )),
                  Divider(
                    height: 20,
                    color: Colors.amber,
                  ),
                  SizedBox(height: 20),
                  Container(
                      height: 50,
                      width: 250,
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 15.0,
                        color: Colors.white70,
                        // margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        child: ListTile(
                          leading: Icon(
                            Icons.phone,
                            color: Colors.lightGreen[700],
                          ),
                          title: Text(
                            '+963996961815',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[300],
                              fontFamily: 'Montserrat',
                              fontSize: 17,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 12),
                  Container(
                    height: 50,
                    width: 250,
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      elevation: 15.0,
                      color: Colors.white70,
                      // child: Padding(
                      //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.blue[500],
                        ),
                        title: Text(
                          'Fluencia@gmail.com',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[300],
                            fontFamily: 'Montserrat',
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
        ));
  }
}
