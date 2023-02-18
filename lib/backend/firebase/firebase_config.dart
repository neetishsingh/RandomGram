import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAD6oaFvzJZbKhm5uu1fqzNbOcWaPIXF9o",
            authDomain: "fir-log-72289.firebaseapp.com",
            projectId: "fir-log-72289",
            storageBucket: "fir-log-72289.appspot.com",
            messagingSenderId: "204412051515",
            appId: "1:204412051515:web:5d5e616c5bf0d8319ffc1e",
            measurementId: "G-555EPYH47K"));
  } else {
    await Firebase.initializeApp();
  }
}
