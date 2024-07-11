import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    //요약목록: 모든행에 질문 인덱스를 표시하고, 질문이 제대로 답변이 되었는지를 보여줌.
    for (var i = 0; i < chosenAnswers.length; i++) {
      //loop body
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'uesr_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData(); //요약데이터 사용.
    final numTotalQuestions = questions.length;
    final numCoreectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['coreect_answer'];
    }).length; // 올바른 질문의 개수

    return SizedBox(
      width: double.infinity, //가능한 최대 너비
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $numCoreectQuestions out of $numTotalQuestions question correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
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
