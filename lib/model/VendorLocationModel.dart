class VendorLocationModel {
  int? vendorId;
  String? businessName;
  String? businessABN;
  String? businessAddress;
  String? bankDetail;
  String? paymentSchedule;
  String? revenueBooster;
  String? location;
  VendorLocationModel(
      {this.vendorId,
      this.businessName,
      this.businessABN,
      this.businessAddress,
      this.bankDetail,
      this.paymentSchedule,
      this.revenueBooster,
      this.location});

  VendorLocationModel.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendorId'];
    businessName = json['businessName'];
    businessABN = json['businessABN'];
    businessAddress = json['businessAddress'];
    bankDetail = json['bankDetail'];
    paymentSchedule = json['paymentSchedule'];
    revenueBooster = json['revenueBooster'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vendorId'] = vendorId;
    data['businessName'] = businessName;
    data['businessABN'] = businessABN;
    data['businessAddress'] = businessAddress;
    data['bankDetail'] = bankDetail;
    data['paymentSchedule'] = paymentSchedule;
    data['revenueBooster'] = revenueBooster;
    data['location'] = location;
    return data;
  }
}
