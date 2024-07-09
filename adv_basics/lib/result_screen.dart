import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnwers});

  final List<String> chosenAnwers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];


    //요약목록: 모든행에 질문 인덱스를 표시하고, 질문이 제대로 답변이 되었는지를 보여줌. 
    for (var i = 0; i < chosenAnwers.length;) {
      //loop body
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'uesr_answer': chosenAnwers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, //가능한 최대 너비
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out of Y question correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            const Text('List of answers and questions...'),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
