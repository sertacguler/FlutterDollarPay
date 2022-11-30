import 'package:dollar_pay/constant/colors.dart';
import 'package:flutter/material.dart';
import 'DialogActionsEnum.dart';
import 'DialogButton.dart/MyLinkButtonForDialog.dart';
import 'DialogButton.dart/MyTextButtonForDialog.dart';

class DialogWithWidget {
  static Future<DialogAction> dialog(BuildContext context, String title,
      String body, String firstButton, String secondButton) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: SizedBox(
            width: 0,
            height: 0,
          ),
          content: _Content(body),
          actions: <Widget>[
            Center(
                child: MyTextButtonForDialog(
                    context, DialogAction.yes, firstButton)),
            Center(
              child: secondButton.isNotEmpty
                  ? MyLinkButtonForDialog(
                      context, DialogAction.abort, secondButton)
                  : const Padding(padding: EdgeInsets.only(top: 20.0)),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }

  static Row _Content(String body) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline_outlined,
          color: appColor.redRadish,
          size: 40.0,
        ),
        Padding(padding: EdgeInsets.only(right: 5)),
        Text(body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
            )),
      ],
    );
  }
}
