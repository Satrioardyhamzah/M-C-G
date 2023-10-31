import 'package:firebasechat/common/entities/entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../../../common/routes/names.dart';

Widget ChatRightItem(Msgcontent item) {
  return Container(
    padding: EdgeInsets.only(top: 10.w, left: 15.w, right: 15.w, bottom: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 230.w, minHeight: 40.w),
            child: Container(
                margin: EdgeInsets.only(right: 10.w, top: 0.w),
                padding: EdgeInsets.only(
                  top: 10.w,
                  left: 10.w,
                  right: 10.w,
                ),
                decoration: item.type == "text"
                    ? BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 159, 235, 228),
                            Color.fromARGB(255, 225, 205, 250),
                            Color.fromARGB(255, 187, 183, 245),
                            Color.fromARGB(255, 151, 243, 203),
                          ],
                          transform: GradientRotation(90),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.w)))
                    : const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                child: item.type == "text"
                    ? Text("${item.content}")
                    : ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 90.w,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.Photoimgview,
                                parameters: {"url": item.content ?? ""});
                          },
                          child: CachedNetworkImage(
                            imageUrl: "${item.content}",
                          ),
                        ),
                      )))
      ],
    ),
  );
}
