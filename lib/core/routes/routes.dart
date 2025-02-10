import 'package:delente_assignment/core/routes/routes_name.dart';
import 'package:delente_assignment/modules/auth/login_screen.dart';
import 'package:delente_assignment/modules/screens/checkout_screen.dart';
import 'package:delente_assignment/modules/screens/dashboard_screen.dart';
import 'package:delente_assignment/modules/screens/detail_screen.dart';
import 'package:delente_assignment/modules/screens/home_screen.dart';
import 'package:delente_assignment/modules/screens/notification_screen.dart';
import 'package:delente_assignment/modules/screens/payment_screen.dart';
import 'package:delente_assignment/modules/screens/settings_screen.dart';
import 'package:delente_assignment/modules/screens/userinfo_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesName.loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeftWithFade,
      // transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: RoutesName.userInfo,
      page: () => const UserinfoScreen(),
      transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: RoutesName.dashboard,
      page: () => DashboardScreen(),
      transition: Transition.rightToLeftWithFade,
      // transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: RoutesName.detailScreen,
      page: () => const DetailScreen(),
      transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: RoutesName.checkoutScreen,
      page: () => const CheckoutScreen(),
      transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: RoutesName.paymentScreen,
      page: () => const PaymentScreen(),
      transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: RoutesName.settings,
      page: () => const SettingsScreen(),
      transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: RoutesName.notificationScreen,
      page: () => const NotificationScreen(),
      transition: Transition.rightToLeftWithFade,
      //transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
