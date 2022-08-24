import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lavie/screens/home/bloc/home_cubit.dart';
import 'package:lavie/screens/home/compnents/components.dart';
import 'package:lavie/screens/login/screen/circle_indecator.dart';
import 'package:lavie/screens/quiz/bloc/quiz_cubit.dart';
import 'package:lavie/screens/quiz/screens/quiz_screen.dart';
import 'package:lavie/services/utils/app_navigation.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/component.dart';
import 'package:lavie/shared/Components/components/constants.dart';

import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    final categories = ["All", "Plants", "Seeds", "Tools"];

    List<List> lists = [
      cubit.products,
      cubit.plants,
      cubit.seeds,
      cubit.tools,
    ];

    SizeConfig.init(context);

    // cubit.getPlantsData();
    // cubit.getSeedsData();
    // cubit.getToolsData();
    // cubit.getProductsData();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: (cubit.products.length != 0),
          builder: (context) {
            return NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      toolbarHeight: SizeConfig.defaultSize! * 10,
                      title: Image.asset("assets/lavie.png"),
                      elevation: 0.0,
                      automaticallyImplyLeading: true,
                      centerTitle: true,
                      expandedHeight: 50,
                      floating: true,
                      actions: [
                        BlocConsumer<QuizCubit, QuizState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return IconButton(
                              onPressed: () {
                                QuizCubit.get(context).resetAll();
                                AppNavigator.customNavigator(context: context,
                                    screen: QuizScreen(),
                                    finish: false);
                              },
                              icon: Icon(
                                FontAwesomeIcons.question,
                                color: GREEN,
                              ),
                            );
                          },
                        ),
                      ],
                      // snap: true,
                    )
                  ];
                },
                body: Container(
                  height: SizeConfig.screenHeight,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: SizeConfig.defaultSize! * 2,
                            ),
                            defaultSearchBar(readOnly: true ,onChanged: (value){}),
                            Spacer(),
                            Container(
                              width: SizeConfig.defaultSize! * 5,
                              height: SizeConfig.defaultSize! * 5,
                              decoration: BoxDecoration(
                                color: GREEN,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              child: IconButton(
                                splashRadius: 35,
                                onPressed: () {
                                  cubit.changeTotalPrice();
                                  AppNavigator.customNavigator(
                                      context: context,
                                      screen: CartScreen(),
                                      finish: false);
                                },
                                icon: Icon(Icons.add_shopping_cart),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.defaultSize! * 2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.defaultSize! * 2,
                              right: SizeConfig.defaultSize! * 2),
                          child: Container(
                            // color: Colors.red,
                            height: SizeConfig.defaultSize! * 4,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 12.0,
                                );
                              },
                              itemCount: lists.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    cubit.changeCategoriesIndex(index);
                                  },
                                  child: Container(
                                    constraints:
                                    BoxConstraints(minWidth: 80.0),
                                    // height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: SEARCH_BAR_COLOR,
                                        border: Border.all(
                                          width: 2.0,
                                          color: (cubit.categoriesIndex ==
                                              index)
                                              ? GREEN
                                              : Colors.transparent,
                                        )),
                                    child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            categories[index],
                                            style: TextStyle(
                                                color: (cubit.categoriesIndex ==
                                                    index)
                                                    ? GREEN
                                                    : LIGHT_GRAY,
                                                fontSize: 16.0),
                                          ),
                                        )),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        (cubit.categoriesIndex == 0)
                            ? showProducts(context: context, list: lists[0])
                            : gridBuilder(
                            context: context,
                            list: lists[cubit.categoriesIndex]),
                      ],
                    ),
                  ),
                )
            );
          },
          fallback: (BuildContext context) {
            return CircleIndecatorScreen();
          },
        );
      },
    );
  }
}
