// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/repositories/auth_repository.dart' as _i578;
import '../data/repositories/product_repository.dart' as _i162;
import '../presentation/authentication/auth_bloc/auth_bloc.dart' as _i860;
import '../presentation/product/blocs/favorite/favorite_bloc.dart' as _i178;
import '../presentation/product/blocs/product/product_bloc/product_bloc.dart' as _i102;
import 'app_interceptor.dart' as _i824;
import 'db_module.dart' as _i982;
import 'network_module.dart' as _i567;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dBModule = _$DBModule();
    final networkModule = _$NetworkModule();
    gh.singleton<_i558.FlutterSecureStorage>(() => dBModule.secureStorage);
    gh.singleton<_i361.Dio>(() => networkModule.dioForInterceptor);
    gh.factory<_i162.IProductRepository>(
      () => _i162.ProductRepository(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio,
      instanceName: 'apiClient',
    );
    gh.factory<_i578.IAuthRepository>(
      () => _i578.AuthRepository(gh<_i361.Dio>()),
    );
    gh.singleton<_i824.AppInterceptor>(
      () => _i824.AppInterceptor(gh<_i361.Dio>()),
    );
    gh.factory<_i102.ProductBloc>(
      () => _i102.ProductBloc(
        gh<_i162.IProductRepository>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i178.FavoriteBloc>(
      () => _i178.FavoriteBloc(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i860.AuthBloc>(
      () => _i860.AuthBloc(gh<_i361.Dio>(), gh<_i578.IAuthRepository>()),
    );
    return this;
  }
}

class _$DBModule extends _i982.DBModule {}

class _$NetworkModule extends _i567.NetworkModule {}
