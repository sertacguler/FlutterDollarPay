import 'package:flutter/material.dart';
import 'DialogActionsEnum.dart';
import 'DialogButton.dart/MyLinkButtonForDialog.dart';
import 'DialogButton.dart/MyTextButtonForDialog.dart';

class Dialogs {
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
          title: Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              )),
          content: Text(body,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
              )),
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
}

/*

final action = await Dialogs.dialog(
    context, // Context
    '', // Title
    'Shell will be added to your locations', // Content
    'Yes, add this location', // firstButton
    'Cancel'); // secondButton
                    if (action == DialogAction.yes) {
                      setState(() => tappedYes = true);
                    } else {
                      setState(() => tappedYes = false);
                    }

 */