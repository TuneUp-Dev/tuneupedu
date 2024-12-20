import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuneupedu/screens/admin/side_nav/admin_menu_controller.dart';
import 'package:tuneupedu/screens/admin/side_nav/admin_menu_list.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    AdminSideMenuController sideMenuController =
        Get.put(AdminSideMenuController());
    return Scaffold(
      body: Row(
        children: [
          if (totalWidth > 800)
            Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              width: 250,
              child: const AdminMenuList(),
            ),
          Flexible(
            child: SizedBox(
              child: Obx(
                () => sideMenuController
                    .menupage[sideMenuController.menuindex.value],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
