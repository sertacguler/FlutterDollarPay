import 'package:flutter/material.dart';
import 'package:dollar_pay/constant/colors.dart';

class TextFieldCustomForPassword extends StatefulWidget {
  TextFieldCustomForPassword({
    Key? key,
    required this.hintText,
    required this.showPassword,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool showPassword;

  @override
  State<TextFieldCustomForPassword> createState() => _MyAppState();
}

class _MyAppState extends State<TextFieldCustomForPassword> {
  bool showPassword = false;
  @override
  void initState() {
    showPassword = widget.showPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: widget.controller,
        obscureText: showPassword,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          hintText: widget.hintText,
          //contentPadding: EdgeInsets.only(left: 20, top: 15.0),
          filled: true,
          fillColor: Color.fromARGB(255, 245, 245, 245),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}


/**
        suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child: Icon(
                showPassword
                    ? const IconData(0xe51c, fontFamily: 'MaterialIcons')
                    : const IconData(0xf2ff, fontFamily: 'MaterialIcons'),
                size: 32.0,
                color: appColor.black,
              ),
            ),
          ),
 */