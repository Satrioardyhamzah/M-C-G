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
    apiKey: 'AIzaSyC3HEig_ZatSmzZFIfnlRr1JOMnBGnknZc',
    appId: '1:657420417272:web:0d043734d6ab002e0ee30d',
    messagingSenderId: '657420417272',
    projectId: 'fir-chatt-968d6',
    authDomain: 'fir-chatt-968d6.firebaseapp.com',
    storageBucket: 'fir-chatt-968d6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWfYkcMRYU1rmwvj4jJkd2j6Dj5YJ3c60',
    appId: '1:657420417272:android:c07262d4be2d6f1a0ee30d',
    messagingSenderId: '657420417272',
    projectId: 'fir-chatt-968d6',
    storageBucket: 'fir-chatt-968d6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbb9s4Nk1iJ-Pxvbhp2klxTXb_Z4YizjI',
    appId: '1:657420417272:ios:79bdf2ff592048f60ee30d',
    messagingSenderId: '657420417272',
    projectId: 'fir-chatt-968d6',
    storageBucket: 'fir-chatt-968d6.appspot.com',
    iosBundleId: 'com.example.firebasechat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBbb9s4Nk1iJ-Pxvbhp2klxTXb_Z4YizjI',
    appId: '1:657420417272:ios:79bdf2ff592048f60ee30d',
    messagingSenderId: '657420417272',
    projectId: 'fir-chatt-968d6',
    storageBucket: 'fir-chatt-968d6.appspot.com',
    iosBundleId: 'com.example.firebasechat',
  );
}
