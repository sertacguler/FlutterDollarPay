class UserAddNewLocationModel {
  int? userId;
  String? businessName;
  String? businessABN;
  String? businessAddress;
  String? bankDetail;
  String? paymentSchedule;
  String? location;
  UserAddNewLocationModel(
      {this.userId,
      this.businessName,
      this.businessABN,
      this.businessAddress,
      this.bankDetail,
      this.paymentSchedule,
      this.location});

  UserAddNewLocationModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    businessName = json['businessName'];
    businessABN = json['businessABN'];
    businessAddress = json['businessAddress'];
    bankDetail = json['bankDetail'];
    paymentSchedule = json['paymentSchedule'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['businessName'] = businessName;
    data['businessABN'] = businessABN;
    data['businessAddress'] = businessAddress;
    data['bankDetail'] = bankDetail;
    data['paymentSchedule'] = paymentSchedule;
    data['location'] = location;
    return data;
  }
}
