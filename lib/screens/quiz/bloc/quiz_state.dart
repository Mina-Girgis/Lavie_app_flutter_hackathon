part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}


class ChangeQuestionIndex extends QuizState {}


class ChangeQuestionChosenAnswer extends QuizState {}


class ResetAll extends QuizState {}


class CalcScore extends QuizState {}






