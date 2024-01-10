// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signin_bloc.dart';

class SigninState {
  final String email;
  final String password;
  SigninState({
    this.email = '',
    this.password = '',
  });

  SigninState copyWith({
    String? email,
    String? password,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() => 'SigninState(email: $email, password: $password)';
}
