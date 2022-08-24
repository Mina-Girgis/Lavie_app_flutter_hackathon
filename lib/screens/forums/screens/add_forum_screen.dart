import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lavie/screens/forums/bloc/forums_cubit.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/component.dart';
import 'package:lavie/shared/Components/components/constants.dart';

class AddForumScreen extends StatelessWidget {
  AddForumScreen({Key? key}) : super(key: key);

  String getBase64FormateFile(String path) {
    File file = File(path);
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte);
    return fileInBase64;
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var cubit = ForumsCubit.get(context);

    return BlocConsumer<ForumsCubit, ForumsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              "Create New Post",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            toolbarHeight: SizeConfig.defaultSize! * 10,
          ),
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight! - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (cubit.addPhotoIndex == 0)
                            ? InkWell(
                                onTap: () async {
                                  XFile? image = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  cubit.photo = image;
                                  cubit.changeaddPhotoIndex(1);
                                  String s = getBase64FormateFile(image!.path);
                                  cubit.changePhotoBase64(s);
                                  print(s);
                                },
                                child: Container(
                                  width: SizeConfig.defaultSize! * 15,
                                  height: SizeConfig.defaultSize! * 15,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(width: 2, color: GREEN),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.add,
                                        color: GREEN,
                                      ),
                                      SizedBox(
                                        height: SizeConfig.defaultSize! * 2,
                                      ),
                                      Text(
                                        "Add Photo",
                                        style: TextStyle(color: GREEN),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () async {
                                  XFile? image = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  cubit.photo = image;
                                  cubit.changeaddPhotoIndex(1);
                                  // cubit.photo=image;
                                },
                                child: Container(
                                  width: SizeConfig.defaultSize! * 15,
                                  height: SizeConfig.defaultSize! * 15,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(width: 2, color: GREEN),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.file(
                                      File(cubit.photo!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    textField(title: "Title", controller: titleController),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: DARK_GRAY,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize,
                    ),
                    TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                            isDense: false,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                        minLines: 6,
                        // any number you need (It works as the rows for the textarea)
                        keyboardType: TextInputType.multiline,
                        maxLines: null),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 3,
                    ),
                    defaultButton(
                        text: "Post",
                        textColor: Colors.white,
                        function: () {
                          if (titleController.text == "") {
                            ShowDialogMessage("Message",
                                "Title must not be empty", "Ok", context);
                          } else if (cubit.photoBase64 == "") {
                            ShowDialogMessage("Message", "Photo must be added","Ok", context);
                          } else {
                            snackbarMessage("Post added .",context);
                            cubit.postForumData(title: titleController.text, description: descriptionController.text, image:"data:image/png;base64,${cubit.photoBase64}",);
                            cubit.getSearchForumsData("");
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
