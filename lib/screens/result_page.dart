import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String data = "";
  String data2 = "";
  String data3 = "";
  String data4 = "";
  @override
  Widget build(BuildContext context) {
    final screenheight = ScreenUtil.defaultSize.height;
    final screenwidth = ScreenUtil.defaultSize.width;
    final messageInsert = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Fluencia'),
        centerTitle: true,
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
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HexColor('#020024'),
              HexColor('#090979'),
              HexColor('#00d4ff'),
              // HexColor('#6dd5ed'),
            ],
            stops: const [0, 0.30, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(40.0, 100.0, 40.0, 0.0),
                    child: Text(
                      'Your Results',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 40.0,
                        width: 160,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.purpleAccent,
                          color: Colors.blueAccent,
                          elevation: 15.0,
                          child: GestureDetector(
                            //هي الفقسة
                            onTap: () async {
                              final url = "http://192.168.1.104:40222/speed";
                              final response3 =
                                  await http.get((Uri.parse(url)));
                              final decoded3 = json.decode(response3.body);
                              setState(() {
                                data3 = decoded3["response3"];
                              });
                              final url2 = 'http://192.168.1.104:40222/gm';
                              final response1 =
                                  await http.get((Uri.parse(url2)));
                              final decoded = json.decode(response1.body);

                              setState(() {
                                data = decoded["response"];
                              });

                              final url3 = 'http://192.168.1.104:40222/rep';
                              final response2 =
                                  await http.get((Uri.parse(url3)));
                              final decoded2 = json.decode(response2.body);

                              setState(() {
                                data2 = decoded2["response2"];
                              });
                              final url4 = 'http://192.168.1.104:40222/delay';
                              final response4 =
                                  await http.get((Uri.parse(url4)));
                              final decoded4 = json.decode(response4.body);

                              setState(() {
                                data4 = decoded4["response4"];
                              });
                            },
                            child: Center(
                              child: Text(
                                'Your result',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
// speed
                    Container(
                        height: screenheight * 0.1,
                        width: screenwidth * 0.95,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            data3,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87),
                          ),
                        )),

                    Divider(
                      height: 20,
                      color: Colors.pinkAccent[100],
                    ),
                    // gm
                    Container(
                        height: screenheight * 0.15,
                        width: screenwidth * 0.95,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            data,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        )),

                    Divider(
                      height: 20,
                      color: Colors.pinkAccent[100],
                    ),
                    //rep
                    Container(
                        height: screenheight * 0.2,
                        width: screenwidth * 0.95,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            data2,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        )),

                    Divider(
                      height: 20,
                      color: Colors.pinkAccent[100],
                    ),
                    Container(
                        height: screenheight * 0.15,
                        width: screenwidth * 0.95,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            data4,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        )),

                    Divider(
                      height: 20,
                      color: Colors.pinkAccent[100],
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
