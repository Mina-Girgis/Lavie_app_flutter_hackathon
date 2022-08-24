import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/screens/login/bloc/bloc_cubit.dart';
import 'package:lavie/screens/login/components/components.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var cubit = BlocCubit.get(context);


    return SafeArea(
      child: Scaffold(
        body:
            SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: SizeConfig.screenHeight!,
                ),
                child: Column(
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset("assets/loginTop.png",
                          height: SizeConfig.defaultSize!*16,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.defaultSize!*5, right: SizeConfig.defaultSize!*5),
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: SizeConfig.screenHeight!*0.67,
                        ),
                        child: BlocConsumer<BlocCubit, BlocState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/lavie.png"),
                                  ],
                                ),
                                SizedBox(height: SizeConfig.defaultSize! * 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    TabText(text: "Sign up", index: 0, context: context),
                                    TabText(text: "Login", index: 1, context: context),
                                  ],
                                ),
                                SizedBox(height: SizeConfig.defaultSize! * 3,),
                                (cubit.textIndex==1)
                                 ?login(
                                  context: context,
                                  email: cubit.EmailControllerLogin,
                                  password: cubit.PasswordControllerLogin,
                                ):signup(
                                  context: context,
                                  firstName: cubit.FirstNameControllerSingup,
                                  lastName: cubit.LastNameControllerSingup,
                                  password: cubit.PasswordControllerSingup,
                                  email: cubit.EmailControllerSingup,
                                  confirmPassword: cubit.ConfirmPasswordControllerSingup,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset("assets/loginBottom.png"),
                      ],
                    )

                  ],
                ),
              ),
            ),
        ),
    );
  }
}

