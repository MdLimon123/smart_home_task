import 'package:get/get.dart';
import 'package:smart_home/Screens/home_sector/home_screen.dart';
import 'package:smart_home/Screens/profile_sector/profile_screen.dart';
import 'package:smart_home/Screens/smart_sector/smart_screen.dart';
import 'package:smart_home/Screens/users_sector/usages_screen.dart';

class NavController extends GetxController {
  var currentIndex = 0.obs;

  final bodyList = [
    HomeScreen(),
    SmartScreen(),
    UsagesScreen(),
    ProfileScreen()
  ];
}
