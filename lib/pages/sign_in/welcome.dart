import 'package:firebasechat/onboarding/constant/color.dart';
import 'package:firebasechat/onboarding/constant/image_string.dart';
import 'package:firebasechat/onboarding/constant/size.dart';
import 'package:firebasechat/onboarding/constant/text_string.dart';
import 'package:flutter/material.dart';
import 'package:firebasechat/theme/text_theme.dart';
import 'package:firebasechat/theme/theme.dart';
import 'package:firebasechat/common/values/colors.dart';
import 'package:firebasechat/common/widgets/button.dart';
import 'package:firebasechat/pages/welcome/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../common/values/shadows.dart';
import 'controller.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: tPrimaryColor3,
        body: Container(
      padding: EdgeInsets.all(tDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(tWelcomeScreen1Image),
            height: height * 0.55,
          ),
          Column(
            children: [
              Text(
                tWelcomeTitle,
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                tWelcomeSubTitle,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                onPressed: () {controller.handleSignIn("google");},
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    backgroundColor: tDarkColor,
                    side: BorderSide(color: tSecondaryColor),
                    padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
                child: Text(
                  tLogin.toUpperCase(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              )),
              /*const SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          backgroundColor: tWhiteColor,
                          side: BorderSide(color: tSecondaryColor),
                          padding:
                              EdgeInsets.symmetric(vertical: tButtonHeight)),
                      child: Text(
                        tSignup.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText1,
                      )))*/
            ],
          )
        ],
      ),
    ));
  }
}
