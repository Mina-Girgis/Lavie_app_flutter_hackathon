import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lavie/screens/blog/screens/blog_screen.dart';
import 'package:lavie/screens/home/bloc/home_cubit.dart';
import 'package:lavie/screens/login/bloc/bloc_cubit.dart';
import 'package:lavie/screens/login/components/components.dart';
import 'package:lavie/screens/login/screen/login_screen.dart';
import 'package:lavie/services/utils/app_navigation.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/component.dart';
import 'package:lavie/shared/network/local/shared_pref/chache_helper.dart';
import 'package:lavie/shared/network/remote/dio/end_points.dart';

import 'free_seed_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    var bloc  = BlocCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<BlocCubit, BlocState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight! / 3,
                  constraints: BoxConstraints(),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(bloc.currentUser.imageUrl),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image(
                          image: NetworkImage(bloc.currentUser.imageUrl),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage:NetworkImage(bloc.currentUser.imageUrl),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "${bloc.currentUser.firstName} ${bloc.currentUser.lastName}",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          color: Color.fromRGBO(243, 254, 241, 1.0),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), //<-- SEE HERE
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 23,
                              backgroundImage: AssetImage('assets/starts.png'),
                              backgroundColor: Colors.white,
                            ),
                            title: Text(
                              "You have 30 points",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Blogs",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10), //<-- SEE HERE
                          ),
                          child: InkWell(
                            onTap: () {
                              AppNavigator.customNavigator(context: context, screen: BlogScreen(), finish: false);
                            },
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                constraints: BoxConstraints(),
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Image(
                                        image: AssetImage("assets/starts.png"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              title: Text(
                                "Show blogs",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              trailing: Icon(FontAwesomeIcons.arrowRight),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Edit profile",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), //<-- SEE HERE
                          ),
                          child: InkWell(
                            onTap: () {

                              },
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                constraints: BoxConstraints(),
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Image(
                                        image: AssetImage('assets/starts.png'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              title: Text(
                                "Change Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              trailing: Icon(FontAwesomeIcons.arrowRight),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), //<-- SEE HERE
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                constraints: BoxConstraints(),
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Image(
                                        image: AssetImage('assets/starts.png'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              title: Text(
                                "Change Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              trailing: Icon(FontAwesomeIcons.arrowRight),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        defaultButton(
                          textColor: Colors.white,
                          borderRadius: 10,
                          text: "Logout",
                          function: (){
                            CacheHelper.putData(key: "token", value: "-1");
                            snackbarMessage("Logout Successfully",context);
                            cubit.changeBottomNavBarIndex(2);
                            AppNavigator.customNavigator(context: context, screen: LoginScreen(), finish: true);

                            },
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      );
  },
),
    );
  },
);
  }
}
