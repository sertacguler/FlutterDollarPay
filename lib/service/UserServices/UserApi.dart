import 'package:dollar_pay/model/UserModel.dart';
import 'package:dollar_pay/service/networkConstant/DioClient.dart';
import 'package:dollar_pay/service/networkConstant/Endpoints.dart';
import 'package:dio/dio.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<Response> userLogin(Map<String, dynamic> queryParam) async {
    try {
      final Response response =
          await dioClient.get(Endpoints.userLogin, queryParameters: queryParam);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> userRegister(UserModel userModel) async {
    try {
      print(userModel.toJson());
      var response = await dioClient.put(
        Endpoints.userRegister,
        data: {
          "id": null,
          "username": userModel.userName,
          "surname": "",
          "name": "",
          "email": userModel.email,
          "password": userModel.password,
          "createdAt": null,
          "updatedAt": null,
          "mobile": ""
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

/*

  Future<Response> addUserApi(String name, String job) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.users,
        data: {
          'name': name,
          'job': job,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateUserApi(int id, String name, String job) async {
    try {
      final Response response = await dioClient.put(
        Endpoints.users + '/$id',
        data: {
          'name': name,
          'job': job,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUserApi(int id) async {
    try {
      await dioClient.delete(Endpoints.users + '/$id');
    } catch (e) {
      rethrow;
    }
  }

*/