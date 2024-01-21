// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'dart:developer';

class SignInController {
  final BuildContext context;
  SignInController({
    required this.context,
  });

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SigninBloc>().state;

        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: 'you need to fill email address');
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'you need to fill password');
          return;
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            toastInfo(msg: 'user does not exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'user email is not verified');
          }
          var user = credential.user;
          if (user != null) {
            toastInfo(msg: 'user  exist');
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, '12345678');
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/application', (route) => false);
          } else {
            toastInfo(msg: 'no user');
            return;
          }
        } on FirebaseAuthException catch (f) {
          if (f.code == 'user-not-found') {
            toastInfo(msg: 'you need to fill email address');
          } else if (f.code == 'wrong-password') {
            toastInfo(msg: 'wrong password provided for that user.');
          } else if (f.code == 'invalid-email') {
            toastInfo(msg: 'invalid-email');
          } else {
            toastInfo(msg: 'here ${f.code}');
          }
        } catch (e) {
          toastInfo(msg: '$e');
        }
      }
    } catch (e) {
      toastInfo(msg: '$e');
    }
  }
}
