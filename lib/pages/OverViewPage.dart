import 'package:dollar_pay/constant/colors.dart';
import 'package:dollar_pay/constant/textFontSize.dart';
import 'package:dollar_pay/pages/vendor/EditVendor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import "package:intl/intl.dart";

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _Overview();
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}

class _Overview extends State<Overview> {
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  final LinearGradient positiveGradientColors =
      const LinearGradient(colors: <Color>[
    Colors.transparent,
    appColor.redRadish
  ], stops: <double>[
    0.0,
    0.5,
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
              top: -75,
              right: -125,
              child: Image.asset("assets/svg/Group 6127.png")),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: IconButton(
                        onPressed: () => Get.to(const EditVendor()),
                        icon: SvgPicture.asset("assets/svg/EditButton.svg")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      children: [
                        const Text(
                          "Vendor",
                          style: TextStyle(
                              color: appColor.white, fontFamily: "poppins"),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                            /* image: 
                     DecorationImage(
                      image: AssetImage("assets/images/selimiyeViewFake.jpeg"),
                      fit: BoxFit.cover) */
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            /* HeaderOfOverview(width: width), */
            HeaderOfCard(
                width, "OverView", textFontSize.nameFontSize, FontWeight.bold),
            CardOverview(height: height, width: width),
            HeaderOfCard(width, "Profit/Loss", textFontSize.nameFontSize,
                FontWeight.bold),
            ProfitLoss(height: height, width: width),
            HeaderOfCard(
                width, "Vendors", textFontSize.nameFontSize, FontWeight.bold),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              color: Colors.white,
              child: SizedBox(
                height: 2400,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                        /* image: 
                                           DecorationImage(
                                            image: AssetImage("assets/images/selimiyeViewFake.jpeg"),
                                            fit: BoxFit.cover) */
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * .5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Joes Thompson",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "poppins"),
                                          ),
                                          Row(
                                            children: const [
                                              Text("Balance:  "),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Text("+ ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "poppins",
                                                      color: Colors.green)),
                                              Text("\$1.600,00",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "poppins"))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.arrow_forward_rounded))
                                  ]),
                            );
                          }),
                    ),
                    HeaderOfCard(width, "Outgoing", textFontSize.nameFontSize,
                        FontWeight.bold),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: ListViewSeparated(
                          height: 1,
                          thickness: 1,
                          itemCount: 2,
                          indent: 20,
                          endIndent: 25,
                          text: "arda"),
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: appColor.trappedDarkness,
                        child: Container(
                          height: 600,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                height: 175,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "Income",
                                        style: TextStyle(
                                          color: appColor.white,
                                          fontSize: textFontSize.nameFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text(
                                        "Total Income",
                                        style: TextStyle(
                                          color:
                                              appColor.white.withOpacity(0.5),
                                          fontSize: textFontSize.baseFontSize,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$3.784,88",
                                        style: TextStyle(
                                          color: appColor.white,
                                          fontSize: textFontSize.nameFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * .9,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 37,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.transparent),
                                        child: Center(
                                          child: Text(
                                            "Week",
                                            style: TextStyle(
                                                color: appColor.white
                                                    .withOpacity(0.5)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 37,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: appColor.funnelCloud),
                                        child: Center(
                                          child: Text(
                                            "Year",
                                            style: TextStyle(
                                                color: appColor.white
                                                    .withOpacity(0.5)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 37,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.transparent),
                                        child: Center(
                                          child: Text(
                                            "Month",
                                            style: TextStyle(
                                                color: appColor.white
                                                    .withOpacity(0.5)),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                height: 300,
                                child: SfCartesianChart(
                                    // title: ChartTitle(text: "Deneme Grafigi"),
                                    legend: Legend(isVisible: false),
                                    zoomPanBehavior:
                                        ZoomPanBehavior(enablePinching: true),
                                    tooltipBehavior: _tooltipBehavior,
                                    enableSideBySideSeriesPlacement: false,
                                    enableAxisAnimation: false,
                                    borderColor: Colors.transparent,
                                    plotAreaBorderColor: Colors.transparent,
                                    plotAreaBackgroundColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    series: <ChartSeries>[
                                      AreaSeries<SalesData, double>(
                                          dataSource: _chartData,
                                          color: appColor.redRadish,
                                          borderWidth: 3,
                                          borderColor: appColor.redRadish,
                                          name: 'Sales',
                                          xValueMapper: (SalesData sales, _) =>
                                              sales.year,
                                          yValueMapper: (SalesData sales, _) =>
                                              sales.sales,
                                          isVisibleInLegend: false,
                                          isVisible: true,
                                          gradient: positiveGradientColors,
                                          opacity: 0.2,
                                          markerSettings: MarkerSettings(
                                              isVisible: true,
                                              height: 5,
                                              width: 5,
                                              color: appColor.redRadish,
                                              borderColor: appColor.redRadish),
                                          dataLabelSettings: DataLabelSettings(
                                            showZeroValue: true,
                                            isVisible: false,
                                          ),
                                          enableTooltip: true)
                                    ],
                                    primaryXAxis: NumericAxis(
                                        edgeLabelPlacement:
                                            EdgeLabelPlacement.shift),
                                    primaryYAxis: NumericAxis(
                                        autoScrollingDelta: 100,
                                        maximumLabels: 100,
                                        labelStyle: TextStyle(fontSize: 20),
                                        majorGridLines:
                                            MajorGridLines(width: 0),
                                        majorTickLines:
                                            MajorTickLines(width: 0),
                                        isVisible: false,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.1)
                                    // NumericAxis(
                                    //     labelFormat: '{value}M',
                                    //     numberFormat: NumberFormat.simpleCurrency(
                                    //         decimalDigits: 0)),
                                    ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    HeaderOfCard(width, "Transactions",
                        textFontSize.nameFontSize, FontWeight.bold),
                    Expanded(
                      flex: 1,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                                height: 1,
                                thickness: 2,
                              ),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                  /* image: 
                                             DecorationImage(
                                              image: AssetImage("assets/images/selimiyeViewFake.jpeg"),
                                              fit: BoxFit.cover) */
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SizedBox(
                                  width: 75,
                                  height: 50,
                                  child: Row(
                                    children: const [
                                      Text(
                                        "+",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 20),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "\$125,65",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              title: const Text("Firma Adı"),
                              subtitle: const Text("Tarih | Saat "),
                            );
                          }),
                    ),
                    HeaderOfCard(width, "Transactions",
                        textFontSize.nameFontSize, FontWeight.bold),
                    Expanded(
                      flex: 1,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                                height: 1,
                                thickness: 2,
                              ),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                  /* image: 
                                             DecorationImage(
                                              image: AssetImage("assets/images/selimiyeViewFake.jpeg"),
                                              fit: BoxFit.cover) */
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SizedBox(
                                  width: 75,
                                  height: 50,
                                  child: Row(
                                    children: const [
                                      Text(
                                        "+",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 20),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "\$125,65",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              title: const Text("Firma Adı"),
                              subtitle: const Text("Tarih | Saat "),
                            );
                          }),
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: appColor.trappedDarkness,
                        child: Container(
                          height: 500,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                height: 75,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "Rating",
                                        style: TextStyle(
                                          color: appColor.white,
                                          fontSize: textFontSize.nameFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * .9,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.white.withOpacity(0.3),
                                          blurRadius: 15,
                                          offset: Offset(0.0, 10.0))
                                    ]),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 37,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.transparent),
                                        child: Center(
                                          child: Text(
                                            "Week",
                                            style: TextStyle(
                                                color: appColor.white
                                                    .withOpacity(0.5)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 37,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: appColor.funnelCloud),
                                        child: Center(
                                          child: Text(
                                            "Year",
                                            style: TextStyle(
                                                color: appColor.white
                                                    .withOpacity(0.5)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 37,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.transparent),
                                        child: Center(
                                          child: Text(
                                            "Month",
                                            style: TextStyle(
                                                color: appColor.white
                                                    .withOpacity(0.5)),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                height: 300,
                                child: SfCartesianChart(
                                    // title: ChartTitle(text: "Deneme Grafigi"),
                                    legend: Legend(isVisible: false),
                                    zoomPanBehavior:
                                        ZoomPanBehavior(enablePinching: true),
                                    tooltipBehavior: _tooltipBehavior,
                                    enableSideBySideSeriesPlacement: false,
                                    enableAxisAnimation: false,
                                    borderColor: Colors.transparent,
                                    plotAreaBorderColor: Colors.transparent,
                                    plotAreaBackgroundColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    series: <ChartSeries>[
                                      AreaSeries<SalesData, double>(
                                          dataSource: _chartData,
                                          color: appColor.redRadish,
                                          borderWidth: 3,
                                          borderColor: appColor.redRadish,
                                          name: 'Sales',
                                          xValueMapper: (SalesData sales, _) =>
                                              sales.year,
                                          yValueMapper: (SalesData sales, _) =>
                                              sales.sales,
                                          isVisibleInLegend: false,
                                          isVisible: true,
                                          gradient: positiveGradientColors,
                                          opacity: 0.2,
                                          markerSettings: MarkerSettings(
                                              isVisible: true,
                                              height: 5,
                                              width: 5,
                                              color: appColor.redRadish,
                                              borderColor: appColor.redRadish),
                                          dataLabelSettings: DataLabelSettings(
                                            showZeroValue: true,
                                            isVisible: false,
                                          ),
                                          enableTooltip: true)
                                    ],
                                    primaryXAxis: NumericAxis(
                                        edgeLabelPlacement:
                                            EdgeLabelPlacement.shift),
                                    primaryYAxis: NumericAxis(
                                        autoScrollingDelta: 100,
                                        maximumLabels: 100,
                                        labelStyle: TextStyle(fontSize: 20),
                                        majorGridLines:
                                            MajorGridLines(width: 0),
                                        majorTickLines:
                                            MajorTickLines(width: 0),
                                        isVisible: false,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.1)
                                    // NumericAxis(
                                    //     labelFormat: '{value}M',
                                    //     numberFormat: NumberFormat.simpleCurrency(
                                    //         decimalDigits: 0)),
                                    ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2014, 10),
      SalesData(2015, 12),
      SalesData(2016, 18),
      SalesData(2017, 15),
      SalesData(2018, 20),
      SalesData(2019, 24),
      SalesData(2020, 25),
      SalesData(2021, 30),
      SalesData(2022, 32),
      SalesData(2023, 31),
      SalesData(2024, 31),
      SalesData(2025, 31),
      SalesData(2026, 31),
      SalesData(2027, 31)
    ];
    return chartData;
  }

  Widget HeaderOfCard(
      double width, String text, double fontSize, FontWeight w) {
    return SizedBox(
      width: width * .85,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: w),
        ),
        const IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: null,
        ),
      ]),
    );
  }
}

class CardOverview extends StatelessWidget {
  const CardOverview({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: height * .30,
            child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 20,
                      endIndent: 25,
                    ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                        width: 100,
                        height: 50,
                        child: Row(
                          children: const [
                            Text(
                              "+",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "\$20.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    title: const Text("Firma Adı"),
                  );
                }),
          ),
          InsideCardOverview(height: height, width: width)
        ],
      ),
    );
  }
}

class ProfitLoss extends StatelessWidget {
  const ProfitLoss({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Colors.white,
      child: SizedBox(
        height: height * .18,
        child: ListViewSeparated(
          text: "arda",
          itemCount: 2,
          height: 1,
          indent: 20,
          thickness: 1,
          endIndent: 25,
        ),
      ),
    );
  }
}

class ListViewSeparated extends StatelessWidget {
  ListViewSeparated(
      {super.key,
      required this.text,
      required this.itemCount,
      required this.height,
      required this.indent,
      required this.thickness,
      required this.endIndent});
  final String text;
  int itemCount = 1;
  double height;
  double thickness;
  double indent;
  double endIndent;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              height: height,
              thickness: thickness,
              indent: indent,
              endIndent: endIndent,
            ),
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SizedBox(
                width: 100,
                height: 50,
                child: Row(
                  children: const [
                    Text(
                      "-",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "\$20.000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            title: const Text("Firma Adı"),
          );
        });
  }
}

class InsideCardOverview extends StatelessWidget {
  const InsideCardOverview({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: height * .15,
      width: width * .9,
      margin: EdgeInsets.symmetric(vertical: height * .02),
      child: Card(
        surfaceTintColor: Colors.blue,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: width,
          margin: EdgeInsets.all(height * .02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Loaned:",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: width * .025,
                  ),
                  const Text(
                    "\$190.000",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
              SizedBox(
                height: height * .025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Received:", style: TextStyle(fontSize: 15)),
                  SizedBox(
                    width: width * .025,
                  ),
                  const Text(
                    "\$23.190,000",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
