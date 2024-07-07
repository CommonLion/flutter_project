//사용자 지정 시작 스크린

//화면이 변하는 것이 아니니까 StatefulWidget이 아닌 StateelssWidget을 사용하는 것이 맞다.
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key}); 
  //생성자의 매개변수로 startQuiz라는 함수를 넘겨 주는데. 

  final void Function() startQuiz;
  //버튼이 눌리면 해당 startQuiz하는 해당 위젯으로 스위치되는 느낌으로..
  //startScreen 위젯에서

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity( //투명도 설정을 하는 것 보다 ARGB에서 투명도를 낮추는 것을 선호한다. 
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          Image.asset(
            'assets/images/quiz-logo.png',
             width: 300,
             color: const Color.fromARGB(150, 255, 255, 255)
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Fultter the fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              //child가 아닌 labe을 사용해야함..
              onPressed: () {
                startQuiz();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,

                  
              ),
              icon:
                  const Icon(Icons.arrow_right_alt), //이미 저장되어있는 아이콘 사용해서아이콘 만들기
              label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
