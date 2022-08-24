import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/models/quiz_model.dart';
import 'package:meta/meta.dart';
part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  static QuizCubit get(context)=>BlocProvider.of(context);
  int questionIndex=0;
  List<QuestionModel> questions=[
    QuestionModel(
        question: "Where is number 1",
        answers: [
          "1",
          "2",
          "3"
        ],
        correctAnswer:0 // 0 1 2
    ),
    QuestionModel(
        question: "Where is number 2",
        answers: [
          "3",
          "2",
          "1"
        ],
        correctAnswer:1 // 0 1 2
    ),
    QuestionModel(
        question: "Where is number 3",
        answers: [
          "2",
          "1",
          "3"
        ],
        correctAnswer:2 // 0 1 2
    ),
  ];

  void changeQuestionChosenAnswer(int index){
    questions[questionIndex].changeChosenAnswer(index);
    emit(ChangeQuestionChosenAnswer());
  }
  void changeQuestionIndex(int oneOrMinusOne){
    questionIndex+=oneOrMinusOne;
    emit(ChangeQuestionIndex());
  }

  void resetAll(){
    questionIndex=0;
    for(int i =0; i< questions.length;i++){
      questions[i].changeChosenAnswer(-1);
    }
    emit(ResetAll());
  }
  int calcScore(){
    int score=0;
    for(int i =0 ; i < questions.length ; i++)
    {
      if(questions[i].chosenAnswer== questions[i].correctAnswer){
        score++;
      }
    }
    emit(CalcScore());
    return score;
  }


}
