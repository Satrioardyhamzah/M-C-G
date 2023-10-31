import 'package:firebasechat/tips/tips3.dart';
import 'package:firebasechat/onboarding/constant/color.dart';
import 'package:firebasechat/onboarding/constant/image_string.dart';
import 'package:firebasechat/onboarding/constant/size.dart';
import 'package:firebasechat/onboarding/constant/text_string.dart';
import 'package:firebasechat/tips/tips4.dart';
import 'package:flutter/material.dart';
import 'package:firebasechat/theme/text_theme.dart';
import 'package:firebasechat/theme/theme.dart';

import '../tips/tips.dart';
import '../tips/tips2.dart';

class MenuTips extends StatelessWidget {
  const MenuTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 196, 251, 223),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            size: 30,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      backgroundColor: tPrimaryColor4,
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(tWelcomeScreen2Image),
              height: size.height * 0.4,
            ),

            /*Expanded(
                  child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    backgroundColor: tDarkColor,
                    side: BorderSide(color: tSecondaryColor),
                    padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
                child: Text(
                  tips1.toUpperCase(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              )),
              const SizedBox(
                height: 10.0,
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
                        tips2.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ))),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    backgroundColor: tDarkColor,
                    side: BorderSide(color: tSecondaryColor),
                    padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
                child: Text(
                  tips1.toUpperCase(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              )),
              const SizedBox(
                height: 10.0,
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
                        tips2.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ))),*/
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => tipsPage()));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 0),
                width: size.width / 0.5,
                height: size.height / 13,
                decoration: BoxDecoration(
                  color: tPrimaryColor5,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                  "Tips Menjaga Kesehatan Mental",
                  style: Theme.of(context).textTheme.headline1,
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => tips2Page()));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 0),
                width: size.width / 0.5,
                height: size.height / 13,
                decoration: BoxDecoration(
                  color: tPrimaryColor5,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                  "Tips Efektif Meningkatkan Minat Belajar",
                  style: Theme.of(context).textTheme.headline1,
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => tips3Page()));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 0),
                width: size.width / 0.5,
                height: size.height / 13,
                decoration: BoxDecoration(
                  color: tPrimaryColor5,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                  "Tips Berprestasi Di Sekolah",
                  style: Theme.of(context).textTheme.headline1,
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => tips4Page()));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 0),
                width: size.width / 0.5,
                height: size.height / 13,
                decoration: BoxDecoration(
                  color: tPrimaryColor5,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                  "Tips Menjadi Siswa yang Aktif di Sekolah",
                  style: Theme.of(context).textTheme.headline1,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
