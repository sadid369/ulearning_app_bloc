import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/icons/person.png',
                ),
              )),
            ),
          ),
        ],
      ),
    ),
  );
}

// reusable big text widget
Widget homePageText(
    {required String text, Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 24.sp,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(
            color: AppColors.primaryFourthElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            Flexible(
              child: Container(
                width: 240.w,
                height: 40.h,
                child: TextField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5),
                    hintText: 'search your course',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    helperStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    hintStyle: TextStyle(
                      color: AppColors.primarySecondaryElementText,
                    ),
                  ),
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp),
                  autocorrect: false,
                  obscureText: false,
                ),
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.w),
            border: Border.all(
              color: AppColors.primaryElement,
            ),
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
    ],
  );
}

//f
Widget sliderView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        height: 160.h,
        decoration: BoxDecoration(),
        child: PageView(
          children: [
            Container(
              width: 325.w,
              height: 160.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/art.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
