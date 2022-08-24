import 'package:flutter/material.dart';
import 'package:lavie/services/utils/size_config.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Image.asset('assets/lavie.png'),
    );
  }
}
