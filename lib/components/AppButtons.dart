import 'package:dollar_pay/constant/colors.dart';
import 'package:dollar_pay/constant/textFontSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButtons extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final double borderRadius;
  IconData? iconData;
  bool isIcon;
  double width;
  double height;
  final Function() onTap;
  AppButtons({
    Key? key,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
    required this.width,
    required this.height,
    this.iconData,
    this.isIcon = false,
    required this.borderRadius,
    required this.onTap,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          child: isIcon
              ? TextWithIcon(
                  text: text,
                  textColor: textColor,
                  iconData: iconData!,
                  onTap: onTap)
              : OnlyText(text: text, textColor: textColor, onTap: onTap),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor, width: 1.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 5,
                    offset: Offset(0.0, 15.0))
              ]),
        ));
  }
}

class OnlyText extends StatelessWidget {
  const OnlyText({
    super.key,
    required this.text,
    required this.textColor,
    required this.onTap,
  });

  final String text;
  final Color textColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: textColor,
                  fontSize: textFontSize.header1FontSize,
                ),
              )),
        ],
      ),
    );
  }
}

class TextWithIcon extends StatelessWidget {
  const TextWithIcon({
    super.key,
    required this.text,
    required this.textColor,
    required this.iconData,
    required this.onTap,
  });

  final String text;
  final Color textColor;
  final IconData iconData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: appColor.white),
          SizedBox(
            width: 10,
          ),
          Text(text,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: textColor,
                  fontSize: textFontSize.baseFontSize,
                ),
              ))
        ],
      ),
    );
  }
}
