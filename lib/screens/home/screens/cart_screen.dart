import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lavie/screens/home/bloc/home_cubit.dart';
import 'package:lavie/screens/home/compnents/components.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/component.dart';
import 'package:lavie/shared/Components/components/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "My Cart",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return (cubit.cart.length != 0)
              ? Column(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight! * 0.64,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10.0,
                          );
                        },
                        itemCount: cubit.cart.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: CartItemDesign(
                                index: index,
                                context: context,
                                model: cubit.cart[index]),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: SizeConfig.defaultSize! * 5,
                            left: SizeConfig.defaultSize! * 5,
                            top: SizeConfig.defaultSize! * 3),
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${cubit.totalPrice} EGY",
                                    style: TextStyle(
                                        color: GREEN,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Spacer(),
                              defaultButton(
                                  text: "Check Out",
                                  function: () {},
                                  textColor: Colors.white,
                                  borderRadius: 10.0),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Center(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/Frame.png"),
                      SizedBox(height: SizeConfig.defaultSize!*2,),
                      Text(
                        "Your cart is empty",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: SizeConfig.defaultSize!*2,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                            "Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:17.5,
                            color: GRAY,
                          ),
                        ),
                      ),

                    ],
                  ),
                );
        },
      ),
    );
  }
}
