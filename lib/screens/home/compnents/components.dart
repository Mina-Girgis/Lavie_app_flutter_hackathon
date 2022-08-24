import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lavie/models/plant_model.dart';
import 'package:lavie/screens/home/bloc/home_cubit.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/component.dart';
import 'package:lavie/shared/Components/components/constants.dart';
import 'package:lavie/shared/network/remote/dio/end_points.dart';


Widget ItemDesign({required context,  dynamic? model, required int index}) {
  var cubit = HomeCubit.get(context);
  return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    removeBottom: true,
    child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(color: Colors.transparent,)),
              Expanded(
                flex: 9,
                child: Card(
                  elevation: 5,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Spacer(),
                          Row(
                            children: [

                            ],
                          ),
                          SizedBox(width: 15,)
                        ],
                      ),
                    ],
                  ),

                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: SizeConfig.defaultSize!),
                child: Container(
                  // color: Colors.red,
                  alignment: Alignment.topLeft,
                  child: Image.network(
                      '${BASEURL}${model.imageUrl}',
                      width: SizeConfig.defaultSize!*15,
                      height: SizeConfig.defaultSize!*20,
                  ),
                  // x
                ),
              ),
              SizedBox(height: 13,),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(

                    alignment: Alignment.topLeft,
                    child: Text(
                      model.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      maxLines:1,
                      overflow: TextOverflow.ellipsis,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text("${model.price}",
                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Container(
                  height: 35,
                  child: Row(
                    children: [
                      Expanded(
                        child: defaultButton(function:(){
                          cubit.addtoCart(index,context);
                          cubit.changeTotalPrice();
                        },
                          text: "Add To Cart",
                          textSize: 16,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  right: 13.0,
                  top: SizeConfig.defaultSize!*11,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Container(
                    width: 18,
                    height: 18,
                    color: Color.fromRGBO(247, 246, 247, 1),
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          if(cubit.getMyList()[index].count>1){
                            cubit.quantityCounter(index,-1);
                          }
                        },
                        child: Icon(FontAwesomeIcons.minus,size: 15,color: Color.fromRGBO(151, 151, 151, 1)), ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 5,right: 5),
                  child: Text('${cubit.getMyList()[index].count}'),
                ),
                Container(
                    width: 18,
                    height: 18,
                    color: Color.fromRGBO(247, 246, 247, 1),
                    child: Center(
                      child: InkWell(
                          onTap: (){
                            cubit.quantityCounter(index,1);
                          },
                          child: Icon(FontAwesomeIcons.plus,size: 15,color: Color.fromRGBO(151, 151, 151, 1),)),
                    )),
              ],),
            ),
          ),
        ]),
  );
  },
);
}

Widget showProducts({required List<dynamic> list, required context}) {
      return Container(
        width: double.infinity,
        // color: Colors.grey,
        child: GridView.builder(
          shrinkWrap: true,
          // scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 210/330,
          ),
          itemCount: 7,
          itemBuilder: (context, index) {
            return ItemDesign(context:context,model:list[index] , index: index);
          },
        ),
      );

}

Widget defaultProductDesign({required context,dynamic model,required int index}){
  var cubit = HomeCubit.get(context);
  return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Card(
      // child: Image.network("https://lavie.orangedigitalcenteregypt.com${cubit.plants[index].imageUrl}"),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 190,
              height: 150,
              child: Image.network(
                (model.imageUrl=="")? "${BASEURL}/uploads/09be504b-99e3-481d-9653-9b6c791741dc.png":
                "${BASEURL}${model.imageUrl}",
                fit: BoxFit.cover,
              ),

            ),
            SizedBox(height: SizeConfig.defaultSize,),
            Text(
              "${model.name}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: SizeConfig.defaultSize!,),
            Row(
              children: [
                Text("${model.price} EGP",
                  style: TextStyle(
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),),
                Spacer(),
                Container(
                    width: 18,
                    height: 18,
                    color: Color.fromRGBO(247, 246, 247, 1),
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          if(model.count>1){
                            cubit.quantityCounter(index,-1);

                          }
                        },
                        child: FaIcon(FontAwesomeIcons.minus,size: 15,color: Color.fromRGBO(151, 151, 151, 1)), ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 5,right: 5),
                  child: Text("${cubit.getMyList()[index].count}"),
                ),
                Container(
                    width: 18,
                    height: 18,
                    color: Color.fromRGBO(247, 246, 247, 1),
                    child: Center(
                      child: InkWell(
                          onTap: (){
                            cubit.quantityCounter(index,1);
                          },
                          child: FaIcon(FontAwesomeIcons.plus,size: 15,color: Color.fromRGBO(151, 151, 151, 1),)),
                    )),
              ],
            ),
            SizedBox(height: SizeConfig.defaultSize!,),
            defaultButton(function:(){
              cubit.addtoCart(index,context);
            },
              text: "Add To Cart",
              textSize: 16,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  },
);
}

Widget gridBuilder({required context, required List<dynamic> list}){

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 10,
            childAspectRatio: 210/320,
          ),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                print(list[index].id);
                print(list[index].name);
              },
                child: defaultProductDesign(context: context,model:list[index] , index: index));
          },
        ),
      ),
    );
}

Widget CartItemDesign({required context,required dynamic model , required int index}){
  var cubit = HomeCubit.get(context);
  return  BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Container(
    width: SizeConfig.screenWidth,
    child: Card(
      color: BACK_GROUND_COLOR,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.0),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    width: 150.0,
                    height: 150.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        (model.imageUrl=="")?"${BASEURL}/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png" : "https://lavie.orangedigitalcenteregypt.com${model.imageUrl}",
                        fit: BoxFit.fill,
                      ),
                    ),

                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    ),
                    SizedBox(height: SizeConfig.defaultSize!*2,),
                    Text(
                      "${model.price}",
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    ),
                    SizedBox(height: SizeConfig.defaultSize!*2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: SEARCH_BAR_COLOR),
                            color: SEARCH_BAR_COLOR,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                splashRadius:5,
                                onPressed: (){
                                  if(cubit.cart[index].count>1){
                                    cubit.changeCartCounter(index,-1);

                                  }else{
                                    cubit.removeFromCart(index);
                                  }
                                  cubit.changeTotalPrice();
                                },
                                icon: Icon(
                                  FontAwesomeIcons.minus,
                                  size: 15.0,
                                  color: GREEN,
                                ),
                              ),
                              Text(
                                "${model.count}",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              IconButton(
                                splashRadius:5,
                                onPressed: (){
                                  cubit.changeCartCounter(index,1);
                                  cubit.changeTotalPrice();
                                },
                                icon: Icon(
                                  FontAwesomeIcons.plus,
                                  size: 15.0,
                                  color: GREEN,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            cubit.removeFromCart(index);
                            cubit.changeTotalPrice();
                          },
                          icon: Icon(
                              FontAwesomeIcons.trashCan),
                          color: GREEN,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  },
);
}


Future<void> inputDialog({required context , required controller}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('TextField in Dialog'),
          content: Container(
            height: 100,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {

                    },
                    controller: controller,
                    decoration: InputDecoration(hintText: "Text Field in Dialog"),
                  ),
                  RaisedButton(onPressed: (){}),
                ],
              ),
            ),
          ),
        );
      });
}




