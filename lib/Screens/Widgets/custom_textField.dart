import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/Screens/Widgets/input_decoration.dart';
import '../utils/app_colors.dart';
import '../utils/text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.prifixIcon,
      this.suffixIcon,
      this.obsecure,
      this.validator,
      this.readOnly,
      this.onTap,
      required this.hintText});
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prifixIcon;
  final String hintText;
  final bool? obsecure;
  final bool? readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      
      controller: controller,
      readOnly: readOnly ?? false,
      validator: validator,
      obscureText: obsecure ?? false,
      decoration: InputDecoration(
          suffixIcon: suffixIcon ?? suffixIcon,
          fillColor: AppColor.splachColor,
          prefixIcon: prifixIcon,
          filled: true,
          hintText: hintText,
          constraints: BoxConstraints(
            maxHeight: 50.h,
          ),
          hintStyle: CustomTextStyle.h5(color: AppColor.textColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600),
          border: border(false),
          enabledBorder: border(false),
          focusedBorder: border(true)),
    );
  }
}
