import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://fakestoreapi.com/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static getData({required String endPoint}) async {
    return await dio!.get(endPoint);
  }

  static postData({required String endPoint, required Map data}) async {
    return await dio!.post(endPoint, data: data);
  }

  static putData({
    required String endPoint,
    required Map data,
  }) async {
    return await dio!.put(endPoint, data: data);
  }
}
