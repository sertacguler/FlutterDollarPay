import 'package:dollar_pay/model/UserAddNewLocationModel.dart';
import 'package:flutter/material.dart';
import 'package:dollar_pay/constant/colors.dart';
import 'package:get/get.dart';
import '../../components/AppBar/AppBar.dart';
import 'AddNewLocation.dart';

class YourLocations extends StatelessWidget {
  const YourLocations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: appColor.white,
        appBar: AppBarCustom(),
        body: Container(
          color: appColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: screenWidth * .85,
                      child: const Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Your Locations",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => AddNewLocation());
                      },
                      child: Icon(Icons.add),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                    height: screenHeight * .74,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                              height: 1,
                              thickness: 2,
                            ),
                        itemCount: 11,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Container(
                              height: screenHeight * .15,
                              width: screenWidth * .15,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                                /* image: DecorationImage(
                                  image: AssetImage("assets/images/ardapp.jpeg"),
                                  fit: BoxFit.cover) */
                              ),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Container(
                                width: screenWidth * .075,
                                height: 50,
                                child: const IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.arrow_forward_rounded),
                                  iconSize: 20,
                                ),
                              ),
                            ),
                            title: Text(
                              'title',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('subTitle'),
                          );
                        })),
              ),
            ],
          ),
        ));
  }
}
