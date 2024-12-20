import 'package:flutter/material.dart';
import 'package:tuneupedu/theme/theme_provider.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
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
