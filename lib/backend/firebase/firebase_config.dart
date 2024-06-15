import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDgFmOO3V7zlP6gNykicy1L9PxTvWMMTG0",
            authDomain: "konnekt-yq73qg.firebaseapp.com",
            projectId: "konnekt-yq73qg",
            storageBucket: "konnekt-yq73qg.appspot.com",
            messagingSenderId: "227154710197",
            appId: "1:227154710197:web:fcfdbe1ed1b1269a6038fc",
            measurementId: "G-823Q85L2QC"));
  } else {
    await Firebase.initializeApp();
  }
}
