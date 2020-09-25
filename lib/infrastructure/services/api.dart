import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Api {
//   static final String v1 = "http://192.168.43.65:4000/api/v1";
//   static final String utils = "http://192.168.43.65:4000/utils";
  static final String v1 = "http://cokut.herokuapp.com/api/v1";
  static final String utils = "http://cokut.herokuapp.com/utils";

// Main Dio
  Dio mainDio = Dio(
    BaseOptions(
      baseUrl: v1,
      headers: {"Content-Type": "application/json"},
    ),
  );

// Util Dio
  Dio utilDio() {
    return Dio(
      BaseOptions(
        baseUrl: utils,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

// Super Dio
  Dio superDio(String token) {
    return Dio(
      BaseOptions(
        baseUrl: v1,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token,
        },
      ),
    );
  }

// Form data post wrapper
  Future<Response> postData(
    Map<String, dynamic> map,
    String endpoint, {
    bool util = false,
  }) async {
    Dio dio = util ? await utilDio() : await superDio("");
    try {
      Response response = await dio.post(
        endpoint,
        data: map,
      );
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  // Form data post wrapper
  Future<Response> getData(
    Map<String, dynamic> map,
    String endpoint, {
    bool util = false,
  }) async {
    Response response;
    Dio dio = util ? await utilDio() : superDio("");
    try {
      response = await dio.request(
        endpoint,
        data: map,
        options: Options(
          method: "GET",
          contentType: "application/json",
          responseType: ResponseType.json,
        ),
      );
    } on DioError catch (e) {
      return e.response;
    }
    return response;
  }

  // Register User
  Future<dynamic> registerUser({
    @required String name,
    String email,
    String phone,
    String gid,
  }) async {
    Map<String, dynamic> map = {
      "name": name,
      "email": email,
      "phone": phone,
    };
    Response resp = await postData(map, "/register");
    return resp.data;
  }

  // Get User
  Future<Map<String, dynamic>> getUser(String token, {int i = 0}) async {
    Map userData = {};
    var dio = superDio(token);
    Response resp = await dio.get('/getuser');
    if (resp.data["exist"]) {
      userData = resp.data["user"];
      userData["registered"] = true;
    } else if (!resp.data["exist"]) {
      userData["registered"] = false;
    }
    return userData;
  }
}
