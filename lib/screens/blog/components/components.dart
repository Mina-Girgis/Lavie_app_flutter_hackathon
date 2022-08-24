import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lavie/screens/blog/bloc/blog_cubit.dart';
import 'package:lavie/screens/home/bloc/home_cubit.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/constants.dart';
import 'package:lavie/shared/network/remote/dio/end_points.dart';



Widget blogDesign({required context , required dynamic model , required int index}){
  var cubit = HomeCubit.get(context);
  return  BlocConsumer<BlogCubit, BlogState>(
    listener: (context, state) {},
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
                            "${BASEURL}${(model.imageUrl=="") ?"/uploads/09be504b-99e3-481d-9653-9b6c791741dc.png":model.imageUrl}",
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
                        SizedBox(height: SizeConfig.defaultSize,),
                        Text(
                          model.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: SizeConfig.defaultSize!*2,),
                        Text(
                          model.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: GRAY,
                          ),
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

