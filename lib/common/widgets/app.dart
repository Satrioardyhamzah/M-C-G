import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebasechat/common/values/values.dart';

///  AppBar
AppBar transparentAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(185, 105, 66, 190),
        Color.fromARGB(185, 72, 20, 114),
        Color.fromARGB(248, 1, 3, 59),
        Color.fromARGB(182, 211, 39, 39),
      ], transform: GradientRotation(90))),
    ),
    title: title != null ? Center(child: title) : null,
    leading: leading,
    actions: actions,
  );
}

Widget divider10Px({Color bgColor = AppColors.secondaryElement}) {
  return Container(
    height: 10.w,
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
