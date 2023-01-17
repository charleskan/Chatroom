import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pma001/features/auth/blocs/auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc([AuthState authState = const AuthState.initial()])
      : super(authState);

  // Stream<bool?> get isLoggedInStream => authState.stream;

  Future<void> retrieveLoginState() async {
    emit(AuthState(isRetrievingLoginState: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthState(
        isRetrievingLoginState: false,
        user: User(
          id: 'me',
          name: 'John Doe',
          email: '',
          photoUrl: '',
        )));
  }

  Future<void> logout() async {
    emit(AuthState(isRetrievingLoginState: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthState(isRetrievingLoginState: false, user: null));
  }
}

abstract class AuthEvent {}

class RetrieveLoginStateEvent extends AuthEvent {}

class Logout extends AuthEvent {}

class AuthBlocV2 extends Bloc<AuthEvent, AuthState> {
  AuthBlocV2([AuthState authState = const AuthState.initial()])
      : super(authState) {
    on<RetrieveLoginStateEvent>(_retrieveLoginState);
    on<Logout>(_logout);
  }

  @override
  _retrieveLoginState(
    RetrieveLoginStateEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState(isRetrievingLoginState: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthState(
        isRetrievingLoginState: false,
        user: User(
          id: 'me',
          name: 'John Doe',
          email: '',
          photoUrl: '',
        )));
  }

  _logout(
    Logout event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState(isRetrievingLoginState: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthState(isRetrievingLoginState: false, user: null));
  }
}
