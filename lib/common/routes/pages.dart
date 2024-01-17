// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        routes: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (context) => WelcomeBlocBloc(),
        ),
      ),
      PageEntity(
        routes: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (context) => SigninBloc(),
        ),
      ),
      PageEntity(
        routes: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ),
      // PageEntity(
      //   routes: AppRoutes.APPLICATION,
      //   page: const Welcome(),
      //   bloc: BlocProvider(
      //     create: (context) => WelcomeBlocBloc(),
      //   ),
      // ),
    ];
  }

// return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
}

class PageEntity {
  String routes;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.routes,
    required this.page,
    this.bloc,
  });
}
