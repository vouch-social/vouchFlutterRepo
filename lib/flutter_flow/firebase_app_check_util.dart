import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider:
          ReCaptchaV3Provider('6Lejb14pAAAAAP98s_COk-i14GKm46jigIUs17Pp'),
      androidProvider: AndroidProvider.playIntegrity,
    );
