import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/models/plant_model.dart';
import 'package:lavie/models/seed_model.dart';
import 'package:lavie/models/tools_model.dart';
import 'package:lavie/shared/network/remote/dio/dio_helper.dart';
import 'package:lavie/shared/network/remote/dio/end_points.dart';
import 'package:meta/meta.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitial());
  static BlogCubit get(context)=>BlocProvider.of(context);

  List<dynamic>blogsData=[];


  void getBlogsData(){
    blogsData.clear();
    DioHelper.getData(
      url: BLOG_DATA,
      query: {},
    ).then((value){
      print(value.data['type']);
      List<dynamic>plantsData=value.data['data']['plants'];
      List<dynamic>seedsData=value.data['data']['seeds'];
      List<dynamic>toolsData=value.data['data']['tools'];
      for(int i =0 ; i < plantsData.length ; i++)
      {
        PlantModel model = PlantModel.fromJson(plantsData[i]);
        blogsData.add(model);
      }

      for(int i =0 ; i < seedsData.length ; i++)
      {
        SeedModel model = SeedModel.fromJson(seedsData[i]);
        blogsData.add(model);
      }

      for(int i =0 ; i < toolsData.length ; i++)
      {
        ToolModel model = ToolModel.fromJson(toolsData[i]);
        blogsData.add(model);
      }
      print(blogsData.length);
      emit(getBlogsDataSuccess());
    }).catchError((error){
        print(error.toString());
      emit(getBlogDataFail());
    });
  }




}
