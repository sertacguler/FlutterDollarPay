import 'package:dollar_pay/components/PhotoBuilder.dart';
import 'package:dollar_pay/model/UserAddNewLocationModel.dart';
import 'package:dollar_pay/pages/user/UserProfile.dart';
import 'package:dollar_pay/pages/user/YourLocations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/AppButtons.dart';
import '../../components/PaymentSchedule.dart';
import '../../components/TextWidget.dart';
import '../../constant/colors.dart';
import '../../components/AppBar/AppBar.dart';
import '../../components/TextFieldCustom.dart';

class AddNewLocation extends StatefulWidget {
  const AddNewLocation({Key? key}) : super(key: key);

  @override
  State<AddNewLocation> createState() => _AddNewLocation();
}

String paymentResult = "15";
TextEditingController tfNameController = TextEditingController();
TextEditingController tfABNController = TextEditingController();
TextEditingController tfAddressController = TextEditingController();
TextEditingController tfBankController = TextEditingController();

class _AddNewLocation extends State<AddNewLocation> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    void onValueChanged(String result) {
      paymentResult = result;
    }

    return Scaffold(
        backgroundColor: appColor.white,
        appBar: const AppBarCustom(),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
                child: HeaderTextWidget("New Location", 25.0, FontWeight.w800,
                    TextAlign.center, width)),
            Container(child: PhotoBuilder(width: width, height: height)),
            Container(
              margin: const EdgeInsets.only(bottom: 30.0),
              decoration: BoxDecoration(
                color: appColor.white,
                boxShadow: [
                  BoxShadow(color: appColor.lightGrey, blurRadius: 20.0)
                ],
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Column(children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 40.0)),
                TextWidget("Business Name", 19.0, FontWeight.w600, width),
                TextFieldCustom(
                    hintText: "Business Name", controller: tfNameController),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                TextWidget("Business ABN", 19.0, FontWeight.w600, width),
                TextFieldCustom(
                    hintText: "Business ABN", controller: tfABNController),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                TextWidget("Business Address", 19.0, FontWeight.w600, width),
                TextFieldCustom(
                    hintText: "Business Address",
                    controller: tfAddressController),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                TextWidget("Bank Detail", 19.0, FontWeight.w600, width),
                TextFieldCustom(
                    hintText: "Bank Detail", controller: tfBankController),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                TextWidget("Payment Schedule", 19.0, FontWeight.w600, width),
                PaymentSchedule(
                  width: width,
                  onValueChanged: onValueChanged,
                ),
                const Padding(padding: EdgeInsets.only(top: 40.0)),
              ]),
            ),
            Container(
              child: AppButtons(
                  textColor: appColor.white,
                  backgroundColor: appColor.redRadish,
                  borderColor: appColor.redRadish,
                  text: "Add Location",
                  width: width * .85,
                  height: 60,
                  borderRadius: 50,
                  onTap: () => _handle()),
            ),
            const Padding(padding: EdgeInsets.only(top: 25.0)),
          ],
        )));
  }

  _handle() {
    UserAddNewLocationModel userAddNewLocationModel = UserAddNewLocationModel(
        businessName: tfNameController.text.toString(),
        businessABN: tfABNController.text.toString(),
        businessAddress: tfAddressController.text.toString(),
        bankDetail: tfBankController.text.toString(),
        paymentSchedule: paymentResult,
        location: null);
    print(userAddNewLocationModel.toJson());
    Get.to(YourLocations());
  }
}
