import 'package:cokut/infrastructure/api.dart';
import 'package:cokut/models/user.dart';
import 'package:cokut/utils/logger.dart';
import 'package:dio/dio.dart';

class GetUserFailure implements Exception {}

class UserRepository {
  Api _api = Api();

  // Get User
  Future<User> getUser(String token, {int i = 0}) async {
    try {
      Map userData = {};
      var dio = _api.superDio("");
      Response resp = await dio.get('/getuser');
      if (resp.data["exist"]) {
        userData = resp.data["user"];
        userData["registered"] = true;
      } else if (!resp.data["exist"]) {
        userData["registered"] = false;
      }
      return User.fromJson(userData);
    } catch (e) {
      logger.e(e);
      throw GetUserFailure;
    }
  }

  // Register Users
}
