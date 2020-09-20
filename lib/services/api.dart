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
    return postFormData(map, "/utils/checkphone");
  }

// Registers a user with server
  Future<bool> registerUser({
    @required String name,
    @required String email,
    @required String phone,
  }) async {
    Response resp;
    bool success = false;
    var map = {
      "phone": phone,
      "email": email,
      "name": name,
    };
    print(map);
    try {
      print("Inside Register DIO");

      resp = await postFormData(map, "/register");
      print(resp);
      if (resp != null && resp.data != null) {
        if (resp.data["success"]) {
          return true;
        }
      }
    } catch (e) {
      print(e);
      return false;
    }
    return success;
  }

// Registers a user with server
  Future<bool> checkUser({
    @required String email,
    @required String phone,
  }) async {
    bool go = false;
    var map = {
      "phone": phone,
      "email": email,
    };
    print("INSIDE CHECKUSER");
    print(map);
    var resp = await postFormData(map, "/utils/checkuser");
    if (resp != null) {
      print(map);
      print(resp.data);
      if (resp.data["success"]) {
        return ((!resp.data["exist"]) ?? false);
      }
    }
    return go;
  }
}

Api api = Api();
