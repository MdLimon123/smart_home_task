import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/Screens/utils/app_colors.dart';
import 'package:smart_home/Screens/utils/app_image.dart';
import 'package:smart_home/Screens/utils/text_style.dart';

class LampScreen extends StatelessWidget {
  const LampScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidgets(),
    );
  }

  _bodyWidgets() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(
        children: [
          Column(
            children: [
              //<------ header container -------->
              _headerContainer(),
//<------- body container -------->
              _bodyContainer()
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
            color: AppColor.splachColor),
        child: Column(
          children: [
            //<------  Schedule  text-------->
            _scheduleText(),

            SizedBox(
              height: 12.h,
            ),
            //<------- list view builder ------>

            _listview()
          ],
        ),
      ),
    );
  }

  _listview() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 121.h,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            children: [
              //<------ List Tile Widget ------>
              _listTileWidgets(),
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppImage.light),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'from',
                              style: CustomTextStyle.h5(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.textColor),
                            ),
                            Text(
                              '8 pm',
                              style: CustomTextStyle.h5(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.textColor),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 1.w,
                      color: AppColor.textColor,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'to',
                              style: CustomTextStyle.h5(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.textColor),
                            ),
                            Text(
                              '8 am',
                              style: CustomTextStyle.h5(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.textColor),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          height: 50,
                          width: 1.w,
                          color: AppColor.textColor,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppImage.delete,
                              height: 14.h,
                              width: 14.w,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Image.asset(
                              AppImage.edit,
                              height: 14.h,
                              width: 14.h,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _listTileWidgets() {
    return ListTile(
      title: Text(
        'Smart Lamp',
        style: CustomTextStyle.h5(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.textColor),
      ),
      subtitle: Row(
        children: [
          Text(
            'Dining Room',
            style: CustomTextStyle.h5(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.textColor),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            '|',
            style: CustomTextStyle.h5(color: AppColor.textColor),
          ),
          Text(
            'Tue Thu',
            style: CustomTextStyle.h5(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.textColor),
          )
        ],
      ),
      trailing: Image.asset(
        AppImage.on,
        height: 24.h,
        width: 55.w,
      ),
    );
  }

  _scheduleText() {
    return Row(
      children: [
        Text(
          'Schedule',
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
              '3',
              style: CustomTextStyle.h5(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.white),
            ),
          ),
        ),
        SizedBox(
          width: 170.w,
        ),
        Card(
          elevation: 1.0,
          child: Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(8.r)),
            child: const Center(
              child: Icon(
                Icons.add,
                color: Color(0xFF4C7380),
              ),
            ),
          ),
        )
      ],
    );
  }

  _headerContainer() {
    return Container(
      height: 530.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.main2Color,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r)),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //<-------- Header Text ------->
              _headerText(),
              Row(
                children: [
                  Text(
                    '80',
                    style: CustomTextStyle.h5(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.white),
                  ),
                  Text(
                    '%',
                    style: CustomTextStyle.h5(fontSize: 24.sp),
                  )
                ],
              ),
              Text(
                'Brightness',
                style: CustomTextStyle.h5(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.white),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Insensity',
                style: CustomTextStyle.h5(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Image.asset(AppImage.blue),
                  SizedBox(
                    width: 6.w,
                  ),
                  Image.asset(AppImage.line),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset(AppImage.light),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                  width: double.infinity, height: 1.h, color: AppColor.white),

              SizedBox(
                height: 18.h,
              ),
              Text(
                'Usages',
                style: CustomTextStyle.h5(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white),
              ),

              _rowItem('Use Today', '50 watt'),
              _rowItem('Use Week', '500 kwh'),
              _rowItem('Use Month', '5000 kwh'),
            ],
          ),
        ),
      ),
    );
  }

  _rowItem(String title, String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: CustomTextStyle.h5(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.white)),
        Text(subTitle,
            style: CustomTextStyle.h5(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.white)),
      ],
    );
  }

  _headerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Back',
              style: CustomTextStyle.h5(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.white),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Dining Room',
              style: CustomTextStyle.h5(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.white),
            ),
            SizedBox(
              height: 12.h,
            ),
            Image.asset(
              AppImage.off,
              width: 55.w,
              height: 20.h,
            )
          ],
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          'Lamp',
          style: CustomTextStyle.h5(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.white),
        ),
        Image.asset(AppImage.longLamp)
      ],
    );
  }
}
