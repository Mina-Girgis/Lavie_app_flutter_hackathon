import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/models/quiz_model.dart';
import 'package:lavie/screens/quiz/bloc/quiz_cubit.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/constants.dart';

Widget choiceDesign({required QuestionModel model, required int index , required context}) {
  var cubit = QuizCubit.get(context);
  return BlocConsumer<QuizCubit, QuizState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return Container(
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          // color: Colors.black,
          border: Border.all(color: GREEN, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: SizeConfig.screenWidth! - 200,
                      child: Text(
                          model.answers[index],
                      )),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      border: Border.all(color: GREEN),
                    ),
                    width: 40.0,
                    height: 40.0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                            color: (cubit.questions[cubit.questionIndex].chosenAnswer == index)?GREEN:Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}