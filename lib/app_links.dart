import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';
import 'new_code/backend/backend_constants.dart';

class AppLinksDeepLink extends GetxController {
  AppLinksDeepLink._privateConstructor();

  static final AppLinksDeepLink _instance = AppLinksDeepLink._privateConstructor();

  static AppLinksDeepLink get instance => _instance;

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  bool _deepLinkHandled = false;

  @override
  void onInit() {
    super.onInit();
    print("AppLinksDeepLink initialized");
    _appLinks = AppLinks();
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    print("initDeepLinks called");
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        print('Initial URI: $initialUri');
        await _handleDeepLink(initialUri);
      } else {
        print('No initial URI found');
      }

      _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
        print('URI Update: $uri');
        _handleDeepLink(uri);
      }, onError: (err) {
        debugPrint('Error: $err');
      });
    } catch (e) {
      debugPrint('Exception: $e');
    }
  }

  Future<void> _handleDeepLink(Uri? uri) async {
    final prefs = await SharedPreferences.getInstance();
    bool? isHandled = prefs.getBool('deepLinkHandled') ?? false;

    if (!isHandled && uri != null) {
      print('Handling URI: $uri');
      if (await _isAppInstalled()) {
        print('App is installed, handling deep link: $uri');
        _navigateToPath(uri);
      } else {
        print('App is not installed, redirecting to Play Store');
        await _redirectToPlayStore();
      }
      await prefs.setBool('deepLinkHandled', true);
    }
  }

  Future<void> _navigateToPath(Uri uri) async {
    String path = uri.path;
    List<String> pathSegments = uri.pathSegments;
    print('Navigating to: $path with path segments: $pathSegments');

    // Extract and print the hashedPhone value from path segments
    String? hashedPhone = pathSegments.length > 1 && pathSegments[0] == 'path' ? pathSegments[1].split('=')[1] : null;
    print('Extracted hashedPhone: $hashedPhone');

    // Check if the user is authenticated
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(authToken) == null || prefs.getString(authToken) == '') {
      print('User not authenticated, navigating to Welcome Screen');
      Get.offAllNamed('/');
      return;
    }

    // User is authenticated, handle deep link based on path or hashedPhone
    if (hashedPhone != null && hashedPhone.isNotEmpty && prefs.getString(userName) != 'null') {
      print('Redirecting to custom page for hashedPhone');
      Get.offAllNamed('/pathsScreen', arguments: {'hashedPhone': hashedPhone});
    }
    else {
      print('Navigating to Default Screen');
      Get.offAllNamed('/');
    }
  }

  Future<bool> _isAppInstalled() async {
    const package = 'social.vouch.relayt';
    const url = 'market://details?id=$package';
    return await canLaunch(url);
  }

  Future<void> _redirectToPlayStore() async {
    const package = 'social.vouch.relayt';
    const playStoreUrl = 'https://play.google.com/store/apps/details?id=$package';

    if (await canLaunch(playStoreUrl)) {
      await launch(playStoreUrl);
    } else {
      print('Could not launch Play Store URL: $playStoreUrl');
    }
  }

  @override
  void onClose() {
    _linkSubscription?.cancel();
    super.onClose();
  }
}
