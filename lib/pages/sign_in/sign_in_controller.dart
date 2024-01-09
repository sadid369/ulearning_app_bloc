// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;
  SignInController({
    required this.context,
  });

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SigninBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //
        }
        if (password.isEmpty) {
          //
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            //
          }
          if (!credential.user!.emailVerified) {
            //
          }
          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase
          } else {
            //we have error
          }
        } on FirebaseAuthException catch (f) {
          print('Firebase Auth Exception : $f');
        } catch (e) {
          print('$e');
        }
      }
    } catch (e) {}
  }
}
