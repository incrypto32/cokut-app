import 'package:cokut/infrastructure/services/api.dart';
import 'package:cokut/utils/logger.dart';
import 'package:dio/dio.dart';

void main() async {
  var api = Api();

  print("1");

  CancelToken cancelToken = CancelToken();

  try {
    var a = dos(cancelToken, api);
    cancelToken.cancel();
    await a;
  } catch (e) {
    print("IVIDE");
    logger.e(e);
  }
}

void dos(CancelToken cancelToken, Api api) async {
  print("dos fired");
  try {
    var data = await api.search("chicken", "TEST_TOKEN", cancelToken);
    logger.i(data);
  } catch (e) {
    print("hi");
    logger.e(e);
  }
}

void cancel(CancelToken cancelToken, Api api) {
  cancelToken.cancel();
}
