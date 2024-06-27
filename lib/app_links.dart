import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vouch/new_code/home_page/search_screen/search_screen.dart';
import 'package:vouch/new_code/home_page/settings/settings_screen.dart';

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
    _appLinks = AppLinks();
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
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
    if (!_deepLinkHandled && uri != null) {
      _deepLinkHandled = true;
      print('Handling URI: $uri');
      if (await _isAppInstalled()) {
        print('App is installed, handling deep link: $uri');
        _navigateToPath(uri);
      } else {
        print('App is not installed, redirecting to Play Store');
        await _redirectToPlayStore();
      }
    }
  }

  Future<void> _navigateToPath(Uri uri) async {
    String path = uri.path;
    Map<String, String> queryParams = uri.queryParameters;
    print('Navigating to: $path with params: $queryParams');

    if (queryParams['param'] == '/settings') {
      print('Navigating to Settings Screen');
      Get.off(() => const SettingsScreen());
    } else {
      print('Navigating to Search Screen');
      if (await canLaunch("https://vouch.social")) {
    await launch("https://vouch.social");
    }
      // Get.off(() => const SearchScreen());
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
