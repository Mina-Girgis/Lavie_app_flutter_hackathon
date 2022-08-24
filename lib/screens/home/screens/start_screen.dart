import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/screens/forums/screens/discussion_forums_screen.dart';
import 'package:lavie/screens/home/bloc/home_cubit.dart';
import 'package:lavie/screens/home/screens/profile_screen.dart';
import 'package:lavie/screens/home/screens/qr_screen.dart';
import 'package:lavie/shared/Components/components/constants.dart';
import 'home_screen.dart';
import 'notification_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);


    List<Widget>screens=[
      DiscussionForumsScreen(),
      QrScreen(),
      HomeScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
              backgroundColor: BACK_GROUND_COLOR,
              bottomNavigationBar: CurvedNavigationBar(
                index: 2,
                backgroundColor: Colors.white12,
                buttonBackgroundColor: GREEN,
                color: Colors.white,
                items: cubit.items,
                onTap: (index) {
                  cubit.changeBottomNavBarIndex(index);

                },
              ),
              body: screens[cubit.bottomNavBarIndex],
            ));
      },
    );
  }
}




