import 'package:get/get.dart';
import 'package:tuneupedu/screens/user/dashboard/dashboard_screen.dart';

class UserSideMenuController extends GetxController {
  RxInt menuindex = 0.obs;

  var menupage = [
    const UserDashboardScreen(),
  ];
}
