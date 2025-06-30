part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.authInitial() = AuthInitial;
  const factory AuthState.authLoading() = AuthLoading;
  const factory AuthState.authSuccess() = AuthSuccess;
  const factory AuthState.authError() = AuthError;
}
