import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summary, {super.key,});

    final List<Map<String, Object>> summary;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: 
           summary.map((data){
              return Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
 
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                      
                          ),
                      ),
                      const SizedBox(width: 10,)
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['Question'] as String,
                        style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                        ),
                        const SizedBox(height: 5),
                        Text(data['user_answer'] as String,
                        style: GoogleFonts.tajawal(
                          color: const Color.fromARGB(184, 0, 238, 255),
                          fontSize: 15
                        ),
                        
                        ),
                        const SizedBox(height: 5),
                        Text(data['correct_answer'] as String,
                        style: GoogleFonts.tajawal(
                          color: const Color.fromARGB(255, 68, 255, 0) ,
                          fontSize: 15          
                           ),),
                        const SizedBox(height: 5),
                  
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
          
        ),
      ),
    );
  }
}