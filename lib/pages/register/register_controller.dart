// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({
    required this.context,
  });

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: 'User name cannot be empty');
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: 'Email cannot be empty');
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: 'Password cannot be empty');
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: 'Password cannot be empty');
      return;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: 'Verify Your email, check your email.');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (f) {
      toastInfo(msg: "$f");
      log("Register Controller f: $f");
    } catch (e) {
      toastInfo(msg: "$e");
      log("Register Controller e: $e");
    }
  }
}
