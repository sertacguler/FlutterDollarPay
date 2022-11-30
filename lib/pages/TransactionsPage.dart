import 'package:dollar_pay/components/AppBar/AppBar.dart';
import 'package:dollar_pay/components/AppButtons.dart';
import 'package:dollar_pay/constant/colors.dart';
import 'package:dollar_pay/constant/textFontSize.dart';
import 'package:dollar_pay/pages/common/TermsAndConditionsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBarCustom(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Transaction History",
                style: TextStyle(
                    fontSize: textFontSize.nameFontSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              color: Colors.white,
              child: Container(
                height: 300,
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                          height: 1,
                          thickness: 2,
                        ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        trailing: Container(
                          width: 200,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "\$125.000,65",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.arrow_forward_rounded))
                            ],
                          ),
                        ),
                        title: Text("Firma Adı"),
                        subtitle: Text("Tarih | Saat "),
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              color: Colors.white,
              child: Container(
                color: Colors.white,
                height: 350,
                margin: EdgeInsets.symmetric(
                    vertical: height * .03, horizontal: width * .05),
                child: Column(
                  children: [
                    Card(
                      surfaceTintColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(height * .05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Current Balance:",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  width: width * .025,
                                ),
                                const Text(
                                  "\$190.000",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * .025,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Plus Fees:",
                                    style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: width * .025,
                                ),
                                const Text(
                                  "\$23.190,000",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * .025,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Plus Booster:",
                                    style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  width: width * .025,
                                ),
                                const Text(
                                  "\$112.425,00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AppButtons(
                        textColor: appColor.white,
                        backgroundColor: appColor.redRadish,
                        borderColor: appColor.redRadish,
                        text: "Generate Report",
                        width: width,
                        height: 50,
                        borderRadius: 30,
                        onTap: (() => {})),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text("By generating a report, you agree with our"),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.to(TermsAndConditions());
                        },
                        child: Text(
                          "Terms & Conditions",
                          style: TextStyle(
                              color: appColor.redRadish,
                              decoration: TextDecoration.underline,
                              fontSize: textFontSize.baseFontSize,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
