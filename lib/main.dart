import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vouch/new_code/home_page/HomePage/new_home_page.dart';
import 'package:vouch/new_code/onboarding/auth_screen/login_screen/login_screen.dart';
import 'package:vouch/new_code/onboarding/customize_profile/user_details.dart';
import 'package:vouch/new_code/onboarding/goals/goals_screen.dart';
import 'package:vouch/new_code/onboarding/permissions/contacts_call_logs/import_screen.dart';
import 'package:vouch/new_code/onboarding/permissions/contacts_call_logs/upload_success.dart';
import 'package:vouch/new_code/onboarding/permissions/permissions_screen.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/push_notifications/push_notifications_util.dart';
import 'backend/firebase/firebase_config.dart';
import 'checkAuth.dart';
import 'firebase_option.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'flutter_flow/firebase_app_check_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

import '/backend/firebase_dynamic_links/firebase_dynamic_links.dart';

import 'new_code/backend/models/base_response.dart';
import 'new_code/backend/models/check_user_model.dart';
import 'new_code/backend/repos/auth_repo.dart';
import 'new_code/onboarding/auth_screen/login_screen/components/country_code_remover.dart';
import 'new_code/onboarding/auth_screen/otp_screen/otp_screen.dart';
import 'new_code/onboarding/linkdin/linkdin_screen.dart';
import 'new_code/onboarding/welcome_screen/welcome_screen.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// for linkdin login url
  usePathUrlStrategy();
  await initFirebase();
  await initSharedPreferences();
  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();
  await initializeFirebaseAppCheck();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}

Future<void> initSharedPreferences() async {
  prefs = await SharedPreferences.getInstance();
}

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

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = vouchFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (context, _) => GetMaterialApp(
            title: 'Vouch',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
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
            home: FutureBuilder<bool>(
              future: isUserLoggedIn(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.data == true) {
                  return newCustomNav();
                } else {
                  return const WelcomeScreen();
                }
              },
            )),
      );
}

/// Postman code to send notification
// {
// "to":
// "",
// "notification":{
// "title":"Demo notification",
// "body":"Please chal ja bhai 72"
// },
// "data":{
// "type":"msg",
// "id":121
// }
//
// }
