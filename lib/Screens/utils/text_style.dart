import 'dart:ui';

import 'package:flutter/src/material/input_border.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle h1(
      {Color? color, FontWeight? fontWeight, double? letterSpacing}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            color: color,
            fontSize: 28.sp,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w600));
  }

  static TextStyle h2(
      {Color? color, FontWeight? fontWeight, double? letterSpacing}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            color: color,
            fontSize: 24.sp,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w600));
  }

  static TextStyle h3({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            color: color,
            fontSize: 14.sp,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w400));
  }

  static TextStyle h4({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            color: color,
            fontSize: 11.sp,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w400));
  }

  static TextStyle h5({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? fontSize,
  }) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w400));
  }

  static TextStyle h6(
      {Color? color, FontWeight? fontWeight, double? letterSpacing}) {
    return TextStyle(
        fontSize: 10.sp,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight ?? FontWeight.w400);
  }

  static TextStyle customSize(
      {Color? color,
      required double size,
      String? family,
      double? letterSpacing,
      FontWeight? fontWeight}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        fontSize: size,
        letterSpacing: letterSpacing,
        fontFamily: family ?? "Montserrat");
  }
}
