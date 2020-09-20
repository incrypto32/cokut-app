import 'dart:io';

import 'package:cokut/models/user.dart';
import 'package:cokut/services/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api {
  static final String v1 = "http://192.168.43.65:4000/api/v1";
  static final String utils = "http://192.168.43.65:4000/utils";
  Dio mainDio = Dio(BaseOptions(
    baseUrl: v1,
    headers: {"Content-Type": "application/json"},
  ));

// Get firebase TOken
  Future<String> getFirebaseToken() async {
    var token;
    try {
      token = "Bearer " + (await authService.currentUser()) ?? "";
    } catch (e) {
      print(e);
      token = "";
    }
    return token;
  }

// NewDio
  Future<Dio> utilDio() async {
    return Dio(
      BaseOptions(
        baseUrl: utils,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  // SuperDio
  Future<Dio> superDio() async {
    return Dio(
      BaseOptions(
        baseUrl: v1,
        headers: {
          "Content-Type": "application/json",
          "Authorization": (await getFirebaseToken()),
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
    Response response;
    Dio dio = util ? await utilDio() : await superDio();
    try {
      response = await dio.post(
        endpoint,
        data: map,
      );
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return null;
    }
    return response;
  }

  // Form data post wrapper
  Future<Response> getData(
    Map<String, dynamic> map,
    String endpoint, {
    bool util = false,
  }) async {
    Response response;
    Dio dio = util ? await utilDio() : superDio();
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
    } catch (e) {
      print(e);
      return null;
    }
    return response;
  }

// Checks User By GID
  Future<bool> checkUserByGID({
    @required String gid,
  }) async {
    var map = {
      "gid": gid,
    };
    var resp = await postData(map, "/checkgid", util: true);
    if (resp != null && (resp.statusCode == 200 || resp.statusCode == 417)) {
      print(resp.data);
      if (resp.data["success"]) {
        return ((resp.data["exist"]) ?? null);
      }
    }
    return null;
  }

  // Register User
  Future<Map<String, dynamic>> registerUser({
    String name,
    String email,
    String phone,
  }) async {
    Map<String, dynamic> map = {
      "name": name,
      "email": email,
      "phone": phone,
    };
    print("Inside RegisterUser");
    print(map);

    Response resp = await postData(map, "/register");
    print(resp);
    if (resp != null && (resp.statusCode == 200 || resp.statusCode == 417)) {
      print("T 1");
      if (resp.data != null) {
        print("T 2");
        var data = resp.data;
        print(data);
        return data;
      }
    }
    print("T 3");
    return null;
  }

  // Get User
  Future<User> getUser() async {
    print("Inside get user");
    try {
      print("Inside get user 1");
      var dio = await superDio();
      var resp = await dio.get('/getuser');
      print("Inside get user 2");
      print(resp);
      if (resp != null) {
        print("Inside get user 3");
        if (resp.data != null && resp.statusCode != 404) {
          Map<String, dynamic> u = resp.data["user"];
          return User.fromJson(u);
        }
      }
    } on DioError catch (e) {
      print(e.response);
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }
}

Api api = Api();
