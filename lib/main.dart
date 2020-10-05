import 'package:flutter/material.dart';
import 'home_page.dart';
import 'search.dart';
import 'activity/running.dart';
import 'package:quiztest/play_screen/quiz_game.dart';
import 'play_screen/end_quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white, backgroundColor: Colors.white),
      home: HomePage(),
    );
  }
}