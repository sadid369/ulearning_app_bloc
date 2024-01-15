// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class UserNameEvent extends RegisterEvent {
  final String userName;
  UserNameEvent({
    required this.userName,
  });
}

class EmailEvent extends RegisterEvent {
  final String email;
  EmailEvent({
    required this.email,
  });
}

class PasswordEvent extends RegisterEvent {
  final String password;
  PasswordEvent({
    required this.password,
  });
}

class RePasswordEvent extends RegisterEvent {
  final String rePassword;
  RePasswordEvent({
    required this.rePassword,
  });
}
