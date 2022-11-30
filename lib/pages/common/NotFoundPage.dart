import 'package:dollar_pay/components/AppBar/AppBar.dart';
import 'package:dollar_pay/components/AppButtons.dart';
import 'package:dollar_pay/constant/colors.dart';
import 'package:dollar_pay/constant/textFontSize.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: const AppBarCustom(),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 125,
                  height: 125,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: appColor.redRadish,
                  ),
                  child: Stack(children: [
                    Center(
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 5.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: Icon(
                        Icons.close,
                        size: 50,
                        color: appColor.white,
                        opticalSize: 55,
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: height * .03,
                ),
                const Text(
                  "Not Found!",
                  style: TextStyle(
                      color: appColor.redRadish,
                      fontWeight: FontWeight.w600,
                      fontSize: 45),
                ),
                SizedBox(
                  height: height * .05,
                ),
                Text(
                  "This page does not exist",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: textFontSize.header2FontSize),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "or",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: textFontSize.header2FontSize),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "has not been designed",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: textFontSize.header2FontSize),
                ),
                SizedBox(
                  height: height * .05,
                ),
                AppButtons(
                  textColor: appColor.white,
                  backgroundColor: appColor.faintingLight,
                  borderColor: appColor.faintingLight,
                  text: "Go Back",
                  width: 135,
                  height: 50,
                  borderRadius: 30,
                  onTap: () {},
                )
              ]),
        ));
  }
}
