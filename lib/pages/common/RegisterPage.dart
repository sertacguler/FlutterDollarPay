import 'package:dollar_pay/components/AppButtons.dart';
import 'package:dollar_pay/components/SwitchButton.dart';
import 'package:dollar_pay/components/TextFieldCustom.dart';
import 'package:dollar_pay/constant/colors.dart';
import 'package:dollar_pay/constant/textFontSize.dart';
import 'package:dollar_pay/model/UserModel.dart';
import 'package:dollar_pay/model/VendorModel.dart';
import 'package:dollar_pay/pages/common/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/Dialog/ShowDialogWithWidget.dart';
import '../../service/UserServices/UserController.dart';
import '../../service/VendorService/VendorController.dart';
import '../../service/networkConstant/service_locator.dart';
import '../../utils/Validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

TextEditingController tfUserNameController = TextEditingController();
TextEditingController tfEmailController = TextEditingController();
TextEditingController tfPasswordController = TextEditingController();

var assetsImage = new AssetImage('assets/icons/DollarPayLogo.png');
var image = new Image(image: assetsImage, fit: BoxFit.cover);

class _RegisterPage extends State<RegisterPage> {
  final userController = getIt<UserController>();
  final vendorController = getIt<VendorController>();
  bool activeUser = true;
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
                          "User Register",
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
                          "Vendor Register",
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
          height: 450,
          child: Column(children: [
            myTextWidget("Username", 19.0, FontWeight.w600),
            TextFieldCustom(hintText: "", controller: tfUserNameController),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            myTextWidget("Email Address", 19.0, FontWeight.w600),
            TextFieldCustom(hintText: "", controller: tfEmailController),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            myTextWidget("Password", 19.0, FontWeight.w600),
            TextFieldCustom(hintText: "", controller: tfPasswordController),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            SwitchButton(
              text: "I agree to the Terms & Conditions",
              textFalse: null,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: AppButtons(
                textColor: appColor.white,
                backgroundColor: appColor.redRadish,
                borderColor: appColor.redRadish,
                text: "Create Account",
                width: width * .85,
                height: 60,
                borderRadius: 50,
                onTap: () async {
                  var result = false;
                  var name = tfUserNameController.text.toString();
                  var email = tfEmailController.text.toString();
                  var password = tfPasswordController.text.toString();
                  if (name.isEmpty) {
                    _loginErrorDialog(context, "Please Fill Name");
                  } else if (email.isEmpty) {
                    _loginErrorDialog(context, "Please Fill Email");
                  } else if (Validator.isEmail(email)) {
                    _loginErrorDialog(context, "Please fill email properly");
                  } else if (password.isEmpty) {
                    _loginErrorDialog(context, "Please fill password");
                  } else {
                    if (activeUser) {
                      UserModel userModel = UserModel(
                        userName: tfUserNameController.text.toString(),
                        surname: "ss",
                        name: tfUserNameController.text.toString(),
                        email: tfEmailController.text.toString(),
                        password: tfPasswordController.text.toString(),
                        mobile: "true",
                      );
                      result = await userController.userRegister(userModel);
                    } else {
                      VendorModel vendorModel = VendorModel(
                          username: tfUserNameController.text.toString(),
                          email: tfEmailController.text.toString(),
                          password: tfPasswordController.text.toString(),
                          vendorAbn: "string1",
                          mobile: "string1");
                      result =
                          await vendorController.vendorRegister(vendorModel);
                    }
                    if (result.runtimeType == bool && result) {
                      Get.to(LoginPage());
                    } else if (result.runtimeType == Map) {
                      if ((result as Map).containsKey('error')) {
                        _loginErrorDialog(
                            context, (result as Map)['error'].toString());
                      }
                    }
                  }
                },
              ),
            )
          ]),
        ),
        SizedBox(
          // flex: 1,
          height: 50,
          child: TextButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              child: Text(
                "Already have an account?",
                style: TextStyle(
                    fontSize: textFontSize.header1FontSize,
                    fontWeight: FontWeight.bold,
                    color: appColor.black),
              )),
        ),
        SizedBox(
          height: 25,
        )
      ]),
    ));
  }
}

Widget myTextWidget(String _text, double _fontSize, FontWeight w) {
  return Container(
    margin: const EdgeInsets.only(left: 30),
    width: 375, //double.infinity,
    child: Text(
      _text,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontSize: _fontSize,
          color: Colors.black,
          fontFamily: "poppins",
          fontWeight: w),
    ),
  );
}

_loginErrorDialog(
  BuildContext context,
  String message,
) async {
  await DialogWithWidget.dialog(context, '', message, 'Ok', '');
}
