import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/home_page.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBlocBloc, WelcomeBlocState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      context
                          .read<WelcomeBlocBloc>()
                          .add(WelcomeBlocChangeEvents(changedIndex: value));
                    },
                    children: [
                      _page(
                        index: 1,
                        buttonName: 'Next',
                        title: "First See Learning",
                        subTitle:
                            "Forget about a for of paper all knowledge in one learning!",
                        context: context,
                        imagePath: "assets/images/reading.png",
                      ),
                      _page(
                        index: 2,
                        buttonName: 'Next',
                        title: "Connect With Everyone",
                        subTitle:
                            "Always keep in touch with your totor & friend. Let's get connected",
                        context: context,
                        imagePath: "assets/images/boy.png",
                      ),
                      _page(
                        index: 3,
                        buttonName: 'Get Started',
                        title: "Always Fascinated Learning",
                        subTitle:
                            "Anywhere , anytime. The time is at our discretion so study whenever you want",
                        context: context,
                        imagePath: "assets/images/man.png",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 15.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                        size: const Size.square(8),
                        activeSize: const Size(18, 8),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page({
    required int index,
    required BuildContext context,
    required String buttonName,
    required String title,
    required String subTitle,
    required String imagePath,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const HomePage(),
              // ));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/signIn', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 100.h,
              right: 25.w,
              left: 25.w,
            ),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
