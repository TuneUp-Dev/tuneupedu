import 'package:flutter/material.dart';
import 'package:tuneupedu/screens/admin/side_nav/admin_menu_list.dart';
import 'package:tuneupedu/theme/theme_provider.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: totalWidth < 800
          ? const Drawer(
              width: 250,
              child: AdminMenuList(),
            )
          : null,
      body: const Center(
        child: Column(
          children: [
            Text("User Dashboard"),
            ThemeSwitch(),
          ],
        ),
      ),
    );
  }
}
