import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
    //currentQuestionIndex = currentQuestionIndex +1;
    setState(() {
      currentQuestionIndex++;
      //if (currentQuestionIndex == questions.length) currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
        width: double.infinity, //가능한 최대 너비
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //전체 열의 가로로 너비를 채우는 거임.
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ...currentQuestion.getShuffledAnswer().map((answer) {
                  return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      //익명함수로 작동해야 함수가 실행된다.
                      answerQuestion(answer);
                    },
                  );
                }),
                //아래처럼 하드 코딩하지 않고, 위의 코드가 쉼표로 리스트를 나열하는 역할을 한다는 거임.
              ]),
        ));
  }
}
