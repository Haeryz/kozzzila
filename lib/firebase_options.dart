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
    apiKey: 'AIzaSyDQqkPYt0ib60p93iK_yAnz82r55yrVndE',
    appId: '1:373279676922:web:8e6981de20e8ae58256c43',
    messagingSenderId: '373279676922',
    projectId: 'kozzzila',
    authDomain: 'kozzzila.firebaseapp.com',
    storageBucket: 'kozzzila.firebasestorage.app',
    measurementId: 'G-MBBWCQKXNG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKQVDoccz2gpOAUlNkJbJci4gMcDMTL6g',
    appId: '1:373279676922:android:3c1bd697538ff3cd256c43',
    messagingSenderId: '373279676922',
    projectId: 'kozzzila',
    storageBucket: 'kozzzila.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAABg42J0Gf3S7Tf3W0ab7qosqw3Ew6DzI',
    appId: '1:373279676922:ios:95465601be7414f9256c43',
    messagingSenderId: '373279676922',
    projectId: 'kozzzila',
    storageBucket: 'kozzzila.firebasestorage.app',
    iosBundleId: 'com.example.kozzzila',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAABg42J0Gf3S7Tf3W0ab7qosqw3Ew6DzI',
    appId: '1:373279676922:ios:95465601be7414f9256c43',
    messagingSenderId: '373279676922',
    projectId: 'kozzzila',
    storageBucket: 'kozzzila.firebasestorage.app',
    iosBundleId: 'com.example.kozzzila',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDQqkPYt0ib60p93iK_yAnz82r55yrVndE',
    appId: '1:373279676922:web:fd51406f30030f36256c43',
    messagingSenderId: '373279676922',
    projectId: 'kozzzila',
    authDomain: 'kozzzila.firebaseapp.com',
    storageBucket: 'kozzzila.firebasestorage.app',
    measurementId: 'G-CN9KY36ZCJ',
  );
}
