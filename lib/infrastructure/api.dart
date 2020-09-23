// import 'package:cokut/models/user.dart';
// import 'package:cokut/services/auth.dart';
// import 'package:dio/dio.dart';

// class Api {
//   static final String v1 = "http://192.168.43.65:4000/api/v1";
//   static final String utils = "http://192.168.43.65:4000/utils";

//   Dio mainDio = Dio(
//     BaseOptions(
//       baseUrl: v1,
//       headers: {"Content-Type": "application/json"},
//     ),
//   );

// // Get firebase TOken
//   Future<String> getFirebaseToken() async {
//     var token;
//     try {
//       token = "Bearer " + (await authService.currentUser()) ?? "";
//     } catch (e) {
//       print(e);
//       token = "";
//     }
//     return token;
//   }

// // NewDio
//   Future<Dio> utilDio() async {
//     return Dio(
//       BaseOptions(
//         baseUrl: utils,
//         headers: {
//           "Content-Type": "application/json",
//         },
//       ),
//     );
//   }

//   // SuperDio
//   Future<Dio> superDio() async {
//     return Dio(
//       BaseOptions(
//         baseUrl: v1,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": (await getFirebaseToken()),
//         },
//       ),
//     );
//   }

// // Form data post wrapper
//   Future<Response> postData(
//     Map<String, dynamic> map,
//     String endpoint, {
//     bool util = false,
//   }) async {
//     Response response;
//     Dio dio = util ? await utilDio() : await superDio();
//     try {
//       response = await dio.post(
//         endpoint,
//         data: map,
//       );
//     } on DioError catch (e) {
//       print(e);
//       if (e.response != null && e.response.runtimeType != String) {
//         return e.response;
//       }
//       return null;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//     return response;
//   }

//   // Form data post wrapper
//   Future<Response> getData(
//     Map<String, dynamic> map,
//     String endpoint, {
//     bool util = false,
//   }) async {
//     Response response;
//     Dio dio = util ? await utilDio() : superDio();
//     try {
//       response = await dio.request(
//         endpoint,
//         data: map,
//         options: Options(
//           method: "GET",
//           contentType: "application/json",
//           responseType: ResponseType.json,
//         ),
//       );
//     } on DioError catch (e) {
//       return e.response;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//     return response;
//   }

//   // Register User
//   Future<dynamic> registerUser({
//     String name,
//     String email,
//     String phone,
//     String gid,
//   }) async {
//     Map<String, dynamic> map = {
//       "name": name,
//       "email": email,
//       "phone": phone,
//     };

//     Response resp = await postData(map, "/register");

//     if (resp == null) {
//       return null;
//     }

//     if (resp.data != null) {
//       return resp.data;
//     }

//     return null;
//   }

//   // Get User
//   Future<User> getUser({int i = 0}) async {
//     try {
//       var dio = await superDio();
//       var resp = await dio.get('/getuser');

//       if (resp == null) {
//         return null;
//       }

//       print(resp.data);

//       if (resp.data != null && resp.data.runtimeType != String) {
//         if (resp.data["success"] && resp.data["exist"]) {
//           Map<String, dynamic> u = resp.data["user"];
//           var user = User.fromJson(u);
//           user.registered = true;
//           return user;
//         }
//       }
//     } on DioError catch (e) {
//       print(e);
//       var resp = e.response;

//       if (resp != null) {
//         print(resp.data);
//         if (resp.data != null &&
//             resp.data.runtimeType != String &&
//             resp.statusCode != 500) {
//           if (resp.data["success"] && !resp.data["exist"]) {
//             return User(registered: false);
//           }
//         }
//       }
//     } catch (e) {
//       print(i);
//       await Future.delayed(Duration(seconds: 10));
//       if (i < 150) {
//         return getUser(i: i++);
//       }
//     }
//     if (i < 150) {
//       print(i);
//       await Future.delayed(Duration(seconds: 10));
//       return getUser(i: ++i);
//     }
//     return null;
//   }
// }

// Api api = Api();
