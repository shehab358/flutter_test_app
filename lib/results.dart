import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/data/questions.dart';
import 'package:test_app/questions_summary.dart';


class Results extends StatelessWidget {
  const Results({
    Key? key,
    required this.chosenAnswers, required this.onRestrat,
  }) : super(key: key);

  final List<String> chosenAnswers;
  final void Function() onRestrat;
  
  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'Question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numTotalQuestions =questions.length;
    final numcorrectQuestions = summaryData.where(
      (data) => data['user_answer'] == data['correct_answer']
      ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Text('You Answerd $numcorrectQuestions out of $numTotalQuestions Questions Correctly!',
           style: GoogleFonts.rubik(
            color: const Color.fromARGB(192, 255, 255, 255),
            fontSize: 20,
           ),
           ),
            const SizedBox(height: 30),
            QuestionSummary(getSummary()),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: (){
                onRestrat();
              },
               icon: const Icon(
                Icons.replay_outlined,
                color: Colors.white,
                ),
                label:const Text (
                  'Restart Quiz!',
                style: TextStyle(
                  color: Colors.white
                ),
                )
               )
          ],
        ),
      ),
    );
  }
}