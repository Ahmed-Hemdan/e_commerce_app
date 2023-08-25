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
}
