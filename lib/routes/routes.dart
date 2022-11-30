import 'package:dollar_pay/pages/OverViewPage.dart';
import 'package:dollar_pay/pages/TransactionsPage.dart';
import 'package:dollar_pay/pages/common/LoginPage.dart';
import 'package:dollar_pay/pages/common/NotFoundPage.dart';
import 'package:dollar_pay/pages/common/RegisterPage.dart';
import 'package:dollar_pay/pages/common/SplashScreen.dart';
import 'package:dollar_pay/pages/common/TermsAndConditionsPage.dart';
import 'package:dollar_pay/pages/user/AddNewLocation.dart';
import 'package:dollar_pay/pages/user/UserInfo.dart';
import 'package:dollar_pay/pages/user/UserProfile.dart';
import 'package:dollar_pay/pages/user/QRMobileScanner.dart';
import 'package:dollar_pay/pages/user/YourLocations.dart';
import 'package:dollar_pay/pages/vendor/NewVendor.dart';
import 'package:dollar_pay/pages/vendor/VendorLocation.dart';
import 'package:dollar_pay/pages/common/NewSplash.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String home = '/';
  static String splash = '/splash';
  static String newSplash = '/newsplash';
  static String login = '/login';
  static String register = '/register';
  static String termsAndCond = '/terms';
  static String userProfile = '/user_profile';
  static String userPayQRScanner = '/pay_qr_scanner';
  static String userInfo = '/user_info';
  static String userAddNewLocation = '/user_add_location';
  static String userLocation = '/user_location';
  static String vendorAddLocation = '/vendor_add_location';
  static String newVendor = '/vendor';
  static String vendorOverview = '/vendor_overview';
  static String vendorTransaction = '/vendor_transaction';
  static String notFound = '/not_found';

  static String getHomeRoute() => home;
  static String getSplash() => splash;
  static String getNewSplash() => newSplash;
  static String getLogin() => login;
  static String getRegister() => register;
  static String getTermsAndCond() => termsAndCond;
  static String getUserProfile() => userProfile;
  static String getUserPayQRScanner() => userPayQRScanner;
  static String getUserInfo() => userInfo;
  static String getUserNewLocation() => userAddNewLocation;
  static String getUserLocaitons() => userLocation;
  static String getVendorLocaitons() => vendorAddLocation;
  static String getNewVendor() => newVendor;
  static String getVendorOverview() => vendorOverview;
  static String getVendorTransaction() => vendorTransaction;
  static String getNotFound() => notFound;

  static List<GetPage> routes = [
    GetPage(page: () => SplashScreen(), name: splash),
    GetPage(page: () => NewSplash(), name: newSplash),
    GetPage(page: () => LoginPage(), name: login),
    GetPage(page: () => RegisterPage(), name: register),
    GetPage(page: () => TermsAndConditions(), name: termsAndCond),
    GetPage(page: () => UserProfile(), name: userProfile),
    GetPage(page: () => QRMobileScanner(), name: userPayQRScanner),
    GetPage(page: () => UserInfo(), name: userInfo),
    GetPage(page: () => AddNewLocation(), name: userAddNewLocation),
    GetPage(page: () => YourLocations(), name: userLocation),
    GetPage(page: () => AddVendorLocation(), name: vendorAddLocation),
    GetPage(page: () => NewVendor(), name: newVendor),
    GetPage(page: () => Overview(), name: vendorOverview),
    GetPage(page: () => TransactionPage(), name: vendorTransaction),
    GetPage(page: () => NotFoundPage(), name: notFound),

    //unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
  ];
}
