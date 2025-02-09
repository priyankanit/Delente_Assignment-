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
        title: const Text('Notification'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(message.notification!.title ?? 'No Title',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(message.notification!.body ?? 'No Body'),
            const SizedBox(height: 10),
            Text(message.data.toString()),
          ],
        ),
      ),
    );
  }
}
