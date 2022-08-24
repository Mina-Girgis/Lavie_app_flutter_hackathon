import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/screens/login/bloc/bloc_cubit.dart';
import 'package:lavie/services/utils/app_navigation.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/component.dart';
import 'package:lavie/shared/Components/components/constants.dart';
import 'package:lavie/shared/network/local/shared_pref/chache_helper.dart';
import 'package:lavie/shared/network/remote/dio/end_points.dart';
import 'package:lavie/shared/network/remote/dio/dio_helper.dart';
Widget TabText({required String text, required int index, required context}) {
  var cubit = BlocCubit.get(context);
  return BlocConsumer<BlocCubit, BlocState>(
    listener: (context, state) {},
    builder: (context, state) {
      return InkWell(
        highlightColor: Colors.transparent,
        onTap: () {
          cubit.changeTextIndex(index);
        },
        child: Container(
          padding: EdgeInsets.only(
            bottom: 8, // Space between underline and text
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: (index == cubit.textIndex) ? GREEN : Colors.transparent,
            width: 3.0, // Underline thickness
          ))),
          child: Text(
            text,
            style: TextStyle(
              color: (index == cubit.textIndex) ? GREEN : GRAY,
              fontSize: SizeConfig.defaultSize! * 2,
            ),
          ),
        ),
      );
    },
  );
}

Widget login(
    {required BuildContext context,
    required TextEditingController email,
    required TextEditingController password}) {
  var cubit = BlocCubit.get(context);
  return BlocConsumer<BlocCubit, BlocState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return Column(
        children: [
          textField(title: "Email", controller: email),
          SizedBox(
            height: SizeConfig.defaultSize! * 2,
          ),
          textField(title: "Password", controller: password, hiddenText: true),
          SizedBox(
            height: SizeConfig.defaultSize! * 4,
          ),
          defaultButton(
              text: "Login",
              function: () async {
                print(cubit.EmailControllerLogin.text);
                cubit.postLogin(
                    context: context,
                    email: cubit.EmailControllerLogin.text,
                    password: cubit.PasswordControllerLogin.text);
              }),
          SizedBox(
            height: SizeConfig.defaultSize! * 3,
          ),
          Row(children: <Widget>[
            Expanded(
                child: Divider(
              color: LIGHT_GRAY,
              thickness: 1.5,
            )),
            Text(
              "  or continue with  ",
              style: TextStyle(
                color: LIGHT_GRAY,
              ),
            ),
            Expanded(
                child: Divider(
              color: LIGHT_GRAY,
              thickness: 1.5,
            )),
          ]),
          SizedBox(
            height: SizeConfig.defaultSize! * 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ButtonTheme(
              minWidth: 50.0,
              height: 50.0,
              child: RaisedButton(
                elevation: 0.0,
                color: Colors.transparent,
                onPressed: () {},
                child: Image.asset(
                  "assets/google.png",
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 50.0,
              height: 50.0,
              child: RaisedButton(
                elevation: 0.0,
                color: Colors.transparent,
                onPressed: () {},
                child: Image.asset(
                  "assets/facebook.png",
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]),
        ],
      );
    },
  );
}

Widget signup({
  required context,
  required TextEditingController firstName,
  required TextEditingController lastName,
  required TextEditingController email,
  required TextEditingController password,
  required TextEditingController confirmPassword,
}) {
  var cubit = BlocCubit.get(context);
  return BlocConsumer<BlocCubit, BlocState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return Column(
        children: [
          Row(
            children: [
              Container(
                width: SizeConfig.defaultSize! * 15,
                child: textField(title: "First Name", controller: firstName),
              ),
              Spacer(),
              Container(
                width: SizeConfig.defaultSize! * 15,
                child: textField(title: "Last Name", controller: lastName),
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 3,
          ),
          textField(title: "Email", controller: email),
          SizedBox(
            height: SizeConfig.defaultSize! * 3,
          ),
          textField(title: "Password", controller: password, hiddenText: true),
          SizedBox(
            height: SizeConfig.defaultSize! * 3,
          ),
          textField(
              title: "Confirm Password",
              controller: confirmPassword,
              hiddenText: true),
          SizedBox(
            height: SizeConfig.defaultSize! * 3,
          ),
          defaultButton(
              text: "Login",
              function: () {
                cubit.postSignup(
                  firstName: cubit.FirstNameControllerSingup.text,
                  lastName: cubit.LastNameControllerSingup.text,
                  email: cubit.EmailControllerSingup.text,
                  password: cubit.PasswordControllerSingup.text,
                  context: context,
                );
              }),
          SizedBox(
            height: SizeConfig.defaultSize! * 3,
          ),
          Row(children: <Widget>[
            Expanded(
                child: Divider(
              color: LIGHT_GRAY,
              thickness: 1.5,
            )),
            Text(
              "  or continue with  ",
              style: TextStyle(
                color: LIGHT_GRAY,
              ),
            ),
            Expanded(
                child: Divider(
              color: LIGHT_GRAY,
              thickness: 1.5,
            )),
          ]),
          SizedBox(
            height: SizeConfig.defaultSize! * 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ButtonTheme(
              minWidth: 50.0,
              height: 50.0,
              child: RaisedButton(
                elevation: 0.0,
                color: Colors.transparent,
                onPressed: () {},
                child: Image.asset(
                  "assets/google.png",
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 50.0,
              height: 50.0,
              child: RaisedButton(
                elevation: 0.0,
                color: Colors.transparent,
                onPressed: () {},
                child: Image.asset(
                  "assets/facebook.png",
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]),
        ],
      );
    },
  );
}

