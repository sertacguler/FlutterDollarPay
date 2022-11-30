import 'package:dollar_pay/model/UserInfoModel.dart';
import 'package:dollar_pay/pages/user/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../components/AppButtons.dart';
import '../../components/TextWidget.dart';
import '../../constant/colors.dart';
import '../../components/AppBar/AppBar.dart';
import '../../components/TextFieldCustom.dart';
import '../../providers/authProvider.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfo();
}

TextEditingController tfEmailController = TextEditingController();
TextEditingController tfPostalController = TextEditingController();
TextEditingController tfIDNoController = TextEditingController();
TextEditingController tfCreditController = TextEditingController();
TextEditingController tfPaypalController = TextEditingController();
TextEditingController tfDirectController = TextEditingController();

class _UserInfo extends State<UserInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: appColor.white,
        appBar: const AppBarCustom(),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
                child: HeaderTextWidget("Personal Info", 25.0, FontWeight.w800,
                    TextAlign.center, width)),
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 30.0),
              decoration: BoxDecoration(
                color: appColor.white,
                boxShadow: [
                  BoxShadow(color: appColor.lightGrey, blurRadius: 20.0)
                ],
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 40.0)),
                TextWidget("Email Address", 19.0, FontWeight.w600, width),
                TextFieldCustom(
                    hintText:
                        context.read<UserAuth>().userModel.email.toString(),
                    controller: tfEmailController),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                TextWidget("Postal Address", 19.0, FontWeight.w600, width),
                TextFieldCustom(
                    hintText: "Postal Address", controller: tfPostalController),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                TextWidget("ID Number", 19.0, FontWeight.w600, width),
                TextFieldCustom(
                    hintText: "ID Number", controller: tfIDNoController),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                TextWidget("Credit Card", 19.0, FontWeight.w600, width),
                TextFieldCustom(
                    hintText: "Credit Card", controller: tfCreditController),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                TextWidget("PayPal", 19.0, FontWeight.w600, width),
                TextFieldCustom(
                    hintText: "PayPal", controller: tfPaypalController),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                TextWidget("Direct-Debit", 19.0, FontWeight.w600, width),
                TextFieldCustom(
                    hintText: "Direct-Debit", controller: tfDirectController),
                const Padding(padding: EdgeInsets.only(top: 40.0)),
              ]),
            ),
            SizedBox(
              child: AppButtons(
                  textColor: appColor.white,
                  backgroundColor: appColor.redRadish,
                  borderColor: appColor.redRadish,
                  text: "Save Changes",
                  width: width * .85,
                  height: 60,
                  borderRadius: 50,
                  onTap: () => _handle()),
            ),
            SizedBox(
              height: 20,
            )
          ],
        )));
  }

  _handle() {
    UserInfoModel userInfoModel = UserInfoModel(
        userId: context.read<UserAuth>().userModel.id,
        email: tfEmailController.text.toString(),
        postal: tfPostalController.text.toString(),
        idNumber: tfIDNoController.text.toString(),
        creditCard: tfCreditController.text.toString(),
        paypal: tfPaypalController.text.toString(),
        directDebit: tfDirectController.text.toString());
    print(userInfoModel.toJson());
    Get.to(UserProfile());
  }
}
