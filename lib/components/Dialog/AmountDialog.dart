import 'package:dollar_pay/constant/colors.dart';
import 'package:flutter/material.dart';
import 'DialogActionsEnum.dart';
import 'DialogButton.dart/MyTextButtonForDialog.dart';

class AmountDialog {
  static Future<DialogAction> dialog(BuildContext context, String title,
      String body, String firstButton) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              )),
          content: Text(body,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                color: appColor.green,
              )),
          actions: <Widget>[
            Center(
                child: MyTextButtonForDialog(
                    context, DialogAction.yes, firstButton)),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}
