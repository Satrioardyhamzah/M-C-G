import 'package:flutter/material.dart';
import 'package:firebasechat/common/routes/routes.dart';
import 'package:firebasechat/common/store/store.dart';
import 'package:get/get.dart';

/// first time open
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority the smaller the more important
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    print(ConfigStore.to.isFirstOpen);
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.Application);
    } else {
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
