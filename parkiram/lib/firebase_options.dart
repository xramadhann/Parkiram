// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAnTTUy3VS8ndsy-i4lMwUjvUvQNV37iLA',
    appId: '1:138446455877:web:abfbde8e45f0fd3d5e8f2c',
    messagingSenderId: '138446455877',
    projectId: 'parkiram-807eb',
    authDomain: 'parkiram-807eb.firebaseapp.com',
    databaseURL: 'https://parkiram-807eb-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'parkiram-807eb.firebasestorage.app',
    measurementId: 'G-4Q2LNBRXY7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvU-wOdFrjES4slQZU_XS0peq9AWJd5FI',
    appId: '1:138446455877:android:bacbaf0e80c00f315e8f2c',
    messagingSenderId: '138446455877',
    projectId: 'parkiram-807eb',
    databaseURL: 'https://parkiram-807eb-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'parkiram-807eb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfKY1tpMpm7SCejnEIuyAQK-5-MVzSWkw',
    appId: '1:138446455877:ios:98f6b065f4fa68fc5e8f2c',
    messagingSenderId: '138446455877',
    projectId: 'parkiram-807eb',
    databaseURL: 'https://parkiram-807eb-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'parkiram-807eb.firebasestorage.app',
    iosBundleId: 'com.example.parkiram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfKY1tpMpm7SCejnEIuyAQK-5-MVzSWkw',
    appId: '1:138446455877:ios:98f6b065f4fa68fc5e8f2c',
    messagingSenderId: '138446455877',
    projectId: 'parkiram-807eb',
    databaseURL: 'https://parkiram-807eb-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'parkiram-807eb.firebasestorage.app',
    iosBundleId: 'com.example.parkiram',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAnTTUy3VS8ndsy-i4lMwUjvUvQNV37iLA',
    appId: '1:138446455877:web:9e92deb81a3814195e8f2c',
    messagingSenderId: '138446455877',
    projectId: 'parkiram-807eb',
    authDomain: 'parkiram-807eb.firebaseapp.com',
    databaseURL: 'https://parkiram-807eb-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'parkiram-807eb.firebasestorage.app',
    measurementId: 'G-HTKGL2G23M',
  );

}