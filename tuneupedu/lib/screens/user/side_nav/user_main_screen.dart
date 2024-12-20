import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuneupedu/screens/user/side_nav/user_menu_controller.dart';
import 'package:tuneupedu/screens/user/side_nav/user_menu_list.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    UserSideMenuController sideMenuController =
        Get.put(UserSideMenuController());
    return Scaffold(
      body: Row(
        children: [
          if (totalWidth > 800)
            Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              width: 250,
              child: const UserMenuList(),
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
