
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/text_style.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            switch (value.toInt()) {
              case 0:
                return Text(
                  'Mon',
                  style: CustomTextStyle.h5(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.splachColor),
                );

              case 2:
                return Text(
                  'Tues',
                  style: CustomTextStyle.h5(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.splachColor),
                );
              case 4:
                return Text(
                  'Wed',
                  style: CustomTextStyle.h5(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.splachColor),
                );

              case 6:
                return Text(
                  'Thurs',
                  style: CustomTextStyle.h5(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.splachColor),
                );
              case 8:
                return Text(
                  'Fir',
                  style: CustomTextStyle.h5(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.splachColor),
                );

              case 10:
                return Text(
                  'Sat',
                  style: CustomTextStyle.h5(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.splachColor),
                );
              case 12:
                return Text(
                  'Sun',
                  style: CustomTextStyle.h5(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.splachColor),
                );
            }
            return Text('');
          },
        ),
      ));
}
