import 'package:dollar_pay/constant/colors.dart';
import 'package:flutter/material.dart';


class PhotoBuilder extends StatelessWidget{
  double width;
  double height;
  String? imagePath;
 //"assets/images/ardapp.jpeg"
  PhotoBuilder({
    Key? key,
    required this.width,
    required this.height,
    this.imagePath,

  }) : super(key: key);

 Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: height * .25,
        width: width * .25,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color:  Colors.black,
             /* image: 
               DecorationImage(
                image: AssetImage("assets/images/selimiyeViewFake.jpeg"),
                fit: BoxFit.cover) */), 
      ),
      Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              color: appColor.redRadish,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          margin: const EdgeInsets.fromLTRB(65, 125, 0, 0),
          child: TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.photo_camera,
              color: appColor.white,
            ),
          ))
    ]);
  }
}