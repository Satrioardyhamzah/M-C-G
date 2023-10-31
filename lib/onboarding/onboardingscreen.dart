import 'package:firebasechat/onboarding/constant/color.dart';
import 'package:firebasechat/onboarding/constant/image_string.dart';
import 'package:firebasechat/onboarding/constant/text_string.dart';
import 'package:firebasechat/onboarding/onboardingwidget.dart';
import 'package:firebasechat/onboarding/model.dart';
import 'package:firebasechat/pages/sign_in/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:firebasechat/pages/sign_in/welcome.dart';

import 'constant/color.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnBoardingImage1,
          title: tOnBoardingTitle1,
          subTitle: tOnBoardingSubTitle1,
          counterText: tOnBoardingCounter1,
          height: size.height,
          bgColor: tOnBoardingPage1Color,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnBoardingImage2,
          title: tOnBoardingTitle2,
          subTitle: tOnBoardingSubTitle2,
          counterText: tOnBoardingCounter2,
          height: size.height,
          bgColor: tOnBoardingPage2Color,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnBoardingImage3,
          title: tOnBoardingTitle3,
          subTitle: tOnBoardingSubTitle3,
          counterText: tOnBoardingCounter3,
          height: size.height,
          bgColor: tOnBoardingPage3Color,
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            onPageChangeCallback: onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          /*Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () {
                int nextPage = controller.currentPage + 1;
                controller.animateToPage(page: nextPage);
              },
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  onPrimary: Colors.white),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    shape: BoxShape.circle),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),*/
          /*Positioned(
            top: 50,
            right: 20,
            child: TextButton(
                onPressed: () => controller.jumpToPage(page: 2),
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.grey),
                )),
          ),*/
          /*Container(
            height : 10,
          
            width: currentIndex == index ? 25 :,
            child: FlatButton(child: Text("Next"),
            onPressed: (){},
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),),
          ),*/
          
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 550),
              width: size.width/1.5,
              height: size.height /13,
              decoration: BoxDecoration(
                color: tPrimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(child: Text(
                "Ayo Mulai",
                style: Theme.of(context).textTheme.headline6,
              )), 
              ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0,
                )),
            
          ),
         
        ],
      ),
    );
  }
  
  void onPageChangedCallback(int activePageIndex) {
    setState(() {
       currentPage = activePageIndex;
    });
    currentPage = activePageIndex;
  }
}
