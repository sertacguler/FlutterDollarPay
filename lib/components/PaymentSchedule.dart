import 'package:flutter/material.dart';
import 'package:dollar_pay/constant/colors.dart';
import 'package:get/get.dart';
import 'PaymentButton.dart';

class PaymentSchedule extends StatefulWidget {
  final void Function(String value) onValueChanged;

  const PaymentSchedule(
      {super.key, required this.width, required this.onValueChanged});

  final double width;

  @override
  State<StatefulWidget> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<PaymentSchedule> {
  Controller c = Get.put(Controller());
  bool _7active = false;
  bool _15active = true;
  bool _30active = false;
  changeColor(String type) {
    widget.onValueChanged(type);
    setState(() {
      switch (type) {
        case '7':
          _7active = true;
          _15active = false;
          _30active = false;
          break;
        case '15':
          _7active = false;
          _15active = true;
          _30active = false;
          break;
        case '30':
          _7active = false;
          _15active = false;
          _30active = true;
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 60,
            width: widget.width * .9,
            decoration: BoxDecoration(
                color: appColor.darkGrey,
                borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              Container(
                  child: PaymentButton(
                      textColor: _7active ? appColor.white : appColor.black,
                      backgroundColor:
                          _7active ? appColor.redRadish : appColor.darkGrey,
                      borderColor:
                          _7active ? appColor.redRadish : appColor.darkGrey,
                      text: "7 Days",
                      width: widget.width * .30,
                      height: 60,
                      borderRadius: 20,
                      onTap: () => changeColor('7'))),
              Container(
                  child: PaymentButton(
                      textColor: _15active ? appColor.white : appColor.black,
                      backgroundColor:
                          _15active ? appColor.redRadish : appColor.darkGrey,
                      borderColor:
                          _15active ? appColor.redRadish : appColor.darkGrey,
                      text: "15 Days",
                      width: widget.width * .30,
                      height: 60,
                      borderRadius: 20,
                      onTap: () => changeColor('15'))),
              Container(
                  child: PaymentButton(
                      textColor: _30active ? appColor.white : appColor.black,
                      backgroundColor:
                          _30active ? appColor.redRadish : appColor.darkGrey,
                      borderColor:
                          _30active ? appColor.redRadish : appColor.darkGrey,
                      text: "30 Days",
                      width: widget.width * .30,
                      height: 60,
                      borderRadius: 20,
                      onTap: () => changeColor('30')))
            ]))
      ],
    );
  }
}

class Controller extends GetxController {
  RxInt log2 = 0.obs;

  void change() => log2.value++;
}
