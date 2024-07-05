import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  //상태전용 위젯을 확장하는 거임.
  //build가 아닌 상태를 생성하는 메서드임.
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState(); //주사위 생성 기능을 실행하는 부분
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2 ;

  void rollDice() {
    // 주사위 굴리기
    setState(() {//상태를 저장하고 사용자 인터페이스에도 적용하도록 
      currentDiceRoll = randomizer.nextInt(6)+1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      // 센터로 할건데 다중 칼럼으로 할거임. 중앙에 여러개 오도록, 아러면 이미지 아래로 텍스트 버튼이 존재하게 됨.
      mainAxisSize: MainAxisSize.min, //세로의 중앙으로
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png', //여기에 둠으로 
          width: 200,
        ),
        const SizedBox(height: 20), //특정크기의 상자를 만들어서 공백을 만듬
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(top: 20), // 이런식으로 padding을 하거나
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

//상태 전용 위젯은 결국 두 클래스로 나뉜다.
