import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:smart_home/Routes/routes.dart';
import 'package:smart_home/Screens/utils/app_colors.dart';
import 'package:smart_home/Screens/utils/app_image.dart';
import 'package:smart_home/Screens/utils/text_style.dart';

import '../users_sector/line_titles.dart';

class LivingSeeAllScreen extends StatelessWidget {
  LivingSeeAllScreen({super.key});

  final List activeItem = [
    {
      "image": AppImage.tv,
      "image2": AppImage.off,
      "title": "Channel",
      "text1": "TVN",
      "text2": "TV",
      "temp": "Living room"
    },
    {
      "image": AppImage.lamp,
      "image2": AppImage.off,
      "title": "Colour",
      "text1": "Lamp",
      "text2": "Dining room",
      "temp": "White"
    },
    {
      "image": AppImage.star,
      "image2": AppImage.off,
      "title": "Temprature",
      "text1": "AC",
      "text2": "Living room",
      "temp": "19°C"
    },
    {
      "image": AppImage.lamp,
      "image2": AppImage.off,
      "title": "Colour",
      "text1": "Lamp",
      "text2": "Dining room",
      "temp": "White"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyWidgets());
  }

  _bodyWidgets() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(
        children: [
          Column(
            children: [
              //<----- header container ------>
              _headerContainer(),
              //<------ body container --------->
              _bodyContainer(),
              SizedBox(
                height: 12.h,
              ),
              _turnOffButton()
            ],
          )
        ],
      ),
    );
  }

  _bodyContainer() {
    return Container(
      color: AppColor.main2Color,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 23.h,
          left: 15.w,
          right: 15.w,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(40.r)),
            color: Colors.white),
        child: Column(
          children: [
            _deviceText(),
            _gridView(),
          ],
        ),
      ),
    );
  }

  _turnOffButton() {
    return Container(
      height: 52,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          color: AppColor.mainColor, borderRadius: BorderRadius.circular(12.r)),
      child: Center(
        child: Text(
          'Turn Off All Devices',
          style: CustomTextStyle.h5(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.white),
        ),
      ),
    );
  }

  _headerContainer() {
    return Container(
      height: 350.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.main2Color,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r))),
      child: SafeArea(
        child: Column(
          children: [
            //<------ header text -------->
            _headerText(),
            //<------ card container ------>
            _cardContainer(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Usage today',
                    style: CustomTextStyle.h5(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.splachColor),
                  ),
                  Text(
                    "25 watt",
                    style: CustomTextStyle.h5(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.white),
                  )
                ],
              ),
            ),

            _chartWidget()
          ],
        ),
      ),
    );
  }

  _deviceText() {
    return Row(
      children: [
        Text(
          'Device',
          style: CustomTextStyle.h5(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.textColor),
        ),
        SizedBox(
          width: 6.w,
        ),
        Container(
          height: 21.h,
          width: 21.w,
          decoration: BoxDecoration(
              color: AppColor.main2Color,
              borderRadius: BorderRadius.circular(4.r)),
          child: Center(
            child: Text(
              '4',
              style: CustomTextStyle.h5(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.white),
            ),
          ),
        ),
        SizedBox(
          width: 190.w,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.deviceActive);
          },
          child: Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(8.r)),
            child: Center(
              child: Icon(
                Icons.add,
                color: AppColor.white,
              ),
            ),
          ),
        )
      ],
    );
 
 
  }

  _gridView() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.lampScreen);
      },
      child: MasonryGridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12.w,
        itemCount: activeItem.length,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return _activeGridView(index);
        },
      ),
    );
  }

  _activeGridView(int index) {
    return Container(
      height: 142.h,
      width: double.infinity,
      padding: EdgeInsets.only(top: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: AppColor.mainColor),
      child: Padding(
        padding: EdgeInsets.only(left: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  activeItem[index]['image'],
                  height: 50.h,
                  width: 50.w,
                  fit: BoxFit.contain,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activeItem[index]['title'],
                      style: CustomTextStyle.h5(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.white),
                    ),
                    Text(
                      activeItem[index]['temp'],
                      style: CustomTextStyle.h5(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.white),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activeItem[index]['text1'],
                        style: CustomTextStyle.h5(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white),
                      ),
                      Text(
                        activeItem[index]['text2'],
                        style: CustomTextStyle.h5(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.white),
                      )
                    ],
                  ),
                  Image.asset(
                    activeItem[index]['image2'],
                    width: 55.w,
                    height: 24.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _chartWidget() {
    return Expanded(
        child: LineChart(LineChartData(
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            titlesData: LineTitles.getTitleData(),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: AppColor.lineColor, strokeWidth: 1);
              },
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
          LineChartBarData(spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 2.5),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ], color: AppColor.white)
        ])));
  }

  _cardContainer() {
    return Container(
      height: 77.h,
      margin: EdgeInsets.symmetric(horizontal: 17.5.w, vertical: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.splachColor,
          borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImage.fre),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '19°C',
                style: CustomTextStyle.h5(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.main2Color),
              ),
              Text(
                'AC',
                style: CustomTextStyle.h5(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.main2Color),
              )
            ],
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
            height: 41.h,
            width: 1.w,
            decoration: BoxDecoration(color: AppColor.main2Color),
          ),
          SizedBox(
            width: 5.w,
          ),
          Image.asset(AppImage.glamp),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '18%',
                style: CustomTextStyle.h5(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.main2Color),
              ),
              Text(
                'Light Lamp',
                style: CustomTextStyle.h5(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.main2Color),
              )
            ],
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
            height: 41.h,
            width: 1.w,
            decoration: BoxDecoration(color: AppColor.main2Color),
          ),
          SizedBox(
            width: 5.w,
          ),
          Image.asset(
            AppImage.wifi,
            height: 28.h,
            width: 37.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '10 Kb/s',
                style: CustomTextStyle.h5(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.main2Color),
              ),
              Text(
                'WIFI',
                style: CustomTextStyle.h5(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.main2Color),
              )
            ],
          ),
        ],
      ),
    );
  }

  _headerText() {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColor.white,
            ),
          ),
          Text(
            'Back',
            style: CustomTextStyle.h5(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.white),
          ),
          SizedBox(
            width: 50.w,
          ),
          Text(
            'Living Room',
            style: CustomTextStyle.h5(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.white),
          ),
          SizedBox(
            width: 35.w,
          ),
          CircleAvatar(
            radius: 25.r,
            backgroundColor: AppColor.white,
            child: Center(
              child: Image.asset(
                AppImage.search,
                height: 20.w,
                width: 20.w,
              ),
            ),
          )
        ],
      ),
    );
  }
}
