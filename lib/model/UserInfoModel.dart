class UserInfoModel {
  int? userId;
  String? email;
  String? postal;
  String? idNumber;
  String? creditCard;
  String? paypal;
  String? directDebit;
  UserInfoModel(
      {this.userId,
      this.email,
      this.postal,
      this.idNumber,
      this.creditCard,
      this.paypal,
      this.directDebit});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    postal = json['postal'];
    idNumber = json['idNumber'];
    creditCard = json['creditCard'];
    paypal = json['paypal'];
    directDebit = json['directDebit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['email'] = email;
    data['postal'] = postal;
    data['idNumber'] = idNumber;
    data['creditCard'] = creditCard;
    data['paypal'] = paypal;
    data['directDebit'] = directDebit;
    return data;
  }
}
