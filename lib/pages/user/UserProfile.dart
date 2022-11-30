import 'dart:async';
import 'package:dollar_pay/pages/user/YourLocations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../components/AppButtons.dart';
import '../../components/Dialog/ShowDialog.dart';
import '../../components/Dialog/AmountDialog.dart';
import '../../components/Progress.dart';
import '../../components/TextWidget.dart';
import '../../constant/colors.dart';
import '../../components/GoogleMap/CurrentLocationScreen.dart';
import '../../providers/authProvider.dart';
import 'QRMobileScanner.dart';
import 'UserInfo.dart';
import '../../components/Dialog/DialogActionsEnum.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  bool tappedYes = false;
  bool result = false;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appColor.white,
      //appBar: AppBarCustom(actionsButton: Edit()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Get.to(() => UserInfo());
                },
                icon: SvgPicture.asset("assets/svg/EditButton.svg")),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Column(
            children: [
              TextWidget("Hello", 19.0, FontWeight.w400, width),
              TextWidget(
                  context
                      .read<UserAuth>()
                      .userModel
                      .userName
                      .toString()
                      .capitalizeFirst
                      .toString(),
                  35.0,
                  FontWeight.w700,
                  width),
              TextWidget(
                  context.read<UserAuth>().userModel.createDate.toString(),
                  19.0,
                  FontWeight.w400,
                  width),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              AppButtons(
                  textColor: appColor.white,
                  backgroundColor: appColor.redRadish,
                  borderColor: appColor.redRadish,
                  text: "Scan to Collect",
                  width: width * .85,
                  height: 60,
                  borderRadius: 50,
                  isIcon: true,
                  iconData: Icons.qr_code,
                  onTap: () async {
                    _navigateAndDisplaySelection(context);
                    //result = await Get.to(QRMobileScanner());
                  }),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
              height: height * .60,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                CurrentLocationScreen(),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                AppButtons(
                    textColor: appColor.white,
                    backgroundColor: appColor.redRadish,
                    borderColor: appColor.redRadish,
                    text: "Increase Your Limit to \$50,00",
                    width: width * .65,
                    height: 60,
                    borderRadius: 50,
                    onTap: () async {
                      final action = await Dialogs.dialog(
                          context, // Context
                          'Your limit will be increased to \$50,00',
                          'Are you sure?', // Content
                          "Yes I'm sure", // firstButton
                          'Cancel'); // secondButton
                      if (action == DialogAction.yes) {
                        setState(() => tappedYes = true);
                      } else {
                        setState(() => tappedYes = false);
                      }
                    }),
              ])),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          AppButtons(
              textColor: appColor.white,
              backgroundColor: appColor.redRadish,
              borderColor: appColor.redRadish,
              text: "Your Locations",
              width: width * .85,
              height: 60,
              borderRadius: 50,
              isIcon: true,
              iconData: Icons.location_on,
              onTap: () => Get.to(YourLocations())),
          Padding(padding: EdgeInsets.only(top: 25.0)),
        ]),
      ),
    );
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QRMobileScanner()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.

    if (!result.isEmpty) {
      DialogBuilder(context).showLoadingIndicator('Please Wait');
      await _waitSomething(result);
      DialogBuilder(context).hideOpenDialog();
      _ShowAddMountDialog(context, 20);
    } else {
      print("qr okutulmadan çıkış yapıldı");
    }
  }
}

Future _waitSomething(String qr) async {
  return Future.delayed(Duration(seconds: 2), () {
    print("QR -> " + qr); // service işlemi
  });
}

_ShowAddMountDialog(BuildContext context, double chipMoney) async {
  await AmountDialog.dialog(
      context, 'Amount Collected', '\$$chipMoney', "Okay");
}
