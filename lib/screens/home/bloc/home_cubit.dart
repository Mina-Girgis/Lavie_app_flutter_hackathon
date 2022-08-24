import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/models/plant_model.dart';
import 'package:lavie/models/product_model.dart';
import 'package:lavie/models/seed_model.dart';
import 'package:lavie/models/tools_model.dart';
import 'package:lavie/shared/Components/components/component.dart';
import 'package:lavie/shared/network/remote/dio/dio_helper.dart';
import 'package:lavie/shared/network/remote/dio/end_points.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);

  int categoriesIndex=0;
  int bottomNavBarIndex=2;
  int totalPrice=0;
  List<PlantModel> plants =[];
  List<SeedModel> seeds =[];
  List<ToolModel> tools =[];
  List<ProductModel> products =[];
  List<dynamic>cart=[];

  void changeTotalPrice(){
    int sum=0;
    for(int i = 0 ; i < cart.length ; i++){
      int a = cart[i].price;
      int b = cart[i].count;
      sum+=(a*b);
    }
    totalPrice=sum;
    emit(ChangeTotalPrice());
  }
  List<Widget> items = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        "assets/forum.png",
        width: 25.0,
        height: 25.0,
        color: Colors.black,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        "assets/qr.png",
        color: Colors.black,
        width: 25.0,
        height: 25.0,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        "assets/Home.png",
        color: Colors.black,
        width: 25.0,
        height: 25.0,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        "assets/Bell.png",
        color: Colors.black,
        width: 25.0,
        height: 25.0,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        "assets/profile.png",
        color: Colors.black,
        width: 25.0,
        height: 25.0,
      ),
    ),
  ];

  List<dynamic> getMyList(){
    if(categoriesIndex == 0)return products;
    else if(categoriesIndex==1)return plants;
    else if(categoriesIndex==2)return seeds;
    else if(categoriesIndex==3)return tools;
    else return products;
  }

  void changeBottomNavBarIndex(int index){
    bottomNavBarIndex=index;
    emit(ChangeBottomNavBarIndex());
  }

  void addtoCart(int index , context){
    List<dynamic>list = getMyList();
    String id =  list[index].id;
    bool isFound=false;
    for(int i =0 ; i < cart.length ; i++){
      if(cart[i].id==id){
        isFound=true;
        break;
      }
    }
    if(!isFound){
      cart.add(list[index]);
      print(list[index].name);
    }else{
      print("achived");
      ShowDialogMessage(
          "Message",
          "Item is already added .\nYou can change the quantity .",
          "Ok",
          context);

    }
    emit(AddtoCartSuccess());
  }

  void removeFromCart(int index){
    cart[index].count=1;
    cart.removeAt(index);
    emit(RemoveFromCartSuccess());
  }

  void changeCartCounter(int index ,int oneOrMinusOne){
    cart[index].changeCounter(oneOrMinusOne);
    emit(Counterplueplus());
  }

  void quantityCounter(int index , int oneOrMinusOne){
    List<dynamic>list = getMyList();
    list[index].changeCounter(oneOrMinusOne);
    emit(Counterplueplus());
  }

  void changeCategoriesIndex(int x){
    categoriesIndex=x;
    emit(changeCategoriesIndexSuccess());
  }

  
// Data from API
  void getPlantsData(){
    plants.clear();
    DioHelper.getData(
      url: PLANT_DATA,
      query: {},
    ).then((value){
      List<dynamic>list=value.data['data'];
      for(int i =0 ; i < list.length ; i++)
      {
        PlantModel model = PlantModel.fromJson(list[i]);
        plants.add(model);
      }
      print(plants.length);
      // print(value.data['data']);
      emit(getPlantsDataSuccess());


    }).catchError((error){
      if(error is DioError){
        print(error.response);
      }else{
        print(error.toString());
      }
      emit(getPlantsDataFail());
    });
  }
  void getSeedsData(){
    seeds.clear();
    DioHelper.getData(
      url: SEEDS_DATA,
      query: {},
    ).then((value){
      List<dynamic>list=value.data['data'];
      for(int i =0 ; i < list.length ; i++)
      {
        SeedModel model = SeedModel.fromJson(list[i]);
        seeds.add(model);
      }
      print(seeds.length);
      // print(value.data['data']);
      emit(getSeedsDataSuccess());

    }).catchError((error){
      if(error is DioError){
        print(error.response);
      }else{
        print(error.toString());
      }
      emit(getSeedsDataFail());
    });
  }
  void getToolsData(){
    tools.clear();
    DioHelper.getData(
      url: TOOLS_DATA,
      query: {},
    ).then((value){
      List<dynamic>list=value.data['data'];
      for(int i =0 ; i < list.length ; i++)
      {
        ToolModel model = ToolModel.fromJson(list[i]);
        tools.add(model);
      }
      print(tools.length);
      // print(value.data['data']);
      emit(getToolsDataSuccess());

    }).catchError((error){
      if(error is DioError){
        print(error.response);
      }else{
        print(error.toString());
      }
      emit(getToolsDataFail());
    });
  }
  void getProductsData(){
    products.clear();
    DioHelper.getData(
      url: PRODUCTS_DATA,
      query: {},
    ).then((value){
      List<dynamic>list=value.data['data'];
      for(int i =0 ; i < list.length ; i++)
      {
        ProductModel model = ProductModel.fromJson(list[i]);
        products.add(model);
      }
      print(products.length);
      emit(getProductsDataSuccess());

    }).catchError((error){
      if(error is DioError){
        print(error.response);
      }else{
        print(error.toString());
      }
      emit(getProductsDataFail());
    });
  }


  void postFreeSeeds({required String address ,required context,}){
    DioHelper.postData(
      url: FREE_SEEDS,
      data: {
        "address": address,
      },
    ).then((value)async{
      print(value.data['type']);
      snackbarMessage(value.data['message'], context);
      emit(PostFreeSeedsSuccess());
    }).catchError((error){
      print(error.toString());
      emit(PostFreeSeedsFail());
    });
  }

  void postChangeUserInfo(
      { required String firstName ,
        required String lastName ,
        required String email ,
        required String address ,
        required context,
      }){
    DioHelper.postData(
      url: UPDATE_USER,
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "address": address
      },
    ).then((value)async{
      print(value.data['type']);
      snackbarMessage(value.data['message'], context);
      emit(PostFreeSeedsSuccess());
    }).catchError((error){
      print(error.toString());
      emit(PostFreeSeedsFail());
    });
  }


}
