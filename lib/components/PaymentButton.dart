import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dollar_pay/constant/colors.dart';
import 'package:dollar_pay/constant/textFontSize.dart';

class PaymentButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final double borderRadius;
  double width;
  double height;
  final Function() onTap;
  PaymentButton({
    Key? key,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.onTap,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          child: OnlyText(text: text, textColor: textColor, onTap: onTap),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor, width: 1.0)),
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
