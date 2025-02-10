import 'package:delente_assignment/core/utils/constants/text_constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RemoteMessage message = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(TextConstants.notification, style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,)),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message.notification!.title ?? TextConstants.noTitle,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(message.notification!.body ?? TextConstants.noBody),
            const SizedBox(height: 10),
            //Text(message.data.toString()),
          ],
        ),
      ),
    );
  }
}
