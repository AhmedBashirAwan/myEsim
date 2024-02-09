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
    apiKey: 'AIzaSyCSRRib4ReQsU2ecnKrGB4-IbYAnM_2soY',
    appId: '1:491281405242:web:62364d152de3d1f93a2c03',
    messagingSenderId: '491281405242',
    projectId: 'esim-a49d6',
    authDomain: 'esim-a49d6.firebaseapp.com',
    storageBucket: 'esim-a49d6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1YWGCzggRxJMvkgUIKk-yrAy9hKJEGX8',
    appId: '1:491281405242:android:78f343d9387ef4693a2c03',
    messagingSenderId: '491281405242',
    projectId: 'esim-a49d6',
    storageBucket: 'esim-a49d6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfsOrvkJuKWzXRvDglPszXmvKszlzsXFc',
    appId: '1:491281405242:ios:3db399ed602ed1963a2c03',
    messagingSenderId: '491281405242',
    projectId: 'esim-a49d6',
    storageBucket: 'esim-a49d6.appspot.com',
    iosBundleId: 'com.example.esim',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfsOrvkJuKWzXRvDglPszXmvKszlzsXFc',
    appId: '1:491281405242:ios:e521c9f68c3192b73a2c03',
    messagingSenderId: '491281405242',
    projectId: 'esim-a49d6',
    storageBucket: 'esim-a49d6.appspot.com',
    iosBundleId: 'com.example.esim.RunnerTests',
  );
}