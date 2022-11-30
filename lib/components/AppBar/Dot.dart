import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: null,
        icon: Icon(
          Icons.more_horiz,
          color: Colors.black,
        ));
  }
}
