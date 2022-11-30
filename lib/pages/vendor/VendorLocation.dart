import 'package:dollar_pay/model/VendorLocationModel.dart';
import 'package:dollar_pay/pages/vendor/NewVendor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../components/AppButtons.dart';
import '../../components/PaymentSchedule.dart';
import '../../components/SwitchButton.dart';
import '../../components/TextWidget.dart';
import '../../constant/colors.dart';
import '../../components/AppBar/AppBar.dart';
import '../../components/TextFieldCustom.dart';
import '../../providers/authProvider.dart';

class AddVendorLocation extends StatefulWidget {
  const AddVendorLocation({Key? key}) : super(key: key);

  @override
  State<AddVendorLocation> createState() => _AddVendorLocation();
}

String paymentResult = "15";
TextEditingController tfNameController = new TextEditingController();
TextEditingController tfABNController = new TextEditingController();
TextEditingController tfAddressController = new TextEditingController();
TextEditingController tfBankController = new TextEditingController();

class _AddVendorLocation extends State<AddVendorLocation> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    String result = "On";

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
                child: HeaderTextWidget("Location", 25.0, FontWeight.w800,
                    TextAlign.center, width)),
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 30.0),
              decoration: BoxDecoration(
                color: appColor.white,
                boxShadow: [
                  BoxShadow(color: appColor.lightGrey, blurRadius: 20.0)
                ],
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Column(children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                Container(
                  color: Colors.black,
                  height: 112,
                  width: 112,
                ),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                AppButtons(
                  textColor: appColor.white,
                  backgroundColor: appColor.redRadish,
                  borderColor: appColor.redRadish,
                  text: "Hide/Show QR Code",
                  width: width * .85,
                  height: 60,
                  borderRadius: 50,
                  onTap: () => print('QR aç kapat'),
                  isIcon: true,
                  iconData: Icons.qr_code,
                ),
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
                PaymentSchedule(width: width, onValueChanged: onValueChanged),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                TextWidget("Revenue Booster", 19.0, FontWeight.w600, width),
                const Padding(padding: EdgeInsets.only(top: 5.0)),
                TextWidget(
                    "Lock-in your revenue for 30 days to earn an extra 4%",
                    17.0,
                    FontWeight.w400,
                    width),
                SwitchButton(
                  text: 'On',
                  textFalse: 'Off',
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
    VendorLocationModel vendorLocationModel = VendorLocationModel(
        vendorId: context.read<VendorAuth>().vendorModel.id,
        businessName: tfNameController.text.toString(),
        businessABN: tfABNController.text.toString(),
        businessAddress: tfAddressController.text.toString(),
        bankDetail: tfBankController.text.toString(),
        paymentSchedule: paymentResult,
        revenueBooster: null,
        location: null);
    //print(vendorLocationModel.toJson());
    Get.to(NewVendor(), arguments: vendorLocationModel);
  }
}
