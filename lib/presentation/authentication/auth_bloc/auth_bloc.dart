import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  AuthBloc(this.dio, this.repository) : super(AuthState.authInitial()) {
    on<_Login>(_login);
  }

  Future<void> _login(_Login event, Emitter<AuthState> emit) async {
    emit(AuthState.authLoading());

    try {
      final result = await repository.login(
        username: event.username,
        password: event.password,
      );
      emit(AuthState.authSuccess());
    } catch (e) {
      print('the error from authbloc: ${e}');
      emit(AuthState.authError());
    }
  }
}
