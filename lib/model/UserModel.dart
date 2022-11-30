import 'package:intl/intl.dart';

class UserModel {
  int? id;
  String? userName;
  String? surname;
  String? name;
  String? email;
  String? password;
  String? mobile;
  String? createDate;
  String? updateDate;
  String? token;

  UserModel(
      {this.id,
      this.userName,
      this.surname,
      this.name,
      this.email,
      this.password,
      this.mobile,
      this.createDate,
      this.updateDate,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    surname = json['surname'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    createDate = convertDate(json['createDate']);
    updateDate = convertDate(json['updateDate']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName.toString();
    data['surname'] = surname.toString();
    data['name'] = name.toString();
    data['email'] = email.toString();
    data['password'] = password.toString();
    data['mobile'] = mobile.toString();
    data['createDate'] = createDate.toString();
    data['updateDate'] = updateDate.toString();
    data['token'] = token.toString();
    return data;
  }
}

convertDate(dynamic date) {
  if (date == null) return "";
  DateTime newdate = DateTime.parse(date);
  DateFormat inputFormat = DateFormat('MMM dd yyyy');
  return inputFormat.format(newdate).toUpperCase();
}
