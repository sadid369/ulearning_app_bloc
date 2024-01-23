import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_bloc.dart';

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
Widget sliderView(
    {required BuildContext context, required HomePageState state}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
        ),
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBloc>().add(HomePageDots(index: value));
          },
          children: [
            _sliderContainer(path: 'assets/icons/art.png'),
            _sliderContainer(path: 'assets/icons/Image(1).png'),
            _sliderContainer(path: 'assets/icons/Image(2).png'),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThirdElementText,
              activeColor: AppColors.primaryElement,
              size: Size.square(5.0),
              activeSize: Size(17, 5),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ),
      )
    ],
  );
}

Widget _sliderContainer({String path = 'assets/icons/art.png'}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.h),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          path,
        ),
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusableText(text: 'Choose your course'),
            GestureDetector(
              onTap: () {},
              child: _reusableText(
                  text: 'See all',
                  color: AppColors.primaryThirdElementText,
                  fontSize: 10),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            _reusableMenuText(text: 'All'),
            _reusableMenuText(
                text: 'Popular',
                textColor: AppColors.primaryThirdElementText,
                backgroundColor: Colors.white),
            _reusableMenuText(
                text: 'Newest',
                textColor: AppColors.primaryThirdElementText,
                backgroundColor: Colors.white),
          ],
        ),
      )
    ],
  );
}

Widget _reusableText({
  required String text,
  Color color = AppColors.primaryText,
  int fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize.sp,
      ),
    ),
  );
}

Widget _reusableMenuText({
  required String text,
  Color textColor = AppColors.primaryElementText,
  Color backgroundColor = AppColors.primaryElement,
}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.only(
      left: 15.w,
      right: 15.w,
      top: 5.h,
      bottom: 5.h,
    ),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(
        color: backgroundColor,
      ),
    ),
    child: _reusableText(
      text: text,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 11,
    ),
  );
}

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/icons/Image(2).png',
        ),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          'Best course for It and Engineering',
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          'Flutter Best Course',
          style: TextStyle(
            color: AppColors.primaryFourthElementText,
            fontWeight: FontWeight.normal,
            fontSize: 8.sp,
          ),
        ),
      ],
    ),
  );
}
