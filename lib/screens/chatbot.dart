import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';

class ChatBotPage extends StatefulWidget {
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  String text = "";
  final FlutterTts flutterTts = FlutterTts(); //1
  String final_response =
      ""; //will be displayed on the screen once we get the data from the server
  String final_response2 = "";
  String response = "";

  final _formkey =
      GlobalKey<FormState>(); //key created to interact with the form

  //function to validate and save user form
  Future<void> _savingData() async {
    final validation = _formkey.currentState!.validate();

    if (!validation) {
      return;
    }
    _formkey.currentState!.save();
  }

  void responses(query) async {
    setState(() {});
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = [];

  @override
  Widget build(BuildContext context) {
    void _onpressed() {
      if (messageInsert.text.isEmpty) {
        print("empty message");
      } else if (messageInsert.text == "help") {
        setState(() {
          messageInsert.clear();
        });
      } else {
        setState(() {
          messsages.insert(0, {"data": 1, "message": messageInsert.text});
        });
        responses(messageInsert.text);
        messageInsert.clear();
      }
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    void _onpressedd() {
      if (messageInsert.text.isEmpty) {
        print("empty message");
      } else if (messageInsert.text == "help") {
        setState(() {
          messageInsert.clear();
        });
      } else {
        setState(() {
          messsages.insert(0, {"data": 0, "message": messageInsert.text});
        });
        responses(messageInsert.text);
        messageInsert.clear();
      }
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    Future _speak(String text) async {
      await flutterTts.getLanguages;
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Center(
            child: Text(
              ' Fluencia bot                                 ',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          )),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'images/beautiful-color-ui-gradients-backgrounds-royal.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                          messsages[index]["message"].toString(),
                          messsages[index]["data"],
                        ))),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    splashColor: Colors.white12,
                    onTap: () {
                      messageInsert.text = "";
                      _onpressed();
                    },
                    child: Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigoAccent),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Center(
                        child: Text(
                          " Record Your Voice",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 5.0,
              color: Colors.indigoAccent,
            ),
            Container(
              child: ListTile(
                title: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                  padding: EdgeInsets.only(left: 15),
                  child: Form(
                    key: _formkey,
                    child: TextFormField(
                      controller: messageInsert,
                      decoration: InputDecoration(
                        hintText: "Enter a Message...",
                        hintStyle: TextStyle(color: Colors.black26),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      onChanged: (value) {},
                      onSaved: (value) {
                        text = value.toString();
                      },
                    ),
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 30.0,
                      color: Colors.indigoAccent,
                    ),
                    onPressed: () async {
                      //validating the form and saving it
                      _savingData();
//url to send the post request to
                      final url = 'http://192.168.1.104:40222/chatbot';
//sending a post request to the url
                      final response = await http.post((Uri.parse(url)),
                          body: json.encode({'text': text}));
                      //sending a get request to the url
                      final response2 = await http.get((Uri.parse(url)));
                      //converting the fetched data from json to key value pair that can be displayed on the screen
                      final decoded =
                          json.decode(response.body) as Map<String, dynamic>;

                      Map<String, dynamic> decoded2 =
                          json.decode(response2.body);

                      List<dynamic> data = decoded2["response"];
                      //changing the UI be reassigning the fetched data to final response

                      setState(() {
                        messageInsert.text = final_response = decoded['text'];
                        _onpressed();
                        messageInsert.text = final_response2 = data[0];
                        _speak(final_response2);
                        _onpressedd();
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment:
            data == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 1
              ? Container(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('images/user.jpg'),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(15.0),
                color: data == 0 ? Colors.indigoAccent : Colors.white10,
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Column(
                          children: [
                            Text(
                              message,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                )),
          ),
          data == 0
              ? Container(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('images/robot1.jpg'),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
