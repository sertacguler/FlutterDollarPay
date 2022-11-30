import 'package:dollar_pay/components/AppButtons.dart';
import 'package:dollar_pay/components/SwitchButton.dart';
import 'package:dollar_pay/components/TextFieldCustom.dart';
import 'package:dollar_pay/constant/colors.dart';
import 'package:dollar_pay/constant/textFontSize.dart';
import 'package:dollar_pay/model/UserModel.dart';
import 'package:dollar_pay/model/VendorModel.dart';
import 'package:dollar_pay/pages/common/RegisterPage.dart';
import 'package:dollar_pay/pages/vendor/NewVendor.dart';
import 'package:dollar_pay/components/Dialog/ShowDialogWithWidget.dart';
import 'package:dollar_pay/components/Progress.dart';
import 'package:dollar_pay/components/TextFieldCustomForPassword.dart';
import 'package:dollar_pay/service/VendorService/VendorController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../providers/authProvider.dart';
import '../../service/UserServices/UserController.dart';
import '../../service/networkConstant/service_locator.dart';
import '../user/UserProfile.dart';
import 'package:dollar_pay/components/TextWidget.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPage();
}

var assetsImage = new AssetImage('assets/icons/DollarPayLogo.png');
var image = new Image(image: assetsImage, fit: BoxFit.cover);

class _LoginPage extends State<LoginPage> {
  final userController = getIt<UserController>();
  final vendorController = getIt<VendorController>();
  bool activeUser = true;
  late bool isInProgress;
  bool showPassword = false;
  late TextEditingController tfNameController;
  late TextEditingController tfPasswordController;

  @override
  void initState() {
    super.initState();
    isInProgress = false;
    tfNameController = TextEditingController(text: "");
    tfPasswordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: height * .075,
        ),
        SizedBox(
            // flex: 3,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(child: image),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            activeUser = true;
                          });
                        },
                        child: Text(
                          "User Login",
                          style: TextStyle(
                              fontSize: textFontSize.header2FontSize,
                              fontWeight: FontWeight.bold,
                              color: (activeUser
                                  ? appColor.black
                                  : appColor.darkGrey)),
                        )),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            activeUser = false;
                          });
                        },
                        child: Text(
                          "Vendor Login",
                          style: TextStyle(
                              fontSize: textFontSize.header2FontSize,
                              fontWeight: FontWeight.bold,
                              color: (activeUser
                                  ? appColor.darkGrey
                                  : appColor.black)),
                        ))
                  ],
                )
              ],
            )),
        SizedBox(
          // flex: 4,
          height: 375,
          child: Column(children: [
            TextWidget("Email Address", 19.0, FontWeight.w600, width),
            TextFieldCustom(hintText: "", controller: tfNameController),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            TextWidget("Password", 19.0, FontWeight.w600, width),
            TextFieldCustomForPassword(
                hintText: "",
                controller: tfPasswordController,
                showPassword: true),
            SwitchButton(
              text: "Remember me",
              textFalse: null,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: AppButtons(
                textColor: appColor.white,
                backgroundColor: appColor.redRadish,
                borderColor: appColor.redRadish,
                text: "Log In",
                width: width * .85,
                height: 60,
                borderRadius: 50,
                onTap: () {
                  isInProgress ? {} : _handleLogin(context);
                },
              ),
            )
          ]),
        ),
        SizedBox(
          // flex: 2,
          height: 125,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(RegisterPage());
                    },
                    child: const Text(
                      "Create an account",
                      style: TextStyle(
                          fontSize: textFontSize.header1FontSize,
                          fontWeight: FontWeight.bold,
                          color: appColor.black),
                    )),
                Text("or"),
                const TextButton(
                    onPressed: null,
                    child: Text(
                      "Reset your password",
                      style: TextStyle(
                          fontSize: textFontSize.header1FontSize,
                          fontWeight: FontWeight.bold,
                          color: appColor.black),
                    )),
              ]),
        )
      ]),
    ));
  }

  _handleLogin(BuildContext context) async {
    String name = tfNameController.text;
    String password = tfPasswordController.text;

    if (mounted) {
      setState(() {
        isInProgress = true;
      });
    }
    DialogBuilder(context).showLoadingIndicator('');
    var loginInfo;
    if (activeUser) {
      loginInfo = await userController.userLogin(name, password);
    } else {
      loginInfo = await vendorController.vendorLogin(name, password);
    }
    setState(() {
      isInProgress = false;
    });
    DialogBuilder(context).hideOpenDialog();
    if (!loginInfo.containsKey('error')) {
      if (activeUser) {
        context.read<UserAuth>().userModel = UserModel.fromJson(loginInfo);
      } else {
        context.read<VendorAuth>().vendorModel =
            VendorModel.fromJson(loginInfo);
      }
      Get.to(activeUser ? UserProfile() : NewVendor());
    } else {
      _loginErrorDialog(context, (loginInfo as Map)['error'].toString());
    }
  }
}

_loginErrorDialog(
  BuildContext context,
  String message,
) async {
  await DialogWithWidget.dialog(context, '', message, 'Ok', '');
}
