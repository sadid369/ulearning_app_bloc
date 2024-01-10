// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          log('Email Empty');
        }
        if (password.isEmpty) {
          log('password is empty');
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            log('user does not exist');
          }
          if (!credential.user!.emailVerified) {
            log('user email not verified');
          }
          var user = credential.user;
          if (user != null) {
            log('user  exist');
          } else {
            log('no user ');
          }
        } on FirebaseAuthException catch (f) {
          if (f.code == 'user-not-found') {
            log('No user found for that email.');
          } else if (f.code == 'wrong-password') {
            log('wrong password provided for that user.');
          } else if (f.code == 'invalid-email') {
            log('invalid-email');
          } else {
            log('here ${f.code}');
          }
        } catch (e) {
          log('another $e');
        }
      }
    } catch (e) {
      log('here $e');
    }
  }
}
