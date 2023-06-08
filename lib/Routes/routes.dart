import 'package:get/get.dart';
import 'package:smart_home/Screens/home_sector/home_screen.dart';
import 'package:smart_home/Screens/home_sector/see_your_room.dart';
import 'package:smart_home/Screens/lamp_sector/lamp_screen.dart';
import 'package:smart_home/Screens/nav_sector/nav_screen.dart';
import 'package:smart_home/Screens/room_see_all_sector/device_active.dart';
import 'package:smart_home/Screens/room_see_all_sector/living_see_all_screen.dart';

import '../Screens/splash_sector/splash_screen.dart';

class Routes {
  static String splashScreen = "/splash_screen";
  static String mainScreen = "/main_screen";
  static String homeScreen = "/home_screen";
  static String livingSeeAll = "/living_see_all";
  static String deviceActive = "/deviceActive";
  static String seeYourRoom = "/seeYourRoom";
  static String lampScreen = "/lampScreen";
}

List<GetPage> getPage = [
  GetPage(name: Routes.splashScreen, page: () => const SplashScreen()),
  GetPage(name: Routes.homeScreen, page: () => HomeScreen()),
  GetPage(name: Routes.mainScreen, page: () => MainScreen()),
  GetPage(name: Routes.livingSeeAll, page: () => LivingSeeAllScreen()),
  GetPage(name: Routes.deviceActive, page: () => DeviceActive()),
  GetPage(name: Routes.seeYourRoom, page: () => SeeYourRoom()),
  GetPage(name: Routes.lampScreen, page: ()=> LampScreen())
];
