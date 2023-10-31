import 'package:firebasechat/common/entities/entities.dart';
import 'package:firebasechat/common/routes/names.dart';
import 'package:firebasechat/common/store/store.dart';
import 'package:firebasechat/common/widgets/toast.dart';
import 'package:firebasechat/pages/welcome/state.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignInController extends GetxController {
  static SignInController get to => SignInController();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

  final state = SignInState();
  SignInController();
  final db = FirebaseFirestore.instance;

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "google") {
        var user = await _googleSignIn.signIn();
        print("user-----------------");
        print(user);
        if (user != null) {
          final _gAuthentication = await user.authentication;
          final _credential = GoogleAuthProvider.credential(
              idToken: _gAuthentication.idToken,
              accessToken: _gAuthentication.accessToken);

          await FirebaseAuth.instance.signInWithCredential(_credential);

          String displayName = user.displayName ?? user.email;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? "";
          UserLoginResponseEntity userProfile = UserLoginResponseEntity();
          userProfile.email = email;
          userProfile.accessToken = id;
          userProfile.displayName = displayName;
          userProfile.photoUrl = photoUrl;
          userProfile.type = "google";

          UserStore.to.saveProfile(userProfile);
          var userbase = await db
              .collection("users")
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userdata, options) =>
                    userdata.toFirestore(),
              )
              .where("id", isEqualTo: id)
              .get();

          if (userbase.docs.isEmpty) {
            final data = UserData(
                id: id,
                name: displayName,
                email: email,
                photourl: photoUrl,
                location: "",
                fcmtoken: "",
                addtime: Timestamp.now());
            await db
                .collection("users")
                .withConverter(
                  fromFirestore: UserData.fromFirestore,
                  toFirestore: (UserData userdata, options) =>
                      userdata.toFirestore(),
                )
                .add(data);
          }
          toastInfo(msg: "login success");
          Get.offAndToNamed(AppRoutes.Application);
        }
      } else if (type == "facebook") {
        var auth = await signInWithFacebook();
        if (auth.user != null) {
          String? displayName = auth.user?.displayName;
          String? email = auth.user?.email;
          String? id = auth.user?.uid;
          String? photoUrl = auth.user?.photoURL ?? "";
          UserLoginResponseEntity userProfile = UserLoginResponseEntity();
          userProfile.email = email;
          userProfile.accessToken = id;
          userProfile.displayName = displayName;
          userProfile.photoUrl = photoUrl;
          userProfile.type = "facebook";

          UserStore.to.saveProfile(userProfile);
          var userbase = await db
              .collection("users")
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userdata, options) =>
                    userdata.toFirestore(),
              )
              .where("id", isEqualTo: id)
              .get();

          if (userbase.docs.isEmpty) {
            final data = UserData(
                id: id,
                name: displayName,
                email: email,
                photourl: photoUrl,
                location: "",
                fcmtoken: "",
                addtime: Timestamp.now());
            await db
                .collection("users")
                .withConverter(
                  fromFirestore: UserData.fromFirestore,
                  toFirestore: (UserData userdata, options) =>
                      userdata.toFirestore(),
                )
                .add(data);
          }
          toastInfo(msg: "login success");
          Get.offAndToNamed(AppRoutes.Application);
        }
      } else {
        var auth = await signInWithApple();
        if (auth.user != null) {
          String? displayName = "apple_user";
          String? email = "apple@email.com";
          String? id = auth.user?.uid;
          String? photoUrl = auth.user?.photoURL ?? "";
          UserLoginResponseEntity userProfile = UserLoginResponseEntity();
          userProfile.email = email;
          userProfile.accessToken = id;
          userProfile.displayName = displayName;
          userProfile.photoUrl = photoUrl;
          userProfile.type = "apple";

          UserStore.to.saveProfile(userProfile);
          var userbase = await db
              .collection("users")
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userdata, options) =>
                    userdata.toFirestore(),
              )
              .where("id", isEqualTo: id)
              .get();

          if (userbase.docs.isEmpty) {
            final data = UserData(
                id: id,
                name: displayName,
                email: email,
                photourl: photoUrl,
                location: "",
                fcmtoken: "",
                addtime: Timestamp.now());
            await db
                .collection("users")
                .withConverter(
                  fromFirestore: UserData.fromFirestore,
                  toFirestore: (UserData userdata, options) =>
                      userdata.toFirestore(),
                )
                .add(data);
          }
          toastInfo(msg: "login success");
          Get.offAndToNamed(AppRoutes.Application);
        }
      }
    } catch (e) {
      toastInfo(msg: "login error");
      print(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("User is currently logged out");
      } else {
        print("User is logged in");
      }
    });
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
