import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      //스크롤 되게 하는 단일자녀스크롤뷰 위젯 
      //하위에 자식하나를 데려가고, 여기서는 Column을 데려가는 거임. 하위 자식을 스크롤 가능하게
      child: SingleChildScrollView( 
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                //이런 대괄호 안에 아까 summary에 추가한 내용이 들어간다.
                Text(((data['question_index'] as int) + 1).toString()),
                //확장 위젯, Row의 위젯으로 들어가는 거임.
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['user_answer'] as String),
                      Text(data['correct_answer'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
