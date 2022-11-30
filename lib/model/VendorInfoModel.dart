import 'package:dollar_pay/model/VendorLocationModel.dart';

class VendorInfoModel {
  int? vendorId;
  String? fullName;
  String? businessName;
  String? businessABN;
  String? businessAddress;
  String? bankDetail;
  String? paymentSchedule;
  String? revenueBooster;
  String? location;
  VendorLocationModel? vendorLocationModel;

  VendorInfoModel({
    this.vendorId,
    this.fullName,
    this.businessName,
    this.businessABN,
    this.businessAddress,
    this.bankDetail,
    this.paymentSchedule,
    this.revenueBooster,
    this.location,
    this.vendorLocationModel,
  });

  VendorInfoModel.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendorId'];
    fullName = json['fullName'];
    businessName = json['businessName'];
    businessABN = json['businessABN'];
    businessAddress = json['businessAddress'];
    bankDetail = json['bankDetail'];
    paymentSchedule = json['paymentSchedule'];
    revenueBooster = json['revenueBooster'];
    location = json['location'];
    vendorLocationModel = json['vendorLocationModel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vendorId'] = vendorId;
    data['fullName'] = fullName;
    data['businessName'] = businessName;
    data['businessABN'] = businessABN;
    data['businessAddress'] = businessAddress;
    data['bankDetail'] = bankDetail;
    data['paymentSchedule'] = paymentSchedule;
    data['revenueBooster'] = revenueBooster;
    data['location'] = location;
    data['vendorLocationModel'] = vendorLocationModel;
    return data;
  }
}
