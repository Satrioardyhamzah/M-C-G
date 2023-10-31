import 'package:firebasechat/pages/message/photoview/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import '../../../common/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoImageView extends GetView<PhotoImageViewController> {
  const PhotoImageView({Key? key}) : super(key: key);
  AppBar _buildAppbar() {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.secondaryElement,
        ),
      ),
      title: Text(
        "Photoview",
        style: TextStyle(
          height: 2,
          color: Color.fromARGB(255, 246, 246, 255),
          fontFamily: 'Avenir',
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(controller.state.url.value),
        ),
      ),
    );
  }
}
