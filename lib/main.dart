import 'package:dollar_pay/components/AppButtons.dart';
import 'package:dollar_pay/components/YourLocations.dart';
import 'package:dollar_pay/constant/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: YourLocations(screenHeight:height ,screenWidth:width, subTitle: 'Ülke | İl', title: 'Location #1' ,)     
     /*  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: AppButtons(
          textColor: Colors.white,
          backgroundColor: appColor.redRadish,
          borderColor: appColor.redRadish,
          text: "Hi guys",
          borderRadius: 50,
          width: width * 0.8,
          height: 50,
          iconData: Icons.qr_code,
          isIcon: true,
        ),
      ), */
    );
  }
}
