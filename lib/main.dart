import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/screens/blog/bloc/blog_cubit.dart';
import 'package:lavie/screens/forums/bloc/forums_cubit.dart';
import 'package:lavie/screens/forums/screens/add_forum_screen.dart';
import 'package:lavie/screens/blog/screens/blog_screen.dart';
import 'package:lavie/screens/forums/screens/discussion_forums_screen.dart';
import 'package:lavie/screens/home/bloc/home_cubit.dart';
import 'package:lavie/screens/home/screens/cart_screen.dart';
import 'package:lavie/screens/home/screens/free_seed_screen.dart';
import 'package:lavie/screens/home/screens/start_screen.dart';
import 'package:lavie/screens/home/screens/profile_screen.dart';
import 'package:lavie/screens/login/bloc/bloc_cubit.dart';
import 'package:lavie/screens/login/screen/login_screen.dart';
import 'package:lavie/screens/login/screen/splash_screen.dart';
import 'package:lavie/screens/quiz/bloc/quiz_cubit.dart';
import 'package:lavie/screens/quiz/screens/quiz_screen.dart';
import 'package:lavie/services/utils/bloc_observer.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/network/local/shared_pref/chache_helper.dart';
import 'package:lavie/shared/network/remote/dio/dio_helper.dart';

import 'bloc/global_bloc_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => BlocCubit()..getCurrentUserFromServer(),),
        BlocProvider(create: (BuildContext context) => GlobalBlocCubit(),),
        BlocProvider(create: (BuildContext context) => HomeCubit()
          ..getProductsData()
          ..getToolsData()
          ..getSeedsData()
          ..getPlantsData()
          ,),
        BlocProvider(create: (BuildContext context) => ForumsCubit()..getSearchForumsData(""),),
        BlocProvider(create: (BuildContext context) => BlogCubit()..getBlogsData(),),
        BlocProvider(create: (BuildContext context) => QuizCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String? token = CacheHelper.getData(key: 'token');
    print(token);
    var cubit = BlocCubit.get(context);
    return BlocConsumer<BlocCubit, BlocState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return ConditionalBuilder(
            condition: token != "-1",
            builder: (context){

                return StartScreen();
            },
            fallback: (context){
              return LoginScreen();
            },

        );
      },
    );
  }
}



