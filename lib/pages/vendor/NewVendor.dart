import 'package:dollar_pay/components/PhotoBuilder.dart';
import 'package:dollar_pay/model/VendorLocationModel.dart';
import 'package:dollar_pay/pages/OverViewPage.dart';
import 'package:dollar_pay/pages/vendor/VendorLocation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../components/AppButtons.dart';
import '../../components/TextWidget.dart';
import '../../constant/colors.dart';
import '../../components/TextFieldCustom.dart';
import '../../model/VendorInfoModel.dart';
import '../../providers/authProvider.dart';

class NewVendor extends StatefulWidget {
  const NewVendor({Key? key}) : super(key: key);

  @override
  State<NewVendor> createState() => _NewVendor();
}

TextEditingController tfFullNameController = new TextEditingController();

class _NewVendor extends State<NewVendor> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: appColor.white,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 80.0)),
            Container(
                child: HeaderTextWidget("New Vendor", 25.0, FontWeight.w800,
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
                PhotoBuilder(width: width, height: height),
                const Padding(padding: EdgeInsets.only(top: 40.0)),
                TextWidget("Full Name", 19.0, FontWeight.w600, width),
                TextFieldCustom(
                    hintText: "Full Name", controller: tfFullNameController),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                TextWidget("Location", 19.0, FontWeight.w600, width),
                AddNewLocationForVendor(),
                const Padding(padding: EdgeInsets.only(top: 40.0)),
              ]),
            ),
            Container(
              child: AppButtons(
                  textColor: appColor.white,
                  backgroundColor: appColor.redRadish,
                  borderColor: appColor.redRadish,
                  text: "Add Vendor",
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
    VendorInfoModel vendorInfoModel = VendorInfoModel(
      vendorId: context.read<VendorAuth>().vendorModel.id,
      fullName: tfFullNameController.text.toString(),
      vendorLocationModel:
          Get.arguments != null ? Get.arguments : VendorLocationModel(),
    );
    //print(vendorInfoModel.vendorLocationModel?.toJson());
    Get.to(Overview());
  }
}

Widget AddNewLocationForVendor() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30),
    child: Container(
        height: 50.0,
        color: Color.fromARGB(255, 245, 245, 245),
        child: InkWell(
          onTap: () {
            Get.to(AddVendorLocation());
          },
          child: Row(children: <Widget>[
            const Padding(padding: EdgeInsets.only(left: 10.0)),
            Container(
                child: Icon(
              Icons.add_circle,
              size: 40,
              color: appColor.redRadish,
            )),
            const Padding(padding: EdgeInsets.only(right: 5.0)),
            Text('Add New Location',
                style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                    color: appColor.redRadish))
          ]),
        )),
  );
}
