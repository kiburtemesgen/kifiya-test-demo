part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String username,
    required String password,
  }) = _Login;

  const factory AuthEvent.checkInitialAuth() = _CheckInitialAuth;
  const factory AuthEvent.logout() = _Logout;
}
