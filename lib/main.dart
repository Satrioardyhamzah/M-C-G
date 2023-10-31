import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasechat/Detail/ekstrakurikuler.dart';
import 'package:firebasechat/common/services/services.dart';
import 'package:firebasechat/common/store/user.dart';
import 'package:firebasechat/common/store/config.dart';
import 'package:firebasechat/firebase_options.dart';
import 'package:firebasechat/splashscreens/splashscreen.dart';
import 'package:firebasechat/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebasechat/common/routes/pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebasechat/Detail/detailpage.dart';
import 'package:firebasechat/common/utils/firebase_messaging_handler.dart';

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  print("onBackground: ${message.notification?.title}/${message.notification?.body}");
}
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<ConfigStore>(ConfigStore());
  Get.put<UserStore>(UserStore());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, 
  );
  
  
  //await HelperNotification.initialize();
  await FirebaseMessaging.instance. getInitialMessage();
  try {
    //if (GetPlatform.isMobile) {

     await HelperNotification.initialize();
      FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
    
  }catch(e) {
    print("... could not init messaging $e");
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the
  // root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child)=>GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MC&G',
        //home: SplashScreen(),
        theme: TAppTheme.lightTheme,
        themeMode: ThemeMode.system,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        //home: ekstrakurikulerPage(),
      ),

    );
  }
}
