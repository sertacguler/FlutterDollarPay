import 'package:dollar_pay/model/VendorModel.dart';
import 'package:dollar_pay/service/networkConstant/DioClient.dart';
import 'package:dollar_pay/service/networkConstant/Endpoints.dart';
import 'package:dio/dio.dart';

class VendorApi {
  final DioClient dioClient;

  VendorApi({required this.dioClient});

  Future<Response> vendorLogin(Map<String, dynamic> queryParam) async {
    try {
      final Response response = await dioClient.get(Endpoints.vendorLogin,
          queryParameters: queryParam);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> vendorRegister(VendorModel vendorModel) async {
    try {
      var response = await dioClient.put(
        Endpoints.vendorRegister,
        data: {
          "username": vendorModel.username,
          "email": vendorModel.email,
          "password": vendorModel.password,
          "vendorAbn": "",
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