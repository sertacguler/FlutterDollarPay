class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://107.21.88.53:4500";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String userRegister = '/user/session/register';
  static const String userLogin = '/user/session/login';
  static const String users = '/users';

  static const String vendorRegister = '/vendor/session/register';
  static const String vendorLogin = '/vendor/session/login';
  static const String vendors = '/vendors';
}
