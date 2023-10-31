import 'package:firebasechat/common/routes/names.dart';
import 'package:firebasechat/common/store/config.dart';
import 'package:firebasechat/pages/welcome/state.dart';
import 'package:get/get.dart';



class WelcomeController extends GetxController{
  final state = WelcomeState();
  WelcomeController();
  
  changePage(int index) async{
    state.index.value = index;
  }

  handleSignIn(String s) async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
  
}