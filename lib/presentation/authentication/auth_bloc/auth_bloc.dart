import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kifiya_test/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Dio dio;
  final IAuthRepository repository;
  final FlutterSecureStorage storage;
  AuthBloc(this.dio, this.repository, this.storage)
    : super(AuthState.authInitial()) {
    on<_Login>(_login);
    on<_Logout>(_logout);
    on<_CheckInitialAuth>(_checkInitialAuth);
  }

  Future<void> _login(_Login event, Emitter<AuthState> emit) async {
    emit(AuthState.authLoading());

    try {
      final result = await repository.login(
        username: event.username,
        password: event.password,
      );
      print('the result from auth: $result');
      await storage.write(key: "token", value: "result");
      emit(AuthState.authSuccess());
    } catch (e) {
      print('the error from authbloc: ${e}');
      emit(AuthState.authError());
    }
  }

  Future<void> _checkInitialAuth(
    _CheckInitialAuth event,
    Emitter<AuthState> emit,
  ) async {
    final userSession = await storage.read(key: 'token');
    if (userSession != null) {
      emit(AuthState.authSuccess());
    }
  }

  Future<void> _logout(_Logout event, Emitter<AuthState> emit) async {
    await storage.delete(key: 'Token');
    emit(AuthState.authInitial());
  }
}
