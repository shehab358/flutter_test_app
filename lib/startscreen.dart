import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startTest, {super.key});

final void Function() startTest;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: const Color.fromARGB(156, 255, 255, 255),
            width: 300 ,
            ),
            const SizedBox(
              height: 20
              ),
             Text(
              'Learn Flutter The Fun Way',
              style: GoogleFonts.lato(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
              ),
              const SizedBox(
                height: 30
                ),
                OutlinedButton.icon(
                  onPressed: (){
                    startTest();
                  },
                   label: const Text(
                    'START',
                    style: TextStyle(
                      color: Colors.white
                    ),
                   ),
                   icon: const Icon(
                    Icons.arrow_forward_sharp,
                   color: Colors.white,
                   ) ,
                   )
        ],
      )
        );
  }
}