import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';
//import 'package:first_app/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.topRight;

// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key,  required this.colors});

//   final List<Color> colors;

//   @override
//   Widget build(context) {
//     return Container(
//       //클래스는 위젠을 반환하도록
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: colors,
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyledText('Hello World!'),
//       ),
//     );
//   }
// }

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  //두번째 생성자를 만들거임,
  const GradientContainer.purple({super.key})
      : color1 = Colors.purple,
        color2 = Colors.indigo;

  final Color color1;
  final Color color2;

//다이스의 이미지가 변하기를 원하니까 var을 사용한다. 

  @override
  Widget build(context) {
    return Container(
      //클래스는 위젠을 반환하도록
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        //child: StyledText('Hello World!'), //글자 출력 예제 인거임.
        child: DiceRoller(),
        
      ),
    );
  }
}
