import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppInterceptor extends QueuedInterceptorsWrapper {
  final Dio dio;

  AppInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    return;
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}
