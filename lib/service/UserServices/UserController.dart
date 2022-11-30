import 'dart:convert';
import '../../model/UserModel.dart';
import '../networkConstant/service_locator.dart';
import 'UserRepository.dart';

class UserController {
  final userRepository = getIt.get<UserRepository>();

  Future<Map<String, dynamic>> userLogin(String email, String password) async {
    final Map<String, String> credentials = <String, String>{};
    credentials['"username"'] = '"${email.toString()}"';
    credentials['"password"'] = '"${password.toString()}"';

    String encoded = base64.encode(utf8.encode(credentials.toString()));

    final Map<String, String> queryParameters = <String, String>{};
    queryParameters['credentials'] = '${encoded}';
    final user = await userRepository.userLogin(queryParameters);
    return user;
  }

  Future<bool> userRegister(UserModel userModel) async {
    final result = await userRepository.userRegister(userModel);
    return result;
  }
}
