import 'package:firebasechat/onboarding/model.dart';
import 'package:flutter/material.dart';
import 'package:firebasechat/theme/theme.dart';
import 'package:firebasechat/theme/text_theme.dart';
import '../onboarding/constant/size.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image(
          image: AssetImage(model.image),
          height: size.height * 0.4,
        ),
        Column(
          children: [
            Text(
              model.title,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              model.subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        Text(
          model.counterText,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 50.0,
        )
      ]),
    );
  }
}
