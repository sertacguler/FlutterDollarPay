import 'package:dollar_pay/constant/colors.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({Key? key, this.actionsButton}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(50);

  final Widget? actionsButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(true),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      actions: actionsButton == null ? null : <Widget>[actionsButton!],
    );
  }
}
