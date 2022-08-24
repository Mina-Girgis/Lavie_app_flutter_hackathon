class QuestionModel{
  late String question;
  late List<String>answers;
  late int correctAnswer;
  int chosenAnswer=-1;
  QuestionModel({
    required  this.answers,
    required this.question,
    required this.correctAnswer
    }
  );

  void changeChosenAnswer(int index){
    chosenAnswer=index;
  }

}
