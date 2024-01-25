import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/base_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Container(child: reusableText(text: "Settings")),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Congirm Logout'),
            content: Text('Confirm Logout'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: func,
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );
    },
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            'assets/icons/Logout.png',
          ),
        ),
      ),
    ),
  );
}
