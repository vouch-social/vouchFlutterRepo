import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';
import './backend/push_notifications/push_notifications_util.dart';
import './backend/firebase/firebase_config.dart';
import '/new_code/backend/backend_constants.dart';
import '/new_code/onboarding/waterfall_model.dart';
import '/new_code/services/firebase_option.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/firebase_app_check_util.dart';
import './backend/firebase_dynamic_links/firebase_dynamic_links.dart';
import './new_code/onboarding/welcome_screen/welcome_screen.dart';
import '/new_code/services/notification_services.dart';

SharedPreferences? prefs;
bool _initialUriIsHandled = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? token = await FirebaseMessaging.instance.getToken();
  print("Firebase token from instance : $token");
  await initFirebase();
  await initSharedPreferences();

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
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
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
    _handleIncomingLinks();
    _handleInitialUri();
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

  void _handleIncomingLinks() {
    if (!kIsWeb) {
      _sub = uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        setState(() {
          _latestUri = uri;
          _err = null;
        });
      }, onError: (Object err) {
        if (!mounted) return;
        setState(() {
          _latestUri = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
    }
  }

  Future<void> _handleInitialUri() async {
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          print('no initial uri');
        } else {
          print('got initial uri: $uri');
        }
        if (!mounted) return;
        setState(() => _initialUri = uri);
      } on PlatformException {
        print('failed to get initial uri');
      } on FormatException catch (err) {
        if (!mounted) return;
        setState(() => _err = err);
      }
    }
  }

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (context, _) => GetMaterialApp(
            title: 'Vouch',
            debugShowCheckedModeBanner: false,
            locale: _locale,
            supportedLocales: const [
              Locale('en'),
            ],
            theme: ThemeData(
              brightness: Brightness.light,
              useMaterial3: false,
            ),
            themeMode: _themeMode,
            // builder: (_, child) => DynamicLinksHandler(
            //       router: _router,
            //       child: child!,
            //     ),
            home: prefs?.getString(authToken) == null
                ? const WelcomeScreen()
                : navigateToPage()

        ),
      );
}
