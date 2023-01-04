import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'breath_videos/breath1_vid_player.dart';
import 'breath_videos/breath2_vid_player.dart';
import 'breath_videos/breath3_vid_player.dart';
import 'breath_videos/breath4_vid_player.dart';
import 'breath_videos/flix1_vid_player.dart';
import 'breath_videos/flix2_vid_player.dart';

import 'breath_videos/intro_vid_player.dart';
import 'screens/quiz/quiz_screen.dart';

import 'screens/score/score_screen.dart';

import 'screens/main_ex_page.dart';

import 'screens/welcome/welcome_screen.dart';

import 'widgets/cat.dart';
import 'screens/details_screen.dart';

import 'screens/chatbot.dart';
import 'screens/main_ex_page.dart';
import 'screens/mycard.dart';
import 'screens/recording_page.dart';
import 'screens/result_page.dart';
import 'screens/signup.dart';
import 'screens/start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => SignupPage(),
        '/mycard': (BuildContext context) => MyCardPage(),
        '/login': (BuildContext context) => MyHomePage(),
        '/chatbot': (BuildContext context) => ChatBotPage(),
        '/main_exercise_page': (BuildContext context) => MainExercisePage(),
        '/result_page': (BuildContext context) => ResultPage(),
        '/start': (BuildContext context) => startPage(),
        '/recording_page': (BuildContext context) => SpeechScreen(),
        '/breath1_vid_player': (BuildContext context) => AssetPlayerWidget(),
        '/breath2_vid_player': (BuildContext context) => AssetPlayerWidget2(),
        '/breath3_vid_player': (BuildContext context) => AssetPlayerWidget3(),
        '/breath4_vid_player': (BuildContext context) => AssetPlayerWidget4(),
        '/intro_vid_player': (BuildContext context) => AssetPlayerWidget5(),
        '/flix1_vid_player': (BuildContext context) => AssetPlayerWidget6(),
        '/flix2_vid_player': (BuildContext context) => AssetPlayerWidget7(),
        '/welcome_screen': (BuildContext context) => WelcomeScreen(),
        '/main_ex_page': (BuildContext context) => MainExercisePage(),
        '/quiz_screen': (BuildContext context) => QuizScreen(),
        '/score_screen': (BuildContext context) => ScoreScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
