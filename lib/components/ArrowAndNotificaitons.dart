
import 'package:flutter/material.dart';

class ArrowAndNotifications extends StatelessWidget {
  const ArrowAndNotifications({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * .075,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          SizedBox(
            width: screenWidth * .7,
          ),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notification_add,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
