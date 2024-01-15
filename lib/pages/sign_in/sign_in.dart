import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/common_widgets.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';
import 'dart:developer';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(bottom: 20.h),
          color: Colors.white,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('Log In'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child: reusableText('Or use your email account login')),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Email'),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            'Enter your email address ', 'email', 'user',
                            (value) {
                          context
                              .read<SigninBloc>()
                              .add(EmailEvents(email: value));
                        }),
                        reusableText('Password'),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            'Enter your Password', 'password', 'lock', (value) {
                          context
                              .read<SigninBloc>()
                              .add(PasswordEvents(password: value));
                        }),
                      ],
                    ),
                  ),
                  forgotPassword(),
                  buildLogInAndRegButton('Log In', 'login', () async {
                    await SignInController(context: context)
                        .handleSignIn('email');
                    log('login button');
                  }),
                  buildLogInAndRegButton('Sign Up', 'register', () {
                    Navigator.of(context).pushNamed(
                      '/register',
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
