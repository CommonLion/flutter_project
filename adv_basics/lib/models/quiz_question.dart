//데이터 저장을 위한 클래스
class QuizQuestion {
  const QuizQuestion(this.text, this.answers); // 인수를 받을 생성자임.

  final String text;
  final List<String> answers;

  //리스트의 복사본을 생성하고, 섞고, 변수레 저장한다.  
  List<String> getShuffledAnswer() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle(); 
    return shuffledList;
  }
  
}
