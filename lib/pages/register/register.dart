import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.h),
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar('Sign Up'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: reusableText('Enter details below free sign up')),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('User name'),
                    buildTextField(
                        'Enter your user name ', 'name', 'user', (value) {}),
                    reusableText('Email'),
                    buildTextField('Enter your email address ', 'email',
                        'email', (value) {}),
                    reusableText('Password'),
                    buildTextField(
                        'Enter your Password', 'password', 'lock', (value) {}),
                    reusableText('Re-enter your password'),
                    buildTextField('re-enter your password to confirm',
                        'password', 'lock', (value) {}),
                  ],
                ),
              ),
              // forgotPassword(),
              Container(
                margin: EdgeInsets.only(left: 25.w),
                child: reusableText('Enter details below free sign up'),
              ),
              buildLogInAndRegButton('Sign up', 'login', () {}),
            ],
          ),
        ),
      ),
    );
  }
}
