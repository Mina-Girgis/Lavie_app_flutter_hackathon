import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/screens/home/bloc/home_cubit.dart';
import 'package:lavie/services/utils/size_config.dart';
import 'package:lavie/shared/Components/components/component.dart';
import 'package:lavie/shared/Components/components/constants.dart';
class FreeSeedScreen extends StatelessWidget {
  FreeSeedScreen({Key? key}) : super(key: key);

  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            minHeight: SizeConfig.screenHeight!,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/freeSeed.png",),
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcOver),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top:8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.defaultSize!*20,),
                    Image.asset(
                      "assets/getSeedsForFree.png",
                    ),
                    SizedBox(height: SizeConfig.defaultSize!*2,),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.defaultSize!*2,),
                      child: textField(textColor: Colors.white,titleColor: Colors.white,title: "Enter Your Address" ,controller: addressController),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left:SizeConfig.defaultSize!*2,right: SizeConfig.defaultSize!*2,),
                      child: defaultButton(textColor: Colors.white,text: "Send", function: (){
                        if(addressController.text==""){
                          ShowDialogMessage("Message","Address must not ber empty","ok",context);
                        }else{
                          cubit.postFreeSeeds(address: addressController.text, context: context);
                          Navigator.pop(context);
                        }
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:SizeConfig.defaultSize!*2,right: SizeConfig.defaultSize!*2,),
                      child: defaultButton( textColor: GRAY,text: "Save for later", function: (){Navigator.pop(context);} ,backgroundColor: SEARCH_BAR_COLOR),
                    ),
                    SizedBox(height: SizeConfig.defaultSize!*2,),
                    // Image.asset("assets/freeSeed.png"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
