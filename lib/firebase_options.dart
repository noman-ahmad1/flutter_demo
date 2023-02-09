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
    apiKey: 'AIzaSyDMCQNX4bjnJ94O7fNtl8suNqcgLnv9GaI',
    appId: '1:401555026608:web:1532971b685ac5f2e94175',
    messagingSenderId: '401555026608',
    projectId: 'fir-series-1dbce',
    authDomain: 'fir-series-1dbce.firebaseapp.com',
    storageBucket: 'fir-series-1dbce.appspot.com',
    measurementId: 'G-FGPH27FH40',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCX2lc9g-xnFsLkf13AKg2fN3fWEL60doc',
    appId: '1:401555026608:android:ac08c85aa4cdf1dee94175',
    messagingSenderId: '401555026608',
    projectId: 'fir-series-1dbce',
    storageBucket: 'fir-series-1dbce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjpMHRJLbLPsjjBCHj-fWa7nTE-AhrBWk',
    appId: '1:401555026608:ios:f222db242e5afefce94175',
    messagingSenderId: '401555026608',
    projectId: 'fir-series-1dbce',
    storageBucket: 'fir-series-1dbce.appspot.com',
    iosClientId: '401555026608-00r3g06ps97fdpksc05uj31d43533jn1.apps.googleusercontent.com',
    iosBundleId: 'com.example.practiceApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjpMHRJLbLPsjjBCHj-fWa7nTE-AhrBWk',
    appId: '1:401555026608:ios:f222db242e5afefce94175',
    messagingSenderId: '401555026608',
    projectId: 'fir-series-1dbce',
    storageBucket: 'fir-series-1dbce.appspot.com',
    iosClientId: '401555026608-00r3g06ps97fdpksc05uj31d43533jn1.apps.googleusercontent.com',
    iosBundleId: 'com.example.practiceApplication1',
  );
}
