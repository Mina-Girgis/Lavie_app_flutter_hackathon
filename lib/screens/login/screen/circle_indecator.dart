import 'package:flutter/material.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/constants.dart';
class CircleIndecatorScreen extends StatelessWidget {
  const CircleIndecatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 20),
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: GREEN,
            ),
          )
      ),
    );
  }
}
