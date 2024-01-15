// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String rePassword;
  const RegisterState({
    required this.userName,
    required this.email,
    required this.password,
    required this.rePassword,
  });

  RegisterState copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }

  @override
  String toString() {
    return 'RegisterState(userName: $userName, email: $email, password: $password, rePassword: $rePassword)';
  }
}

// class RegisterInitial extends RegisterState {}
