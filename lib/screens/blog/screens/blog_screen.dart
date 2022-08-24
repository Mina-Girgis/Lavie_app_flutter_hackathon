import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/screens/blog/bloc/blog_cubit.dart';
import 'package:lavie/screens/blog/components/components.dart';
import 'package:lavie/services/utils/size_config.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var cubit =BlogCubit.get(context);
    cubit.getBlogsData();
    return BlocConsumer<BlogCubit, BlogState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              "Blogs",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold

              ),
            ),
            centerTitle: true,
            toolbarHeight: SizeConfig.defaultSize! * 10,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemCount: cubit.blogsData.length ,
                separatorBuilder: (context,index){
                  return Container(
                    height: 10.0,
                  );
                },
                itemBuilder: (context,index){
                  return blogDesign(context: context,model: cubit.blogsData[index],index: index);
                },

            ),
          ),
        );
      },
    );
  }
}
