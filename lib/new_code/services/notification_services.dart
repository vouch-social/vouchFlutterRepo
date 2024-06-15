import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;

import 'package:get/get.dart';
import '/new_code/backend/backend_constants.dart';
import '/new_code/home_page/history_screen/history.dart';
import '/new_code/home_page/history_screen/my_vouch_history.dart';

import '../../main.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('User denied permission');
      }
    }
  }

  void initLocalNotifications() async {
    var initializationSettings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS:  DarwinInitializationSettings(),
    );

    await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
          print("Notification : $notificationResponse");
          handleNotificationClick(notificationResponse);
        }
    );
  }

  void firebaseInit(BuildContext context) {
    if (kDebugMode) {
    print("firebaseInit called");

    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

        print("Notification title: ${notification?.title}");
        print("Notification body: ${notification?.body}");
        print('Data: ${message.data}');
        print('Type: ${message.data['type']}');

    });
    }
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(10000).toString(),
      "High Importance Notification",
      importance: Importance.max,
      showBadge: true,
      playSound: true,
    );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'your channel description',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      ticker: 'ticker',
    );

    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    print("_flutterLocalNotificationsPlugin: $message");

    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
      payload: message.data['type'],
    );
  }

  void handleNotificationClick(NotificationResponse notificationResponse) {
    String? payload = notificationResponse.payload;
    print("Payload: $payload");
    if (payload == "VOUCH_REQUEST") {
      Get.to(() => const HistoryScreen(index: 1,));
    }else if (payload  == "BOUNTY_REQUEST") {
      Get.to(() =>
      const HistoryScreen(
        index: 0,
      ));
    }else if(payload == "HUNT_REQUEST"){
      Get.to(() =>
      const HistoryScreen(
        index: 2,
      ));
    }
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    /// When app is in background!
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("Firebase Message bckend: ${event.data}");
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    print("Firebase Message: ${message.data}");
    if (message.data['type'] == "VOUCH_REQUEST") {
      Get.to(() =>
          const HistoryScreen(
            index: 1,
          ));
    } else if (message.data['type'] == "BOUNTY_REQUEST") {
      Get.to(() =>
          const HistoryScreen(
            index: 0,
          ));
    }else if(message.data['type'] == "HUNT_REQUEST"){
      Get.to(() =>
      const HistoryScreen(
        index: 2,
      ));
    }
  }
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    print("FCM Token Id: $token");
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) async {
      if (kDebugMode) {
        print('Token refreshed');
      }
      await prefs?.setString(fcmToken, event);
    });
  }
}

