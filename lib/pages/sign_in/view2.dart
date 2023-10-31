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
import 'package:firebasechat/onboarding/constant/color.dart';
import 'package:firebasechat/onboarding/constant/image_string.dart';
import 'package:firebasechat/onboarding/constant/size.dart';
import 'package:firebasechat/onboarding/constant/text_string.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

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
                    onPressed: () {
                      controller.handleSignIn("google");
                    },
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
  /*Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget _buildLogo(){
      return Container(
        width: 110.w,
        margin: EdgeInsets.only(top:84.h),
        child: Column(
          children: [
            Container(
              width: 76.w,
              height: 76.w,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        height: 76.w,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryBackground,
                          boxShadow: [
                            Shadows.primaryShadow
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(35))
                        ),
                      )
                  ),
                  
                  Positioned(child: Image.asset(
                    "assets/images/ic_launcher.png",
                    width: 76.w,
                    height: 76.w,
                    fit: BoxFit.cover,
                  ))
                ],
              ),
            ),
    


   
            Container(
              margin: EdgeInsets.only(
                top:15.h, bottom: 15.h
              ),
              child: Text(
                "Let's chat",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.thirdElement,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  height: 1
                ),
              ),
            )
          ],
        ),
      );
    }
    Widget _buildThirdPartyLogin(){
      return Container(
        width: 295.w,
        margin: EdgeInsets.only(bottom: 250.h),
        child: Column(
          children: [
            Text(
              "Sign in with social networks",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,

              ),
            ),
             

            Padding(padding: EdgeInsets.only(
              top:30.h, left: 50.w, right: 50.w
            ),
              child: OutlinedButton(
                  onPressed: (){controller.handleSignIn("google");},
                  style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          backgroundColor: tWhiteColor,
                          side: BorderSide(color: tSecondaryColor),
                          padding:
                              EdgeInsets.symmetric(vertical: tButtonHeight)),
                      child: Text(
                        tSignup.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                      
                
            /*Padding(padding: EdgeInsets.only(
                top:15.h, left: 50.w, right: 50.w
            ),
              child: btnFlatButtonWidget(
                  onPressed: (){controller.handleSignIn("facebook");},
                  width: 200.w,
                  height: 40.h,
                  title: "Facebook Login"
              ),
            ),*/
              ),)
          ],
        ),
      );
    }
    return  Scaffold(

      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            Spacer(),
            _buildThirdPartyLogin(),
          ],
        ),
      )
    );
  }*/
}
