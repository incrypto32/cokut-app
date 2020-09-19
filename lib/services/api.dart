import 'package:cokut/services/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api {
  static final String url = "http://192.168.43.65:4000/api/v1";

  Dio dio = Dio(
    BaseOptions(
      baseUrl: url,
    ),
  );

// Form data post wrapper
  Future<Response> postFormData(
    Map<String, dynamic> map,
    String endpoint,
  ) async {
    var token;
    try {
      token = "Bearer " + (await authService.currentUser()) ?? "";
    } catch (e) {
      print(e);
      token = "";
    }

    var dio = Dio(
      BaseOptions(
        baseUrl: url,
        headers: {
          "Content-Type": "application/json",
          "Authentication": token,
        },
      ),
    );

    print(dio.options.headers);
    Response response;

    try {
      response = await dio.post(
        endpoint,
        data: map,
      );
    } on DioError catch (e) {
      print(e);
      return e.response;
    } catch (e) {
      return null;
    }
    return response;
  }

// Check if a phone number is already associated with another number
  Future<Response> checkPhoneExistence(phone) async {
    var map = {"phone": phone};
    return postFormData(map, "/checkphone");
  }

// Registers a user with server
  Future<Response> registerUser({
    @required String name,
    @required String email,
    @required String phone,
  }) async {
    var map = {
      "phone": phone,
      "email": email,
      "name": name,
    };
    return postFormData(map, "/register");
  }

// Registers a user with server
  Future<Response> checkUser({
    @required String email,
    @required String phone,
  }) async {
    var map = {
      "phone": phone,
      "email": email,
    };
    return postFormData(map, "/checkuser");
  }
}

Api api = Api();
