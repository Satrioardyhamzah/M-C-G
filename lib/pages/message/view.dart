import 'package:firebasechat/common/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat/widgets/message_list.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return transparentAppBar(
        title: Text(
      "Message",
      style: TextStyle(
          color: AppColors.primaryBackground,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: MessageList(),
    );
  }
}
