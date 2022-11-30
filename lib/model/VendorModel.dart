class VendorModel {
  int? id;
  int? parentId;
  String? username;
  String? vendorName;
  String? vendorImage;
  String? vendorAbn;
  String? bankDetails;
  String? email;
  String? mobile;
  String? createDate;
  String? token;
  String? password;

  VendorModel(
      {this.id,
      this.username,
      this.vendorName,
      this.vendorImage,
      this.vendorAbn,
      this.bankDetails,
      this.email,
      this.mobile,
      this.createDate,
      this.token,
      this.password});

  VendorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    vendorName = json['vendorName'];
    vendorImage = json['vendorImage'];
    vendorAbn = json['vendorAbn'];
    bankDetails = json['bankDetails'];
    email = json['email'];
    mobile = json['mobile'];
    createDate = json['createDate'];
    token = json['token'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['vendorName'] = vendorName;
    data['vendorImage'] = vendorImage;
    data['vendorAbn'] = vendorAbn;
    data['bankDetails'] = bankDetails;
    data['email'] = email;
    data['mobile'] = mobile;
    data['createDate'] = createDate;
    data['token'] = token;
    data['password'] = password;
    return data;
  }
}
