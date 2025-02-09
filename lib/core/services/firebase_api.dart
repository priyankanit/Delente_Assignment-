import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class FirebaseApi {
  //create an instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // function to initiaize notifications
  Future<void> initNotifications() async {
    // request permission from user (will prompt user)
    await _firebaseMessaging.requestPermission();

    // fetch the FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    // print the token (normally you would send this to your server)
    print('Token: $fCMToken');

    // initialize further settings for push notifications
    initPushNotifications();
    initLocalNotifications();
  }

  // function to handle received messages
  void handleMessage(RemoteMessage? message) {
    //if the message is null, do nothing
    if (message == null) return;

    //navigate to new screen when message is received and user taps notification
    Get.toNamed('/notification', arguments: message);
  }

  // functions to initialize foreground and background settings
  Future initPushNotifications() async {
    // handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // Handle foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print(
            'Foreground Notification Received: ${message.notification!.title}');
        // Show a simple alert dialog when a notification is received
        Get.dialog(
          AlertDialog(
            title: Text(message.notification?.title ?? 'No Title'),
            content: Text(message.notification?.body ?? 'No Body'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  Future<void> initLocalNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _localNotifications.initialize(settings);
  }

  Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;
    final android = notification?.android;

    if (notification != null && android != null) {
      final details = AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        channelDescription: 'Channel for important notifications',
        importance: Importance.high,
        priority: Priority.high,
      );

      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(android: details),
      );
    }
  }
}
