import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  String? text;
  String? textFalse;
  SwitchButton({Key? key, required this.text, required this.textFalse})
      : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButton();
}

class _SwitchButton extends State<SwitchButton> {
  bool _isSwitched = false;

  _SwitchButtonText() {
    if (widget.textFalse == null)
      return Text(widget.text!);
    else
      return _isSwitched ? Text(widget.text!) : Text(widget.textFalse!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Switch(
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
            activeColor: Colors.white,
            activeTrackColor: Colors.red,
          ),
          widget.text != null ? _SwitchButtonText() : Container()
        ],
      ),
    );
  }
}
