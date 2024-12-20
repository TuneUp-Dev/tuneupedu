import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuneupedu/auth/signin_screen.dart';
import 'user_menu_controller.dart';

class UserMenuList extends StatefulWidget {
  const UserMenuList({super.key});

  @override
  State<UserMenuList> createState() => _UserMenuListState();
}

class _UserMenuListState extends State<UserMenuList> {
  final currentUser = FirebaseAuth.instance.currentUser;

  // Signout
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    debugPrint('-----Sigout Successfully-----');
    return const SignInScreen();
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    UserSideMenuController sideMenuController = Get.put(
      UserSideMenuController(),
    );
    return isloading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Obx(
            () => Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  children: [
                    const SizedBox(
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    // 1-Dashboard
                    ListTile(
                        title: const Text(
                          "Dashboard",
                        ),
                        leading: const Icon(Icons.dashboard_rounded),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        titleTextStyle: Theme.of(context).textTheme.titleMedium,
                        selectedColor: Theme.of(context).colorScheme.onPrimary,
                        selectedTileColor:
                            Theme.of(context).colorScheme.primary,
                        onTap: () {
                          totalWidth > 800
                              ? sideMenuController.menuindex.value = 0
                              : {
                                  Get.back(),
                                  sideMenuController.menuindex.value = 0
                                };
                        },
                        selected: sideMenuController.menuindex.value == 0),
                    ListTile(
                      title: const Text(
                        "Sign Out",
                      ),
                      leading: const Icon(Icons.logout),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      titleTextStyle: Theme.of(context).textTheme.titleMedium,
                      selectedColor: Theme.of(context).colorScheme.error,
                      selectedTileColor: Theme.of(context).colorScheme.primary,
                      onTap: () {
                        signOut();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
