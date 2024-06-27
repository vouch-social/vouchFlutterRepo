import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import 'package:vouch/new_code/backend/backend_constants.dart';
import 'app_links.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';
import './backend/firebase/firebase_config.dart';
import 'new_code/connectivity/connectivity_controller.dart';
import 'new_code/onboarding/waterfall_model.dart';
import 'new_code/services/firebase_option.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/firebase_app_check_util.dart';
import './backend/firebase_dynamic_links/firebase_dynamic_links.dart';
import './new_code/onboarding/welcome_screen/welcome_screen.dart';
import 'new_code/services/notification_services.dart';

SharedPreferences? prefs;
bool _initialUriIsHandled = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppLinksDeepLink.instance.onInit();
  await Upgrader.clearSavedSettings();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? token = await FirebaseMessaging.instance.getToken();
  print("Firebase token from instance : $token");

  await initFirebase();
  await initSharedPreferences();
  await initializeUpgrader();

  /// for linkdin login url
  usePathUrlStrategy();
  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();
  await initializeFirebaseAppCheck();
  await prefs?.setString(fcmToken, token.toString());
  print("Firebase Token from sharedPrefs : ${prefs?.getString(fcmToken)}");
  usePathUrlStrategy();
  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
  Get.put(InternetController(), permanent: true);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
Future<void> initializeUpgrader() async {
  Upgrader().initialize();
}
NotificationServices notificationServices = NotificationServices();

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  final AppLinksDeepLink _appLinksDeepLink = AppLinksDeepLink.instance;
  Uri? _initialUri;
  Uri? _latestUri;
  Object? _err;

  StreamSubscription? _sub;

  final authUserSub = authenticatedUserStream.listen((_) {});
  // final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = vouchFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    notificationServices.requestNotificationPermission();
    notificationServices.initLocalNotifications();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken();
    notificationServices.checkForNotificationPayload(context);
    notificationServices.clearNotificationPayload();
    _appLinksDeepLink.initDeepLinks();
  }

  @override
  void dispose() {
    authUserSub.cancel();
    // fcmTokenSub.cancel();
    _sub?.cancel();
    super.dispose();
    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });


  @override
  Widget build(BuildContext context) {
    _appLinksDeepLink.initDeepLinks();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, _) => GetMaterialApp(
        title: 'Vouch',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [
          Locale('en'),
        ],
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: false,
        ),
        themeMode: _themeMode,
        builder: (_, child) => DynamicLinksHandler(
          router: _router,
          child: child!,
        ),
        home: prefs?.getString(authToken) == null ||
                prefs?.getString(authToken) == ''
            ? UpgradeAlert(
                onIgnore: onIgnore,
                onLater: onLater,
                onUpdate: onUpdate,
                dialogStyle: UpgradeDialogStyle.material,
                upgrader: Upgrader(
                  debugDisplayAlways: true,
                  debugLogging: true,
                  minAppVersion: "1.0.1",
                  durationUntilAlertAgain: const Duration(days: 1),
                ),
                child: const WelcomeScreen())
            : UpgradeAlert(
                onIgnore: onIgnore,
                onLater: onLater,
                onUpdate: onUpdate,
                dialogStyle: UpgradeDialogStyle.material,
                upgrader: Upgrader(
                  debugDisplayAlways: true,
                  debugLogging: true,
                  minAppVersion: "1.0.1",
                  durationUntilAlertAgain: const Duration(days: 1),
                ),
                child: navigateToPage()),
      ),
    );
  }

  bool onIgnore() {
    print('Update ignored by the user.');
    return true;
  }

  bool onLater() {
    print('User chose to update later.');
    return true;
  }

  bool onUpdate() {
    print('User chose to update the app.');
    return true;
  }
}
