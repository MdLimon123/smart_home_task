import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/Screens/Widgets/custom_textField.dart';
import 'package:smart_home/Screens/utils/app_colors.dart';
import 'package:smart_home/Screens/utils/app_image.dart';

import 'package:smart_home/Screens/utils/text_style.dart';

class SmartScreen extends StatelessWidget {
  SmartScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                //<-------- Header Container ------>
                _headerContainer(),
                //<------ body Container ------->
                _bodyContainer()
              ],
            ),
          ),
        ));
  }

  _bodyContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.splachColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.r))),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 26.h, right: 16.w),
        child: Column(
          children: [
            //<-------- smart mode ------->
            _smartModeWidget(),
            SizedBox(
              height: 8.h,
            ),
            //<------ ListView -------->
            _listViewWidget(),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }

  _listViewWidget() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 122.h,
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

  _smartModeWidget() {
    return Row(
      children: [
        Text(
          'Smart Mode',
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
        )
      ],
    );
  }

  _headerContainer() {
    return Container(
      height: 159.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.main2Color,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r)),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Smart Home',
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
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
            child: CustomTextField(
                controller: _textEditingController,
                hintText: 'Living room',
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30.sp,
                  color: AppColor.main2Color,
                )),
          )
        ],
      ),
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



}
