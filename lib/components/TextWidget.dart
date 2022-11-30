import 'package:flutter/material.dart';

Widget HeaderTextWidget(String _text, double _fontSize, FontWeight w,
    TextAlign textAlign, double width) {
  return Container(
    width: width == null ? 375 : width, //double.infinity,
    child: Text(
      _text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: _fontSize,
          color: Colors.black,
          fontFamily: "poppins",
          fontWeight: w),
    ),
  );
}

Widget TextWidget(String _text, double _fontSize, FontWeight w, double width) {
  return Container(
    margin: const EdgeInsets.only(left: 30),
    width: width, //double.infinity,
    child: Text(
      _text,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontSize: _fontSize,
          color: Colors.black,
          fontFamily: "poppins",
          fontWeight: w),
    ),
  );
}
