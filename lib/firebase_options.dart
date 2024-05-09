// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCN6gGnvv73wkNM9qvGP0tborQYAk5c6eg',
    appId: '1:205815946399:web:fc831f43543a2278c816aa',
    messagingSenderId: '205815946399',
    projectId: 'stuwise-d0a47',
    authDomain: 'stuwise-d0a47.firebaseapp.com',
    storageBucket: 'stuwise-d0a47.appspot.com',
    measurementId: 'G-6ZJ90GF2D2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmfO4QePBvxNe1E1kbmB9LGJ-OUqSRG44',
    appId: '1:205815946399:android:924e527e1f60f1abc816aa',
    messagingSenderId: '205815946399',
    projectId: 'stuwise-d0a47',
    storageBucket: 'stuwise-d0a47.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQsQknYyL0ez0gQlLz_UPs_L3AyUeTWxI',
    appId: '1:205815946399:ios:3198d314465dbde6c816aa',
    messagingSenderId: '205815946399',
    projectId: 'stuwise-d0a47',
    storageBucket: 'stuwise-d0a47.appspot.com',
    iosBundleId: 'com.example.stuwise',
  );
}