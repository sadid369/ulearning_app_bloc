import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/application/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: buildPage(_index),
        bottomNavigationBar: Container(
          width: 375.w,
          height: 58.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.h),
              topRight: Radius.circular(20.h),
            ),
            color: AppColors.primaryElement,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(
                  0.1,
                ),
                spreadRadius: 1,
                blurRadius: 1,
              )
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourthElementText,
            currentIndex: _index,
            elevation: 0,
            onTap: (value) {
              _index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/home.png'),
                ),
                label: 'Home',
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/home.png',
                    color: AppColors.primaryElement,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/search2.png'),
                ),
                label: 'Search',
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/search2.png',
                    color: AppColors.primaryElement,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/play-circle1.png'),
                ),
                label: 'Course',
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/play-circle1.png',
                    color: AppColors.primaryElement,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/message-circle.png'),
                ),
                label: 'Chat',
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/message-circle.png',
                    color: AppColors.primaryElement,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset('assets/icons/person2.png'),
                ),
                label: 'Profile',
                activeIcon: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset(
                    'assets/icons/person2.png',
                    color: AppColors.primaryElement,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
