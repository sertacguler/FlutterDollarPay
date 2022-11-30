import 'package:flutter/material.dart';
import '../DialogActionsEnum.dart';

Widget MyLinkButtonForDialog(
    BuildContext context, DialogAction selected, String name) {
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
