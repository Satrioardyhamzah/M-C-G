import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:firebasechat/common/utils/security.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebasechat/common/entities/entities.dart';
import 'package:firebasechat/common/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  ChatController();
  ChatState state = ChatState();
  var doc_id = null;
  final textController = TextEditingController();
  ScrollController msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();
  final user_id = UserStore.to.token;
  var user_profile = UserStore.to.profile;
  final db = FirebaseFirestore.instance;
  var listener;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile();
    } else {
      print("No image selected");
    }
  }

  Future getImgUrl(String name) async {
    //dipake
    print("...my image name is $name..");
    final spaceRef = FirebaseStorage.instance.ref("chat").child(name);
    var str = await spaceRef.getDownloadURL();
    return str; //??"";
  }

  sendImageMessage(String url) async {
    final content = Msgcontent(
        uid: user_id, content: url, type: "image", addtime: Timestamp.now());

    await FirebaseFirestore.instance
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgcontent, options) =>
                msgcontent.toFirestore())
        .add(content)
        .then((DocumentReference doc) {
      print("Document snapshot added with id, ${doc.id}");
    });
    await FirebaseFirestore.instance.collection("message").doc(doc_id).update({
      "last_msg": "Sent a photo.", //"【image】",
      "last_time": Timestamp.now()
    });
    var userbase = await FirebaseFirestore.instance
        .collection("users")
        .withConverter(
          fromFirestore: UserData.fromFirestore,
          toFirestore: (UserData userdata, options) => userdata.toFirestore(),
        )
        .where("id", isEqualTo: state.to_uid.value)
        .get();
    if (userbase.docs.isEmpty) {
      var title = "Message made by ${user_profile.displayName}";
      var body = "Sent a photo."; //"【image】";
      var token = userbase.docs.first.data().fcmtoken;
      if (token != null) {
        //sendNotification(title, body, token);
      }
    }
  }

  Future uploadFile() async {
    //dipake
    if (_photo == null) return;
    final fileName = getRandomString(15) + extension(_photo!.path);
    try {
      final ref = FirebaseStorage.instance.ref("chat").child(fileName);

      ref.putFile(_photo!).snapshotEvents.listen((event) async {
        switch (event.state) {
          case TaskState.running:
            print("...uploading file ${fileName}");
            break;

          case TaskState.paused:
            print("...uploading file paused ${fileName}");
            break;
          case TaskState.success:
            String imgUrl = await getImgUrl(fileName);
            sendImageMessage(imgUrl);
            print("...uploading file succeed ${fileName}");
            break;
          case TaskState.error:
            print("...uploading file error ${fileName}");
            // ...
            //toastInfo(msg:"upload image error");
            break;
          case TaskState.canceled:
            print("...uploading file canceled ${fileName}");
            break;
        }
      });
    } catch (e) {
      print("There's an error $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    print(data);
    doc_id = data['doc_id'] ?? "";
    state.to_uid.value = data['to_uid'] ?? "";
    state.to_name.value = data['to_name'] ?? "";
    state.to_avatar.value = data['to_avatar'] ?? "";
  }

  sendMessage() async {
    String sendContent = textController.text;
    final content = Msgcontent(
        uid: user_id,
        content: sendContent,
        type: "text",
        addtime: Timestamp.now());
    await FirebaseFirestore.instance
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgcontent, options) =>
                msgcontent.toFirestore())
        .add(content)
        .then((DocumentReference doc) {
      print("Document snapshot added with id, ${doc.id}");
      textController.clear();
      Get.focusScope?.unfocus();
    });
    await FirebaseFirestore.instance
        .collection("message")
        .doc(doc_id)
        .update({"last_msg": sendContent, "last_time": Timestamp.now()});
    var fcmid = await db
        .collection("users")
        .where("id", isEqualTo: state.to_uid.value)
        .get();
    var userbase = await FirebaseFirestore.instance
        .collection("users")
        .withConverter(
          fromFirestore: UserData.fromFirestore,
          toFirestore: (UserData userdata, options) => userdata.toFirestore(),
        )
        .where("id", isEqualTo: state.to_uid.value)
        .get();
    print("userbase-------");
    print(userbase.docs.first.data());
    if (userbase.docs.isNotEmpty) {
      var title = "Message made by ${user_profile.displayName}";
      var body = sendContent;
      var token = userbase.docs.first.data().fcmtoken;
      print(token);
      if (token != null) {
        sendNotification(title, body, token);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
    var messages = FirebaseFirestore.instance
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
            fromFirestore: Msgcontent.fromFirestore,
            toFirestore: (Msgcontent msgcontent, options) =>
                msgcontent.toFirestore())
        .orderBy("addtime", descending: false);
    state.msgcontentList.clear();
    listener = messages.snapshots().listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            if (change.doc.data() != null) {
              state.msgcontentList.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            break;

          case DocumentChangeType.removed:
            break;
        }
      }
    }, onError: (error) => print("Listen failed:  $error"));

    getLocation();
  }

  getLocation() async {
    try {
      var user_location = await FirebaseFirestore.instance
          .collection("users")
          .where("id", isEqualTo: state.to_uid.value)
          .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userdata, options) =>
                  userdata.toFirestore())
          .get();
      var location = user_location.docs.first.data().location;
      if (location != "") {
        state.to_location.value = location ?? "unknown";
      } else {}
    } catch (e) {
      print("We have error $e");
    }
  }

  Future<void> sendNotification(String title, String body, String token) async {
    final String url = 'https://fcm.googleapis.com/fcm/send';
    var IosNotification = {
      "data": {
        "doc_id": "${doc_id}",
        "to_uid": "${user_id}",
        "to_name": "${user_profile.displayName}",
        "to_avatar": "${user_profile.photoUrl}"
      },
      "notification": {
        "body": "${body}",
        "title": "${title}",
        "content_available": true,
        "mutable_content": true,
        "sound": "task_cancel.caf",
        "badge": 1
      },
      "to": "${token}"
    };
    String IosNotificationJson = jsonEncode(IosNotification);

    // android
    var AndroidNotification = {
      "data": {
        "doc_id": "${doc_id}",
        "to_uid": "${user_id}",
        "to_name": "${user_profile.displayName}",
        "to_avatar": "${user_profile.photoUrl}"
      },
      "notification": {
        "body": "${body}",
        "title": "${title}",
        "android_channel_id": "M-CG",
        "sound": "default",
      },
      "to": "${token}"
    };

    String AndroidNotificationJson = jsonEncode(AndroidNotification);

    var notification;
    notification = '{"notification": {"body": "${body}", '
        '"title": "${title}",'
        ' "content_available": "true"},'
        ' "priority": "high", '
        ' "to": "${token}",'
        ' "sound":"default",'
        ' "data":{"to_uid": "${user_id}", '
        ' "doc_id": "${doc_id}", '
        ' "to_name": "${user_profile.displayName}", '
        ' "to_avatar": "${user_profile.photoUrl}"}, '
        '}';
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Keep-Alive": "timeout=5",
          "Authorization":
              "key=AAAAmRFPePg:APA91bEt0F84XCQ9Sh8U05BbrwUFbmOjY-u2T3NXj9KLe-iL0A0_4TOnGWWq9R2cme3d0xzamswcNYGs3Vt67gbEy5s6BDfugM83VP7IaUyBB_GRJJgKTqeJBsCtv1XOw4f5UALdfaUw"
        },
        body:
            GetPlatform.isIOS ? IosNotificationJson : AndroidNotificationJson);
    print(response.body);
  }

  @override
  void dispose() {
    msgScrolling.dispose();
    listener.cancel();
    super.dispose();
  }
}
