import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kifiya_test/core/app_interceptor.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio get dioForInterceptor =>
      Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'));

  @Named('apiClient')
  @lazySingleton
  Dio get dio =>
      Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'))
        ..interceptors.add(AppInterceptor(dioForInterceptor));
}
