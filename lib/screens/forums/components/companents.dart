import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lavie/models/forum_model.dart';
import 'package:lavie/screens/home/bloc/home_cubit.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/constants.dart';
import 'package:lavie/shared/network/remote/dio/end_points.dart';



Widget forumDesign({required ForumModel model}){
  return Container(
    // width: SizeConfig.screenWidth,
    // height: 500.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: LIGHT_GRAY,
                  offset: Offset(0, -1), //(x,y)
                  blurRadius: 1.0,
                ),
              ],
              border: Border(
                top: BorderSide(width: 0.5 ,color: Colors.transparent),
                left: BorderSide(width: 1,color: LIGHT_GRAY),
                right: BorderSide(width: 1,color:  LIGHT_GRAY),
              )
          ),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.defaultSize!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: SizeConfig.defaultSize!*3,
                      child: Image.network("${model.userImageUrl}"),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: SizeConfig.defaultSize!*2,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${model.firstName} ${model.lastName}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        SizedBox(height: 1,),
                        Text("a while ago",
                          style: TextStyle(
                            color: LIGHT_GRAY,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.defaultSize!*2,),
                Text(
                  model.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: GREEN,
                  ),
                ),
                SizedBox(height: SizeConfig.defaultSize!*1.5,),
                Padding(
                  padding: const EdgeInsets.only(left :8.0,right: 8.0),
                  child: Text(
                    model.description,
                    // maxLines: 3,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      // fontWeight: FontWeight.bold,
                      color: LIGHT_GRAY,
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
        Container(
            color: Colors.transparent,
            width: SizeConfig.screenWidth,
            // height: 200.0,
            child: Column(
              children: [
                (model.imageUrl!="")
                    ?Image.network(
                  "${BASEURL}${model.imageUrl}",
                  fit: BoxFit.contain,
                )
                    :Image.asset("assets/pic.png"),
              ],
            )
        ),
        Row(
          children: [
            IconButton(
              splashRadius: 15,
              onPressed: (){},
              icon: Icon(
                IconData(0xed51, fontFamily: 'MaterialIcons'),
                color: SOLID,
              ),
            ),
            Text("${model.forumLikes.length}",
              style: TextStyle(
                color: SOLID,
              ),
            ),
            SizedBox(width: SizeConfig.defaultSize!*3,),
            Text(
              "${model.forumComments.length} Replies",
              style: TextStyle(
                color: SOLID,
              ),
            ),
          ],
        ),

      ],
    ),
  );
}







