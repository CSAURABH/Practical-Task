import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MyContainer extends StatelessWidget {
  String title;
  VoidCallback onTap;
  MyContainer({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        height: 175.h,
        width: 343.w,
        decoration: BoxDecoration(
          color: const Color(0xff6D7072),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 22.sp,
              color: const Color(0xffFFFFFf),
            ),
          ),
        ),
      ),
    );
  }
}
