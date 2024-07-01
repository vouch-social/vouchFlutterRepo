import 'dart:io';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:vouch/new_code/home_page/HomePage/new_home_page.dart';
import 'package:vouch/new_code/home_page/history_screen/history.dart';
import 'package:vouch/new_code/home_page/settings/attributes_validation/attributes_validation.dart';
import 'package:vouch/new_code/services/refresh_token_send_controller.dart';
import '../../main.dart';
import '../backend/backend_constants.dart';
import '../onboarding/customize_profile/user_details_controller.dart';

class NotificationServices {
  final controller = Get.put(FcmTokenController());
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
      iOS: DarwinInitializationSettings(),
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

        // Update badge count
        incrementBadgeCount();
      });
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }



  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await SharedPreferences.getInstance();  // Initialize shared preferences
    await _incrementBadgeCount();
  }

  static Future<void> _incrementBadgeCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentBadgeCount = prefs.getInt('badgeCount') ?? 0;
    currentBadgeCount++;
    prefs.setInt('badgeCount', currentBadgeCount);
    print('Incremented badge count: $currentBadgeCount');

    FlutterAppBadger.updateBadgeCount(currentBadgeCount);
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

    // Save notification payload in SharedPreferences
    await saveNotificationPayload(message.data['type']);
  }

  void handleNotificationClick(NotificationResponse notificationResponse) {
    String? payload = notificationResponse.payload;
    print("Payload: $payload");
    if (payload == "VOUCH_COMPLETED") {
      Get.to(() => const HistoryScreen(index: 1,));
      clearNotificationPayload();
    } else if (payload == "BOUNTY_HUNTED" || payload == "BOUNTY_CLAIMED") {
      Get.to(() => const HistoryScreen(index: 0,));
      clearNotificationPayload();
    } else if (payload == "CLAIM_AWARDED") {
      Get.to(() => const HistoryScreen(index: 2,));
      clearNotificationPayload();
    }
    else if (payload == "ATTR_VALIDATION") {
      Get.to(() => const AttributesValidation());
      clearNotificationPayload();
    }else if (payload == "BOUNTY_RAISED") {
      Get.to(() => const NewHomePage());
      clearNotificationPayload();
    }

    else {
      Get.to(() => const NewHomePage());
      clearNotificationPayload();
    }
    clearNotificationPayload();
    resetBadgeCount();
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    // When app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      print("Firebase Message background: ${event.data}");
      handleMessage(context, event);
      await incrementBadgeCount();
    });

  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    print("Firebase Message: ${message.data}");
    if (message.data['type'] == "VOUCH_COMPLETED") {
      Get.to(() => const HistoryScreen(index: 1,));
    } else if (message.data['type'] == "BOUNTY_HUNTED" || message.data['type'] == "BOUNTY_CLAIMED") {
      Get.to(() => const HistoryScreen(index: 0,));
    } else if (message.data['type'] == "CLAIM_AWARDED") {
      Get.to(() => const HistoryScreen(index: 2,));
    }
    else if (message.data['type'] == "ATTR_VALIDATION") {
      Get.to(() => const AttributesValidation());
    }
    else if (message.data['type'] == "BOUNTY_RAISED") {
      Get.to(() => const NewHomePage());
      clearNotificationPayload();
    }
    else {
      Get.to(() => const NewHomePage());
    }
    // Clear notification payload after handling
    clearNotificationPayload();
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    print("FCM Token Id: $token");
    controller.saveUserController(token);
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) async {
      if (kDebugMode) {
        print('Token refreshed');
      }
      await prefs?.setString(fcmToken, event);
      controller.saveUserController(prefs?.getString(fcmToken));
    });
  }

  Future<void> incrementBadgeCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentBadgeCount = prefs.getInt('badgeCount') ?? 0;
    currentBadgeCount++;
    prefs.setInt('badgeCount', currentBadgeCount);
    print('Incremented badge count: $currentBadgeCount');

    FlutterAppBadger.updateBadgeCount(currentBadgeCount);
  }

  Future<void> resetBadgeCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('badgeCount', 0);
    print('Reset badge count');

    FlutterAppBadger.removeBadge();
  }

  Future<void> saveNotificationPayload(String payload) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('notification_payload', payload);
  }

  Future<String?> getNotificationPayload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('notification_payload');
  }

  Future<void> clearNotificationPayload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('notification_payload');
  }

  Future<void> checkForNotificationPayload(BuildContext context) async {
    String? payload = await getNotificationPayload();
    if (payload != null) {
      Get.testMode;
      handleNotificationPayload(context, payload);
      await clearNotificationPayload();
    }
  }

  void handleNotificationPayload(BuildContext context, String payload) {
    print("Payload: $payload");
    Get.testMode;
    if (payload == "VOUCH_COMPLETED") {
      Get.to(() => const HistoryScreen(index: 1,));
      clearNotificationPayload();
    } else if (payload == "BOUNTY_HUNTED" || payload == "BOUNTY_CLAIMED") {
      Get.to(() => const HistoryScreen(index: 0,));
      clearNotificationPayload();
    } else if (payload == "CLAIM_AWARDED") {
      Get.to(() => const HistoryScreen(index: 2,));
      clearNotificationPayload();
    }else if (payload == "ATTR_VALIDATION") {
      Get.to(() => const AttributesValidation());
      clearNotificationPayload();
    }
    else if (payload == "BOUNTY_RAISED") {
      Get.to(() => const NewHomePage());
      clearNotificationPayload();
    }

    else {
      Get.to(() => const NewHomePage());
      clearNotificationPayload();
    }
    clearNotificationPayload();
    resetBadgeCount();
  }
}
