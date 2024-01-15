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
        return macos;
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
    apiKey: 'AIzaSyDM7ml1GwzWRGMC4TJ0-cSqnAyFLf1l56U',
    appId: '1:110368795893:web:cd976807aadaec2551e9bc',
    messagingSenderId: '110368795893',
    projectId: 'aklk-3ndna',
    authDomain: 'aklk-3ndna.firebaseapp.com',
    storageBucket: 'aklk-3ndna.appspot.com',
    measurementId: 'G-LKTCDSHH8N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZ1iiH4M9PJoxbeC6DQh04W8LYydBtAHM',
    appId: '1:110368795893:android:9257ca8853cd276b51e9bc',
    messagingSenderId: '110368795893',
    projectId: 'aklk-3ndna',
    storageBucket: 'aklk-3ndna.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPfLeiCrczE-T6LLnke_zjvtn5n7vC6_M',
    appId: '1:110368795893:ios:f527eb717313f8b251e9bc',
    messagingSenderId: '110368795893',
    projectId: 'aklk-3ndna',
    storageBucket: 'aklk-3ndna.appspot.com',
    iosBundleId: 'com.example.admin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBPfLeiCrczE-T6LLnke_zjvtn5n7vC6_M',
    appId: '1:110368795893:ios:55990c180a0ba55251e9bc',
    messagingSenderId: '110368795893',
    projectId: 'aklk-3ndna',
    storageBucket: 'aklk-3ndna.appspot.com',
    iosBundleId: 'com.example.admin.RunnerTests',
  );
}