import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lavie/models/forum_model.dart';
import 'package:lavie/shared/network/remote/dio/dio_helper.dart';
import 'package:lavie/shared/network/remote/dio/end_points.dart';
import 'package:meta/meta.dart';

part 'forums_state.dart';

class ForumsCubit extends Cubit<ForumsState> {
  ForumsCubit() : super(ForumsInitial());
  static ForumsCubit get(context)=>BlocProvider.of(context);
  List<ForumModel>forumsData=[];
  List<ForumModel>searchForumsData=[];
  int titelsIndex=0;
  int addPhotoIndex=0;
  XFile?photo;
  String photoBase64="";
  void changeTitelsIndex(int index){
    titelsIndex=index;
    emit(ChangeTitelsIndexSuccess());
  }
  void changeaddPhotoIndex(int index){
    addPhotoIndex=index;
    emit(ChangeaddPhotoIndex());
  }
  void changePhotoBase64(String s){
    photoBase64=s;
    emit(ChangePhotoBase64Succeess());
  }

  // DATA FROM API
  void getForumsData(){
    forumsData.clear();
    DioHelper.getData(
      url: MY_FORUMS_DATA,
      query: {},
    ).then((value){
      List<dynamic>list = value.data['data'];

      for(int i =0 ; i < list.length ; i++)
      {
        List<dynamic> likesData    = list[i]['ForumLikes'];
        List<dynamic> commentsData = list[i]['ForumComments'];

        List<ForumLike>likes=[];
        for(int j =0 ; j < likesData.length ; j++){
          ForumLike forumLike= ForumLike.fromJson(likesData[j]);
          likes.add(forumLike);
        }

        List<ForumComment>comments=[];
        for(int j =0 ; j < commentsData.length ; j++){
          ForumComment forumComment= ForumComment.fromJson(commentsData[j]);
          comments.add(forumComment);
        }

        ForumModel forumModel = ForumModel.fromJson(list[i], likes, comments);
        forumsData.add(forumModel);

        likesData.clear();
        commentsData.clear();
      }
      print(forumsData[0].forumId);
      print(forumsData[0].forumLikes.length);
      print(forumsData[0].forumComments.length);
      emit(GetForumsDataSuccess());

    }).catchError((error){
      if(error is DioError){
        print(error.response);
      }else{
        print(error.toString());
      }
      emit(GetForumsDataFail());
    });
  }

  void postForumData({required String title, required String description, required String image}){
    DioHelper.postData(
      url: POST_FORUM,
      data: {
        "title": title,
        "description": description,
        "imageBase64": image
      },
    ).then((value) {
      print(value.data['type']);
      emit(PostForumDataSuccess());
    }).catchError((error){
      print(error.toString());
      emit(PostForumDataFail());
    });
  }

  void getSearchForumsData(String s){
    searchForumsData.clear();
    DioHelper.getData(
      url: "/api/v1/forums",
      query: {
        'search':s
      }
    ).then((value){
      List<dynamic>list = value.data['data'];
      print(value.data['type']);
      for(int i =0 ; i < list.length ; i++)
      {
        List<dynamic> likesData    = list[i]['ForumLikes'];
        List<dynamic> commentsData = list[i]['ForumComments'];

        List<ForumLike>likes=[];
        for(int j =0 ; j < likesData.length ; j++){
          ForumLike forumLike= ForumLike.fromJson(likesData[j]);
          likes.add(forumLike);
        }

        List<ForumComment>comments=[];
        for(int j =0 ; j < commentsData.length ; j++){
          ForumComment forumComment= ForumComment.fromJson(commentsData[j]);
          comments.add(forumComment);
        }

        ForumModel forumModel = ForumModel.fromJson(list[i], likes, comments);
        searchForumsData.add(forumModel);
        likesData.clear();
        commentsData.clear();
      }
      print(searchForumsData.length);
      print(forumsData.length);
      emit(GetSearchForumsDataSuccess());

    }).catchError((error){
      if(error is DioError){
        print(error.response);
      }else{
        print(error.toString());
      }
      emit(GetSearchForumsDataFail());
    });
  }



}
