import 'package:flutter/material.dart';
import 'DialogActionsEnum.dart';
import 'package:dollar_pay/components/Dialog/ShowDialog.dart';

class HowToUseDialog extends StatelessWidget {
  const HowToUseDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool tappedYes = false;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.amber,
          ),
        ),
        Expanded(
            flex: 6,
            child: Column(children: [
              ElevatedButton(
                  child: Text('Dialog 1'),
                  onPressed: () async {
                    final action = await Dialogs.dialog(
                        context,
                        '',
                        'Shell will be added to your locations',
                        'Yes, add this location',
                        'Cancel');
                    if (action == DialogAction.yes) {
                      setState(() => tappedYes = true);
                    } else {
                      setState(() => tappedYes = false);
                    }
                  }),
              ElevatedButton(
                  child: Text('Dialog 2'),
                  onPressed: () async {
                    final action = await Dialogs.dialog(
                        context,
                        'Your limit will be increased to \$50,00',
                        'Are you sure?',
                        "Yes I'am Sure",
                        "Cancel");
                    if (action == DialogAction.yes) {
                      setState(() => tappedYes = true);
                    } else {
                      setState(() => tappedYes = false);
                    }
                  }),
              ElevatedButton(
                  child: Text('Dialog 3'),
                  onPressed: () async {
                    final action = await Dialogs.dialog(
                        context,
                        '',
                        'An error occurred while collecting the amount',
                        "close",
                        "");
                    if (action == DialogAction.yes) {
                      setState(() => tappedYes = true);
                    } else {
                      setState(() => tappedYes = false);
                    }
                  })
            ])),
      ],
    )));
  }
}
