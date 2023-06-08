import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smart_home/Screens/Widgets/custom_button.dart';
import 'package:smart_home/Screens/utils/app_colors.dart';
import 'package:smart_home/Screens/utils/app_image.dart';
import 'package:smart_home/Screens/utils/app_text.dart';
import 'package:smart_home/Screens/utils/text_style.dart';


import '../../Routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImage.splashImage))),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.smartme,
                style: CustomTextStyle.h2(),
              ),
              SizedBox(
                height: 67.h,
              ),
              Text(
                AppText.welcome,
                style: CustomTextStyle.h1(color: AppColor.splachColor),
              ),
              Text(AppText.bigText,
                  style: CustomTextStyle.h3(color: AppColor.white)),
              SizedBox(
                height: 250.h,
              ),
              CustomButton(
                  title: 'Get Started',
                  onPressed: () {
                    Get.offAndToNamed(Routes.mainScreen);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
