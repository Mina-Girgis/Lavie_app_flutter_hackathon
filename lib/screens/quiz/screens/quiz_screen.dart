import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/screens/home/screens/start_screen.dart';
import 'package:lavie/screens/quiz/bloc/quiz_cubit.dart';
import 'package:lavie/screens/quiz/components/components.dart';
import 'package:lavie/services/utils/app_navigation.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/component.dart';
import 'package:lavie/shared/Components/components/constants.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var cubit = QuizCubit.get(context);
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              "Course Exam",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            toolbarHeight: SizeConfig.defaultSize! * 10,
          ),
          body: ConditionalBuilder(
            condition: cubit.questionIndex < cubit.questions.length,
            builder: (context) { return Padding(
              padding:  EdgeInsets.only(left: SizeConfig.defaultSize!*3 , right: SizeConfig.defaultSize!*3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Question",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: SizeConfig.defaultSize,),
                      Text(
                        "${cubit.questionIndex+1}",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: GREEN,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "/3",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: GRAY,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.defaultSize!*2,),
                  Text(
                    cubit.questions[cubit.questionIndex].question,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize!*5,),
                  // choiceDesign(model: cubit.questions[0],index: 0,context: context),
                  Container(
                    height: SizeConfig.screenHeight!-400,
                    child: SingleChildScrollView(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: 3,
                        separatorBuilder: (context,index){
                          return SizedBox(height: 20.0,);
                        },
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              cubit.changeQuestionChosenAnswer(index);
                              print(cubit.questions[cubit.questionIndex].chosenAnswer);
                              },
                            child: choiceDesign(model: cubit.questions[cubit.questionIndex],index: index,context: context));
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      (cubit.questionIndex!=0)?InkWell(
                        onTap: (){
                          cubit.changeQuestionIndex(-1);
                        },
                        child: Container(
                          width: SizeConfig.defaultSize!*15,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: GREEN ,width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(
                            "Back",
                            style: TextStyle(
                              color: GREEN,
                              fontSize: 15.0,
                            ),
                          )),
                        ),
                      ):Container(),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          cubit.changeQuestionIndex(1);
                        },
                        child: Container(
                          width: SizeConfig.defaultSize!*15,
                          height: 40,
                          decoration: BoxDecoration(
                            color: GREEN,
                            border: Border.all(color: GREEN,width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          )),
                        ),
                      ),


                    ],
                  ),

                ],
              ),
            ); },
            fallback: (context){
              // cubit.calcScore();
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.defaultSize!*10,),
                    Text(
                      "You have just finished the exam",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: GREEN,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: SizeConfig.defaultSize!*2,),
                    Text(
                      "Your score is",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: GREEN,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: SizeConfig.defaultSize!*2,),
                    Text(
                      "${cubit.calcScore()} / ${cubit.questions.length}",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: defaultButton(
                          text: "End Exam",
                          textColor: Colors.white,
                          borderRadius: 10,
                          textSize: 18,
                          function: (){
                            cubit.resetAll();
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              );
            },

          )
        );
      },
    );
  }
}


/*
          */