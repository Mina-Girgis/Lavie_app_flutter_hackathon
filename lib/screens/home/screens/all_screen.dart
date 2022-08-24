import 'package:flutter/material.dart';
import 'package:lavie/screens/home/bloc/home_cubit.dart';
import 'package:lavie/screens/home/compnents/components.dart';


class AllScreen extends StatelessWidget {
  const AllScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  var cubit = HomeCubit.get(context);
    return Padding(
      padding: const EdgeInsets.only(left:15.0 , right: 15.0),
      child: showProducts(context: context ,list: cubit.products),
    );
  }
}
