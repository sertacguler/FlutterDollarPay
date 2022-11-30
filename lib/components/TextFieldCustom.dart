import 'package:flutter/material.dart';

Widget TextFieldCustom(
    {required String hintText, TextEditingController? controller}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 20),
          filled: true,
          fillColor: Color.fromARGB(255, 245, 245, 245),
          border: UnderlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}
