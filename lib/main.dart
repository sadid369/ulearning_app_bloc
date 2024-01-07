import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/home_page.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';
// import 'dart:developer' as devtools show log;
// import 'package:flutter/foundation.dart';

// extension Log on Object {
//   void log() => devtools.log(toString());
// }

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => WelcomeBlocBloc(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'uLearning App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Welcome(),
          routes: {
            '/myHomePage': (context) => const HomePage(),
            '/signIn': (context) => const SignIn(),
          },
        );
      },
    );
  }
}
