import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

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
            Center(child: myTextButton(context, DialogAction.yes, firstButton)),
            Center(
              child: secondButton.isNotEmpty
                  ? myLinkButton(context, DialogAction.abort, secondButton)
                  : const Padding(padding: EdgeInsets.only(top: 20.0)),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}

Widget myTextButton(BuildContext context, DialogAction selected, String name) {
  return Container(
      child: SizedBox(
          width: 275,
          height: 60,
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(241, 46, 65, 1.0)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: const BorderSide(
                            color: Color.fromRGBO(241, 46, 65, 1.0))))),
            onPressed: () => Navigator.of(context).pop(selected),
            child: Text(name,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                )),
          )));
}

Widget myLinkButton(BuildContext context, DialogAction selected, String name) {
  return Container(
      child: SizedBox(
          width: 275,
          height: 60,
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(241, 46, 65, 1.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: const BorderSide(color: Colors.white)))),
            onPressed: () => Navigator.of(context).pop(selected),
            child: Text(name,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                )),
          )));
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