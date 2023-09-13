import 'package:flutter/material.dart';
import 'package:test_app/components/answer_button.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

var questionIndex = 0;

void answerQeustion (String selectedAnswers){
  widget.onSelectAnswer(selectedAnswers);
  setState(() {
    questionIndex ++;
  });
}

  @override
  Widget build(BuildContext context) {
final currtentQuestion = questions[questionIndex];

    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              currtentQuestion.text,
              style: GoogleFonts.poppins(
                color : const Color.fromARGB(184, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
              ),
            const SizedBox(
              height: 30
              ),
              ...currtentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                  answerText: answer,
                   onTap: (){
                      answerQeustion(answer);
                   }
                   );
              }),  
          ],
        ),
      ),
    );
  }
}