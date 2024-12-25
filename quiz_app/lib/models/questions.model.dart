class QuestionModel{
  const QuestionModel(this.question,this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    List<String> shuffletList = List.of(answers);
    shuffletList.shuffle();
    return shuffletList;
  }
}