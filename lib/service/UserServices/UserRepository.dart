import 'package:dollar_pay/service/networkConstant/DioExceptions.dart';
import 'package:dollar_pay/model/UserModel.dart';
import 'package:dio/dio.dart';
import 'UserApi.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository(this.userApi);

  Future<Map<String, dynamic>> userLogin(Map<String, String> queryParam) async {
    try {
      final response = await userApi.userLogin(queryParam);
      return response.data;
    } on DioError catch (e) {
      Map<String, String> result = <String, String>{};
      result['error'] = e.response?.data;
      return result;
    }
  }

  Future<dynamic> userRegister(UserModel userModel) async {
    try {
      final response = await userApi.userRegister(userModel);
      return response.statusCode == 200;
    } on DioError catch (e) {
      Map<String, String> result = <String, String>{};
      result['error'] = e.response?.data;
      return result;
    }
  }
}

/*

  Future<List<UserModel>> getUsersRequested() async {
    try {
      final response = await userApi.getUsersApi();
      final users = (response.data['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      return users;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }



  Future<NewUser> addNewUserRequested(String name, String job) async {
    try {
      final response = await userApi.addUserApi(name, job);
      return NewUser.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<NewUser> updateUserRequested(int id, String name, String job) async {
    try {
      final response = await userApi.updateUserApi(id, name, job);
      return NewUser.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<void> deleteNewUserRequested(int id) async {
    try {
      await userApi.deleteUserApi(id);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  */