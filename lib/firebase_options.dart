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
    apiKey: 'AIzaSyBDXKofl3GtBqc8gyu2iEJo7q5oqnpy1m4',
    appId: '1:70435152868:web:619b5fb08eb878d311ddf1',
    messagingSenderId: '70435152868',
    projectId: 'jobsearch-d0b5a',
    authDomain: 'jobsearch-d0b5a.firebaseapp.com',
    storageBucket: 'jobsearch-d0b5a.appspot.com',
    measurementId: 'G-0VQJDFHL3E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbgzvOpymVncb7nz8T90Wqpvl3u9ltEQU',
    appId: '1:70435152868:android:5f4587a2692c831411ddf1',
    messagingSenderId: '70435152868',
    projectId: 'jobsearch-d0b5a',
    storageBucket: 'jobsearch-d0b5a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBj2rzn0VDyrjI5gO4NCtwLSqjwpRgaSRQ',
    appId: '1:70435152868:ios:5d11c85ed88a4b0211ddf1',
    messagingSenderId: '70435152868',
    projectId: 'jobsearch-d0b5a',
    storageBucket: 'jobsearch-d0b5a.appspot.com',
    iosBundleId: 'com.jobsearchsajidportfolioapp.jobSearch',
  );

}