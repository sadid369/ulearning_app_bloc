// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class EmailEvents extends SigninEvent {
  final String email;
  EmailEvents({
    required this.email,
  });
}

class PasswordEvents extends SigninEvent {
  final String password;
  PasswordEvents({
    required this.password,
  });
}
