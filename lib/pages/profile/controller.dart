import 'dart:convert';
import 'package:firebasechat/common/entities/entities.dart';
import 'package:firebasechat/common/routes/names.dart';
import 'package:firebasechat/pages/profile/state.dart';
import 'package:firebasechat/pages/sign_in/controller.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../common/services/storage.dart';
import '../../common/store/user.dart';
import '../../common/values/storage.dart';

class ProfileController extends GetxController {
  final ProfileState state = ProfileState();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    'email','https://www.googleapis.com/auth/contacts.readonly'
  ]);

  asyncLoadAllData() async {
    String profile = await UserStore.to.getProfile();
    if (profile.isNotEmpty) {
      UserLoginResponseEntity userdata =
          UserLoginResponseEntity.fromJson(jsonDecode(profile));
      state.head_detail.value = userdata;
    }
  }

  Future<void> onLogOut() async {
    var type = utf8.encode(StorageService.to.getString(STORAGE_USER_TYPE));
    var googleType = utf8.encode("google");
    if (type.toString() == googleType.toString()) {
      await SignInController.to.signOut();
    } else {
      await FacebookAuth.instance.logOut();
    }

    UserStore.to.onLogout();

    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

  @override
  void onInit() {
    super.onInit();
    asyncLoadAllData();
    List MyList = [
      {"name": "About The School","icon": "assets/icons/5.png","route": "/help"},
      {"name": "Organisasi","icon": "assets/icons/4.png","route": "/organisasi"},
      {"name": "Ekstrakurikuler","icon": "assets/icons/6.png","route": "/ekstrakurikuler"},
      {"name": "Tips", "icon": "assets/icons/2.png", "route": "/tips"},
      {"name": "Logout", "icon": "assets/icons/7.png", "route": "/logout"},
    ];

    for (int i = 0; i < MyList.length; i++) {
      MeListItem result = MeListItem();
      result.icon = MyList[i]["icon"];
      result.name = MyList[i]["name"];
      result.route = MyList[i]["route"];
      state.meListItem.add(result);
    }
  }
}
