import 'package:dollar_pay/constant/colors.dart';
import 'package:flutter/material.dart';

class TextFieldCreator extends StatelessWidget {
  final String hintText;

  const TextFieldCreator({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
            hintText: "asdas",
            contentPadding: EdgeInsets.only(left: 20),
            filled: true,
            fillColor: appColor.white,
            border: UnderlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
