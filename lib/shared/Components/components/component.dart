import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/screens/login/bloc/bloc_cubit.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/network/remote/dio/end_points.dart';
import 'package:lavie/shared/network/remote/dio/dio_helper.dart';

import 'constants.dart';




Widget textField({
  required String title ,
  required TextEditingController controller,
  bool hiddenText = false,
  Color titleColor = DARK_GRAY,
  Color textColor  = Colors.black,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: titleColor,
        ),
      ),
      SizedBox(height: SizeConfig.defaultSize,),
      TextFormField(
        style: TextStyle(
          color: textColor,
        ),
        obscureText: hiddenText,
        controller: controller,
        decoration: InputDecoration(
            isDense: false,
            contentPadding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 10),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            )
        ),
      ),
    ],
  );
}

Widget defaultButton(
    {required String text,
     required Function function,
      double borderRadius = 5,
      Color textColor = Colors.black,
      double textSize = 15,
      Color backgroundColor = GREEN,
    }) {
  return ButtonTheme(
    minWidth: double.infinity,
    height: 40.0,
    buttonColor: Color.fromRGBO(26, 188, 0, 1.0),
    child: RaisedButton(
      color: backgroundColor,
      onPressed: () {
        function();
      },
      child: Text(text,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
    ),

  );
}

Future<dynamic> ShowDialogMessage(String text1, String text2, String text3, context) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            text1,
            style: TextStyle(
              color: Colors.black,
          ),
          ),
          content: Text(text2,
            style: TextStyle(
              color: LIGHT_GRAY,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(14),
                child: Text(
                    text3,
                  style: TextStyle(
                    color: GREEN,
                  ),
                ),
              ),
            ),
          ],
        );
      });
}

void snackbarMessage(String text,context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: GREEN,
    content: Text(text),
    duration: const Duration(milliseconds: 500),
  ));
}



Widget defaultSearchBar({
  bool readOnly = false,
  bool infinityWidth=false,
  required Function(String s) onChanged,
}) {
  return Container(
    decoration: BoxDecoration(
      color: SEARCH_BAR_COLOR,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    width: (infinityWidth)? SizeConfig.screenWidth: SizeConfig.screenWidth! - SizeConfig.defaultSize! * 10,
    child: TextField(
      onChanged: onChanged,
      readOnly: readOnly,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10)), //<-- SEE HERE
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 25.0,
          ),
          hintText: 'Search',
          border: InputBorder.none),
    ),
  );
}


/*
XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
cubit.photo=image;
cubit.changeaddPhotoIndex(1);

  */