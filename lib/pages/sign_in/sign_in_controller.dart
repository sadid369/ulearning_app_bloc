// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;
  SignInController({
    required this.context,
  });

  void handleSignIn(String type) {
    try {
      if (type == "email") {
        final state = context.read<SigninBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
      }
    } catch (e) {}
  }
}
