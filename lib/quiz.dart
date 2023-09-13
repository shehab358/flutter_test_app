import 'package:flutter/material.dart';
import 'package:test_app/data/questions.dart';
import 'package:test_app/questions.dart';
import 'package:test_app/startscreen.dart';
import 'package:test_app/results.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}
class _QuizState extends State<Quiz> {
  String? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = 'start-screen';
    super.initState();
  }

  void switchScreen(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void restartquiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void choosenAnswer (String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget =  QuestionsScreen(
        onSelectAnswer: choosenAnswer
        ); 
    } 

if (activeScreen == 'result-screen') {
  screenWidget =  Results(
    chosenAnswers: selectedAnswers,
    onRestrat: restartquiz,
    );
}

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 255, 17, 0),
                Color.fromARGB(255, 0, 3, 173)
              ]
            )
          ),
          child: screenWidget,
          ),
      ),
    );
  }
}