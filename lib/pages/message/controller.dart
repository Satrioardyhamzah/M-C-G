import 'package:firebasechat/common/entities/entities.dart';
import 'package:firebasechat/common/store/store.dart';
import 'package:firebasechat/common/utils/http.dart';
import 'package:firebasechat/pages/message/state.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:location/location.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../common/entities/msg.dart';

class MessageController extends GetxController {
  MessageController();
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  final MessageState state = MessageState();
  var listener;

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void onReady() {
    super.onReady();
    getUserLocation();
    getFcmToken();
    snapshotsListen();
  }

  asyncLoadAllData() async {
    var from_message = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("from_uid", isEqualTo: token)
        .get();

    var to_messages = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("to_uid", isEqualTo: token)
        .get();
    state.msgList.clear();
    if (from_message.docs.isNotEmpty) {
      state.msgList.addAll(from_message.docs);
    }

    if (to_messages.docs.isNotEmpty) {
      state.msgList.addAll(to_messages.docs);
    }
    // sort
    state.msgList.value.sort((a, b) {
      if (b.data().last_time == null) {
        return 0;
      }
      if (a.data().last_time == null) {
        return 0;
      }
      return b.data().last_time!.compareTo(a.data().last_time!);
    });
  }

  snapshotsListen() async {
    var from_message = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("from_uid", isEqualTo: token);
    from_message.snapshots().listen((event) {
      asyncLoadAllData();
    }, onError: (error) => print("Listen failed:  $error"));
    var to_messages = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("to_uid", isEqualTo: token);
    to_messages.snapshots().listen((event) {
      asyncLoadAllData();
    }, onError: (error) => print("Listen failed:  $error"));
  }

  getUserLocation() async {
    try {
      final location = await Location().getLocation();
      String address = "${location.latitude}, ${location.longitude}";
      String url =
          "https://maps.googleapis.com/maps/api/geocode/json?address=${address}&key=AIzaSyCMESvjp3G5FtPnukZ28_GVOuFSvEhSS9c";
      var response = await HttpUtil().get(url);
      MyLocation location_res = MyLocation.fromJson(response);
      if (location_res.status == "OK") {
        String? myaddresss = location_res.results?.first.formattedAddress;
        if (myaddresss != null) {
          var user_location =
              await db.collection("users").where("id", isEqualTo: token).get();
          if (user_location.docs.isNotEmpty) {
            var doc_id = user_location.docs.first.id;
            await db
                .collection("users")
                .doc(doc_id)
                .update({"location": myaddresss});
          }
        }
      }
    } catch (e) {
      print("Getting error $e");
    }
  }

  getFcmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("...my token is $fcmToken...");
    if (fcmToken != null) {
      var user =
          await db.collection("users").where("id", isEqualTo: token).get();
      if (user.docs.isNotEmpty) {
        var doc_id = user.docs.first.id;
        await db.collection("users").doc(doc_id).update({"fcmtoken": fcmToken});
      }
    }
    await FirebaseMessaging.instance.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("..................onMessage................");
      print(
          "onMessage: ${message.notification?.title}/${message.notification?.body}");
      print("message.data------------");
      print(message.data);
      //   HelperNotification.showNotification(message.notification!.title!, message.notification!.body!);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(
          "onOpenApp: ${message.notification?.title}/${message.notification?.body}");
      print("message.data------------");
      print(message.data);
      if (message.data != null) {
        var to_uid = message.data["to_uid"];
        var to_name = message.data["to_name"];
        var to_avatar = message.data["to_avatar"];
        var doc_id = message.data['doc_id'];
        Get.toNamed("/chat", parameters: {
          "doc_id": doc_id,
          "to_uid": to_uid,
          "to_name": to_name,
          "to_avatar": to_avatar
        });
      }
    });
  }
}
