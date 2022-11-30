import 'dart:convert';
import '../../model/VendorModel.dart';
import '../networkConstant/service_locator.dart';
import 'VendorRepository.dart';

class VendorController {
  final vendorRepository = getIt.get<VendorRepository>();

  Future<Map<String, dynamic>> vendorLogin(
      String email, String password) async {
    final Map<String, String> credentials = <String, String>{};
    credentials['"username"'] = '"${email.toString()}"';
    credentials['"password"'] = '"${password.toString()}"';

    String encoded = base64.encode(utf8.encode(credentials.toString()));

    final Map<String, String> queryParameters = <String, String>{};
    queryParameters['credentials'] = '${encoded}';
    final user = await vendorRepository.vendorLogin(queryParameters);
    return user;
  }

  Future<bool> vendorRegister(VendorModel vendorModel) async {
    final result = await vendorRepository.vendorRegister(vendorModel);
    return result;
  }
}
