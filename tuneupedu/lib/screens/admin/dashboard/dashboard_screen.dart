import 'package:flutter/material.dart';
import 'package:tuneupedu/theme/theme_provider.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Admin Dashboard Screen'),
            ThemeSwitch(),
          ],
        ),
      ),
    );
  }
}
