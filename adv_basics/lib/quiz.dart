import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen;
  //var이 아닌 widget으로 해야함.
  //여기 Quiz state에서는 스위치 스크린에서 StartScreen에 겂으로 포인터를 전달하고 있다.
  //이제는 acticeScreen을 문자열로 해서 렌더링될때 실제 위젯으로 추론하게 만든다는거임

  List<String> selectedAnswers = []; // 선택된 답변들을 리스트로 모아두는 거임.

  var activeScreen = 'start-screen';

  /*
  @override
  void initState() { //상태를 초기화하는 구문. 한번실행되고 다시는 실행 안됨.
    //activeScreen = StartScreen(switchScreen);
    activeScreen = 'question-screen';
    super.initState();
  }
  */

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    //답변이 전부 입력되면 시작화면으로 돌아간다.상태 설정.
    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    //활성화면으로
    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnwers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : QuestionsScreen(
                  onSelectAnswer: chooseAnswer,
                ),
        ),
      ),
    );
  }
}
