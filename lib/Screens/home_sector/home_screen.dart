import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:smart_home/Routes/routes.dart';
import 'package:smart_home/Screens/utils/app_colors.dart';
import 'package:smart_home/Screens/utils/app_image.dart';
import 'package:smart_home/Screens/utils/text_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List item = [
    {
      "image": AppImage.sofa,
      "title": "Living Room",
      "count": "5",
      "temp": "19°C"
    },
    {"image": AppImage.bed, "title": "Bedroom", "count": "8", "temp": "12°C"},
  ];

  final List activeItem = [
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
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(
        children: [
          Column(
            children: [
              //<------- Header Containner ------>
              _headerContainner(),
              Container(
                color: AppColor.main2Color,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 23.h,
                    left: 15.w,
                    right: 15.w,
                  ),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(40.r)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      _roomsWidgets('Rooms', 'See All'),
                      //<------ Rooms sector ------>
                      MasonryGridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                            left: 14.w, right: 16.w, top: 16.h, bottom: 16.w),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: item.length,
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return _gridViewCard(index);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //<-------- Active ------>
                          Text(
                            'Active',
                            style: CustomTextStyle.h5(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.textColor),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          _itemContainer(),
                          SizedBox(
                            width: 180.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.livingSeeAll);
                            },
                            child: Text(
                              'See All',
                              style: CustomTextStyle.h5(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.main2Color),
                            ),
                          )
                        ],
                      ),
                      MasonryGridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                            left: 14.w, right: 16.w, top: 16.h, bottom: 16.w),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: activeItem.length,
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return _activeGridView(index);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
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
        padding: EdgeInsets.only(left: 8.w),
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
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.white),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
            )
          ],
        ),
      ),
    );
  }

  _itemContainer() {
    return Container(
      height: 21.h,
      width: 21.w,
      decoration: BoxDecoration(
          color: AppColor.main2Color, borderRadius: BorderRadius.circular(4.r)),
      child: Center(
        child: Text(
          '6',
          style: CustomTextStyle.h5(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.white),
        ),
      ),
    );
  }

  _gridViewCard(int index) {
    return Container(
      height: 190.h,
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

  _roomsWidgets(String title, String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: CustomTextStyle.h5(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.textColor),
        ),
        InkWell(
          onTap: () {
             Get.toNamed(Routes.seeYourRoom);
          },
          child: Text(
            subTitle,
            style: CustomTextStyle.h5(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.main2Color),
          ),
        )
      ],
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

  _headerContainner() {
    return Container(
        height: 350.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r)),
            image: DecorationImage(
                image: AssetImage(
                  AppImage.bgImage,
                ),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Good Morning,',
                      style: CustomTextStyle.h2(color: AppColor.white),
                    ),
                    Text(
                      'Kimberly Mastrangelo',
                      style: CustomTextStyle.h3(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400),
                    )
                  ]),
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: AppColor.bgApp,
                    child: Center(
                      child: Image.asset(
                        AppImage.notification,
                        width: 19.w,
                        height: 21.h,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 70.h),
            Stack(children: [
              Container(
                height: 174.h,
                margin: EdgeInsets.only(left: 16.w, right: 16.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.splachColor,
                    borderRadius: BorderRadius.circular(28.r)),
                child: Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset(AppImage.sunCloud),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "May 16, 2023 10:05 am",
                              style: CustomTextStyle.h4(
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Cloudy",
                              style: CustomTextStyle.h5(
                                  fontSize: 18.sp,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Jakarta, Indonesia",
                              style: CustomTextStyle.h5(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.textColor),
                            ),
                          ],
                        ),
                        trailing: Text(
                          '19°C',
                          style: CustomTextStyle.h1(color: AppColor.textColor),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      _rowWidgets()
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 3.w, bottom: 3.w, child: Image.asset(AppImage.sun))
            ]),
          ],
        ));
  }

  _rowWidgets() {
    return Row(
      children: [
        _containerWidgets(
            image: AppImage.humidity, title: '97%', subTitle: 'Humadity'),
            SizedBox(width: 6.w,),
        _containerWidgets(
            image: AppImage.eyes, title: '7km', subTitle: 'Visibility'),
             SizedBox(width: 6.w,),
        _containerWidgets(
            image: AppImage.wind, title: '3km/h%', subTitle: 'NE Wind'),
      ],
    );
  }

  _containerWidgets(
      {required String image,
      required String title,
      required String subTitle}) {
    return Expanded(
      child: Container(
        height: 60.h,
        margin: EdgeInsets.only(bottom: 10.w),
        padding: EdgeInsets.only(left:6.w, right:6.w),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: AppColor.bgApp,
                  child: Center(
                    child: Image.asset(
                      image,
                      width: 19.w,
                      height: 21.h,
                    ),
                  ),
                ),
                Text(
                  title,
                  style: CustomTextStyle.h5(
                      fontSize: 15.sp, color: AppColor.textColor),
                )
              ],
            ),
            Text(
              subTitle,
              style: CustomTextStyle.h5(
                  fontSize: 11.sp,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
