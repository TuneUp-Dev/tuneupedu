import 'package:get/get.dart';
import 'package:tuneupedu/auth/services/checking_auth.dart';
import 'package:tuneupedu/screens/common/splash/splash_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/checkingauth',
      page: () => const CheckingAuth(),
    ),
    GetPage(
      name: '/splachscreen',
      page: () => const SplashScreen(),
    ),
  ];
}
