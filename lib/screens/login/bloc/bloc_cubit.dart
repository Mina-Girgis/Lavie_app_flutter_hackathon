import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/models/user_model.dart';
import 'package:lavie/screens/blog/bloc/blog_cubit.dart';
import 'package:lavie/screens/forums/bloc/forums_cubit.dart';
import 'package:lavie/screens/home/bloc/home_cubit.dart';
import 'package:lavie/screens/home/screens/free_seed_screen.dart';
import 'package:lavie/screens/home/screens/start_screen.dart';
import 'package:lavie/screens/home/screens/home_screen.dart';
import 'package:lavie/screens/login/components/components.dart';
import 'package:lavie/services/utils/app_navigation.dart';
import 'package:lavie/shared/Components/components/component.dart';
import 'package:lavie/shared/network/local/shared_pref/chache_helper.dart';
import 'package:lavie/shared/network/remote/dio/end_points.dart';
import 'package:lavie/shared/network/remote/dio/dio_helper.dart';
import 'package:meta/meta.dart';

import '../../../Models.dart';

part 'bloc_state.dart';

class BlocCubit extends Cubit<BlocState> {
  BlocCubit() : super(BlocInitial());
  static BlocCubit get(context)=>BlocProvider.of(context);

  TextEditingController EmailControllerLogin = TextEditingController();
  TextEditingController PasswordControllerLogin = TextEditingController();
  TextEditingController EmailControllerSingup = TextEditingController();
  TextEditingController PasswordControllerSingup = TextEditingController();
  TextEditingController ConfirmPasswordControllerSingup = TextEditingController();
  TextEditingController FirstNameControllerSingup = TextEditingController();
  TextEditingController LastNameControllerSingup = TextEditingController();
  late UserModel currentUser;

  int textIndex = 1;
  void changeTextIndex(int index){
    textIndex=index;
    emit(ChangeTextIndexSuccess());
  }

  void changeCurrentUser(UserModel user){
    currentUser = user;
    emit(ChangeCurrentUser());
  }

  void clearControllers(){
    EmailControllerLogin.text="";
    EmailControllerSingup.text="";
    PasswordControllerSingup.text="";
    ConfirmPasswordControllerSingup.text="";
    FirstNameControllerSingup.text="";
    LastNameControllerSingup.text="";
    PasswordControllerLogin.text="";
    emit(ClearControllers());
  }

  void getAllDataMethod(context){
    var homeCubit  = HomeCubit.get(context);
    var forumCubit = ForumsCubit.get(context);
    var blogCubit  = BlogCubit.get(context);
    blogCubit.getBlogsData();
    forumCubit.getSearchForumsData("");
    homeCubit.getPlantsData();
    homeCubit.getSeedsData();
    homeCubit.getToolsData();
    homeCubit.getProductsData();
    emit(GetAllDataMethod());
  }

  void postLogin({required String email, required String password, required context,}){
    bool valid=true;
    DioHelper.postData(
        url: LOGIN,
        data: {
          "password": password,
          "email": email,
        },
    ).then((value)async{
      // print(value.data);
      UserModel model = UserModel.fromJson(value.data['data']['user']);
      changeCurrentUser(model);
      snackbarMessage(value.data['message'],context);
      String token =value.data['data']['accessToken'];
      await CacheHelper.putData(key: 'token', value: token);
      clearControllers();
      print("***********************");
      print(currentUser.imageUrl);
      print("***********************");
      getAllDataMethod(context);

      if(currentUser.address==""){
        AppNavigator.customNavigator(context: context, screen: StartScreen(), finish: true);
        AppNavigator.customNavigator(context: context, screen: FreeSeedScreen(), finish: false);
      }else{
        AppNavigator.customNavigator(context: context, screen: StartScreen(), finish: true);
      }
      emit(LoginSuccess());
    }).catchError((error){
      if(error is DioError){
        print(error.response);
        ShowDialogMessage("Message",error.response!.data['message'],"Ok",context);
      }else{
        print(error.toString());
      }
      emit(LoginFail());
    });
  }

  void postSignup({required String firstName, required String lastName, required String email, required String password, required context,}){
    if(PasswordControllerSingup.text == ConfirmPasswordControllerSingup.text){
      DioHelper.postData(
        url: SIGNUP,
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
        },
      ).then((value){


        print(value.data);
        snackbarMessage(value.data['message'],context);

        clearControllers();
        changeTextIndex(1);
        emit(SignupSuccess());
      }).catchError((error){
        if(error is DioError){
          print(error.response);
          if(error.response!.data['statusCode']==400){
            ShowDialogMessage("Message",error.response!.data['message'][0],"Ok",context);
          }else{
            ShowDialogMessage("Message",error.response!.data['message'],"Ok",context);
          }
        }else{
          print(error.toString());
        }
        emit(SignupFail());
      });
    }else{
      ShowDialogMessage("Message","Password is not the same","Ok",context);
    }

}


  void getCurrentUserFromServer()
  {
    DioHelper.getData(
      url: CURRENT_USER,
      query: {},
    ).then((value){
      UserModel user = UserModel.fromJson(value.data['data']);
      changeCurrentUser(user);
      print(value.data['type']);
      emit(GetCurrentUserFromServerSuccess());

    }).catchError((error){
      print(error.toString());
      emit(GetCurrentUserFromServerFail());
    });
  }


}
