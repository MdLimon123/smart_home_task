import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/Screens/users_sector/line_titles.dart';
import 'package:smart_home/Screens/utils/app_colors.dart';

import '../utils/app_image.dart';
import '../utils/text_style.dart';

class UsagesScreen extends StatelessWidget {
  const UsagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(children: [
        SafeArea(
          child: Column(
            children: [
              //<-------- header container ------->
              _headerContainer(),

              //<--------- body Container ------->
              _bodyContainer()
            ],
          ),
        ),
      ]),
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
            //<------- Total Today ------->
            _totalToday(),

            //<----- List view -------

            _listView()
          ],
        ),
      ),
    );
  }

  _listView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return _itemContainer();
      },
    );
  }

  _itemContainer() {
    return Container(
      height: 88.h,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
          color: AppColor.splachColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //<------ Listview body ------>

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: AppColor.white,
                  radius: 30.r,
                  child: Center(
                    child: Image.asset(
                      AppImage.light,
                      height: 40.h,
                      width: 40.h,
                    ),
                  )),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lamp',
                    style: CustomTextStyle.h5(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor),
                  ),
                  Text(
                    'Kitchen - Bedroom',
                    style: CustomTextStyle.h5(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor),
                  ),
                  Row(
                    children: [
                      Text(
                        '8 Unit',
                        style: CustomTextStyle.h5(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.unitColor),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '|',
                        style: CustomTextStyle.h5(color: AppColor.unitColor),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '12 Jam',
                        style: CustomTextStyle.h5(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.unitColor),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 55.w,
              ),
              Column(
                children: [
                  Text(
                    '1000 Kw/h',
                    style: CustomTextStyle.h5(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.main2Color),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppImage.down,
                        width: 13.w,
                        height: 9.h,
                      ),
                      Text('-11.2%',
                          style: CustomTextStyle.h5(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF9A7265))),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _totalToday() {
    return Row(
      children: [
        Text(
          'Total Today',
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
          width: 135.w,
        ),
        Text(
          'See All',
          style: CustomTextStyle.h5(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.main2Color),
        ),
      ],
    );
  }

  _headerContainer() {
    return Container(
      height: 350.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.main2Color,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r))),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Power Usage',
              style: CustomTextStyle.h5(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.white),
            ),
            trailing: CircleAvatar(
              radius: 25.r,
              backgroundColor: AppColor.white,
              child: Center(
                child: Image.asset(
                  AppImage.filter,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
          ),
          ListTile(
              title: Text(
                'Power Usage',
                style: CustomTextStyle.h5(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white),
              ),
              trailing: Text(
                '2500 watt',
                style: CustomTextStyle.h5(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.white),
              )),
          Expanded(
            child: LineChart(LineChartData(
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 250,
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
                    FlSpot(0, 100),
                    FlSpot(2.6, 70),
                    FlSpot(4.9, 150),
                    FlSpot(6.8, 75),
                    FlSpot(8, 140),
                    FlSpot(9.5, 90),
                    FlSpot(11, 140),
                  ], color: AppColor.white)
                ])),
          ),
        ],
      ),
    );
  }
}
