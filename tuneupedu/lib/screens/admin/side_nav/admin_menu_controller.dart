import 'package:get/get.dart';
import 'package:tuneupedu/screens/admin/dashboard/dashboard_screen.dart';

class AdminSideMenuController extends GetxController {
  RxInt menuindex = 0.obs;

  var menupage = [
    const AdminDashboardScreen(),
  ];
}
