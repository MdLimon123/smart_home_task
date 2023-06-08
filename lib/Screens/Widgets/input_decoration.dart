import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/Screens/utils/app_colors.dart';

InputDecoration decoration({required String hintText,bool? isFilled}) {
  return InputDecoration(
      hintText: hintText,
      contentPadding: EdgeInsets.symmetric(horizontal:10.w),
      constraints: BoxConstraints(maxHeight:50.h),
      isDense: true,
      hintStyle: TextStyle(
        fontSize: 16.sp,
        color: AppColor.textColor,
      ),
      filled: isFilled ?? false,
      fillColor: AppColor.containerColor,
      border: border(false),
      enabledBorder: border(false),
      focusedBorder: border(true));
}

OutlineInputBorder border(bool isFocus) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide:
          BorderSide(
              color: isFocus
                  ? AppColor.splachColor
                  : AppColor.splachColor.withOpacity(.1)
          )
  );
}