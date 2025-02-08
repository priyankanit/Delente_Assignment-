import 'package:delente_assignment/core/services/auth_service.dart';
import 'package:delente_assignment/core/utils/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserinfoScreen extends StatelessWidget {
  //final UserModel user;
  const UserinfoScreen({
    super.key,
    //required this.user
  });

  void logout() {
    // get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = Get.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(TextConstants.userinfo.tr,
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 25,
                fontWeight: FontWeight.w400)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
            ),
            onPressed: () {
              Get.offAllNamed('/settingsScreen');
            },
          ),
          IconButton(
              onPressed: () {
                logout;
                Get.toNamed('/loginScreen');
              },
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.profilePicture),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text(user.name,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.w600)),
            Text(user.email,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => Get.toNamed(
                      '/dashboardScreen',
                    ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary),
                child: Text(
                  TextConstants.dashboard,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )),
          ],
        ),
      ),
    );
  }
}
