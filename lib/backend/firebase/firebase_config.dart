import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDNFNWG6neHaLU4SIGUpQ5-eBrCyAK7H8E",
            authDomain: "realnow-ios.firebaseapp.com",
            projectId: "realnow-ios",
            storageBucket: "realnow-ios.appspot.com",
            messagingSenderId: "821628191115",
            appId: "1:821628191115:web:1aaf4bddaa51d26ff8ef8e",
            measurementId: "G-QWHMRL67L8"));
  } else {
    await Firebase.initializeApp();
  }
}
