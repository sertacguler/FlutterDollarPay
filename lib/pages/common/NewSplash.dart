import 'dart:async';
import 'dart:math';
import 'package:dollar_pay/constant/colors.dart';
import 'package:dollar_pay/pages/common/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewSplash extends StatefulWidget {
  const NewSplash({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

var assetsImage = new AssetImage('assets/svg/DollarPayLogo.svg');
var image = new Image(image: assetsImage, fit: BoxFit.cover);

class _SplashScreenState extends State<NewSplash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 1);
    return Timer(_duration, () {
      Get.to(LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(children: [
      Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/icons/DollarPayLogo.png',
            fit: BoxFit.scaleDown,
          )),
      Positioned(
          bottom: -175,
          child: Image.asset('assets/icons/g.png', fit: BoxFit.fitWidth)),
    ])));
  }
}
