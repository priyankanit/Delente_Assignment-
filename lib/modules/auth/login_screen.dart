import 'package:delente_assignment/core/routes/routes_name.dart';
import 'package:delente_assignment/core/utils/constants/text_constants.dart';
import 'package:delente_assignment/core/utils/helpers/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        //appBar: AppBar(title: const Text('Login Page')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
                text: TextConstants.signin.tr,
                iconSymbol: Icons.login,
                onTap: () async {
                  final user = await AuthService().signInWithGoogle();
                  if (user != null) {
                    Get.toNamed(RoutesName.userInfo, arguments: user);
                  } else {
                    Get.snackbar(
                      TextConstants.cancelled,
                      TextConstants.signinCancelled,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                }),
            const SizedBox(height: 20),
            MyButton(
                text: TextConstants.signinFb.tr,
                iconSymbol: Icons.facebook,
                onTap: () async {
                  final user = await AuthService().signInWithFacebook();
                  if (user != null) {
                    Get.toNamed(RoutesName.userInfo, arguments: user);
                  } else {
                    Get.snackbar(
                      TextConstants.cancelled,
                      TextConstants.fbSigninCancelled,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                })
          ],
        )));
  }
}
