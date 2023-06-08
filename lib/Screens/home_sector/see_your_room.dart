import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_image.dart';
import '../utils/text_style.dart';

class SeeYourRoom extends StatelessWidget {
  SeeYourRoom({super.key});

  final List item = [
    {
      "image": AppImage.sofa,
      "title": "Living Room",
      "count": "4",
      "temp": "11°C"
    },
    {"image": AppImage.kit, "title": "Kitchen", "count": "5", "temp": "19°C"},
    {"image": AppImage.bed, "title": "Bedroom", "count": "8", "temp": "12°C"},
    {"image": AppImage.toi, "title": "Bedroom", "count": "2", "temp": "19°C"},
    {
      "image": AppImage.char,
      "title": "Living Room",
      "count": "3",
      "temp": "15°C"
    },
    {"image": AppImage.tab, "title": "Bedroom 2", "count": "4", "temp": "19°C"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidgets(),
    );
  }

  _bodyWidgets() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(children: [
        Column(
          children: [
            //<-------- header container ------>
            _headerContainer(),
            //<-------- body container ------>
            _bodyContainer(),
            SizedBox(
              height: 12.h,
            ),

            SizedBox(
              height: 12.h,
            ),
          ],
        )
      ]),
    );
  }

  _bodyContainer() {
    return Container(
      color: AppColor.main2Color,
      child: Container(
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
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }

  _deviceText() {
    return Row(
      children: [
        Text(
          'Your Rooms',
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
              '6',
              style: CustomTextStyle.h5(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.white),
            ),
          ),
        ),
        SizedBox(
          width: 148.w,
        ),
        InkWell(
          onTap: () {},
          child: Card(
            elevation: 1.0,
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: AppColor.splachColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _gridView() {
    return MasonryGridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12.w,
      itemCount: item.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return _activeGridView(index);
      },
    );
  }

  _activeGridView(int index) {
    return Container(
      height: 196.h,
      width: double.infinity,
      padding: EdgeInsets.only(top: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColor.splachColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _temContainer(index),
          Center(
            child: Image.asset(item[index]['image']),
          ),
          Center(
            child: Text(
              item[index]['title'],
              style: CustomTextStyle.h5(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textColor),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 18.h,
                width: 16.w,
                decoration: BoxDecoration(
                    color: AppColor.yellColor,
                    borderRadius: BorderRadius.circular(4.r)),
                child: Center(
                  child: Text(
                    item[index]['count'],
                    style: CustomTextStyle.h5(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'devices',
                style: CustomTextStyle.h5(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor),
              )
            ],
          )
        ],
      ),
    );
  }

  _headerContainer() {
    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.main2Color,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r))),
      child: _headingText(),
    );
  }

  _temContainer(int index) {
    return Container(
      height: 21.h,
      width: 44.w,
      margin: EdgeInsets.only(
        left: 10.w,
        top: 10.h,
      ),
      decoration: BoxDecoration(
          color: AppColor.main2Color, borderRadius: BorderRadius.circular(6.r)),
      child: Center(
        child: Text(
          item[index]['temp'],
          style: CustomTextStyle.h5(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.white),
        ),
      ),
    );
  }

  _headingText() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
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
                SizedBox(width: 70.w,),
                Text(
                  'Room',
                  style: CustomTextStyle.h5(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white),
                ),
                   SizedBox(width: 90.w,),
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
          ),
        ],
      ),
    );
  }
}
