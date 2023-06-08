import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/Screens/utils/app_colors.dart';
import 'package:smart_home/Screens/utils/app_image.dart';
import 'package:smart_home/Screens/utils/text_style.dart';
import 'package:smart_home/controller/nav_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBody: true,
        body: Obx(
            () => _navController.bodyList[_navController.currentIndex.value]),
        bottomNavigationBar: Container(
          height: 88.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
          decoration: BoxDecoration(
              color: AppColor.main2Color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r))),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder: (context, index) {
              return Obx(
                () => InkWell(
                  onTap: () {
                    _navController.currentIndex.value = index;
                    HapticFeedback.lightImpact();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Stack(children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == _navController.currentIndex.value
                          ? 110.w
                          : 56.w,
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == _navController.currentIndex.value
                            ? 56.h
                            : 56.h,
                        width: index == _navController.currentIndex.value
                            ? 110.w
                            : 68,
                        decoration: BoxDecoration(
                            color: index == _navController.currentIndex.value
                                ? AppColor.white
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == _navController.currentIndex.value
                          ? 121.w
                          : 68.w,
                      alignment: Alignment.center,
                      child: Stack(children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == _navController.currentIndex.value
                              ? 110.w
                              : 68.w,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  index == _navController.currentIndex.value
                                      ? listOfIcon[index]
                                      : listOfDefaultIcon[index],
                                  height: 20.h,
                                  width: 20.w,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  index == _navController.currentIndex.value
                                      ? listOfStrings[index]
                                      : "",
                                  style: CustomTextStyle.h5(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.main2Color),
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                    )
                  ]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<String> listOfStrings = ['Home', 'Smart', 'Usage', 'Profile'];

  List<String> listOfIcon = [
    AppImage.homeFill,
    AppImage.netFill,
    AppImage.pieFill,
    AppImage.userFill
  ];

  List<String> listOfDefaultIcon = [
    AppImage.home,
    AppImage.net,
    AppImage.pie,
    AppImage.user
  ];
}
