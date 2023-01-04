import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/resultButton.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/widgets/description_text_widget.dart';
import 'package:flutter_application_1/widgets/text_w.dart';
import 'package:hexcolor/hexcolor.dart';

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String text2 = "";
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    void setState(Null Function() param0) {}
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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/result_page');
                },
                icon: Icon(Icons.arrow_forward)),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: _isListening,
          glowColor: Theme.of(context).primaryColor,
          endRadius: 75.0,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            backgroundColor: Colors.purple[100],
            splashColor: Colors.amber,
            onPressed: () async {
              //_startTimer();
              _listen();

              final url = 'http://192.168.1.104:40222/voicerecorder';
              //sending a post request to the url
              final response = await http.post((Uri.parse(url)),
                  body: json.encode({'text': text2}));
            },
            child: Icon(
              _isListening ? Icons.mic : Icons.mic_none,
            ),
          ),
        ),
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
                stops: const [0, 0.40, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                w(),
                Description(),
                SizedBox(
                  height: 2,
                ),

                // SizedBox(
                //   height: 40,
                // ),
                ResultButton(),
              ],
            )));
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            text2 = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
