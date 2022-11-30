import 'package:dollar_pay/pages/user/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Edit extends StatelessWidget {
  const Edit({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.to(() => UserInfo());
        },
        icon: SvgPicture.asset("assets/svg/EditButton.svg"));
  }
}
