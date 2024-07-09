import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            //이런 대괄호 안에 아까 summary에 추가한 내용이 들어간다.
            Text(((data['question'] as int) + 1).toString()),
            Column(
              children: [
                Text(data['question'] as String),
                const SizedBox(
                  height: 5,
                ),
                Text(data['user_answer'] as String),
                Text(data['correct_answer'] as String),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
