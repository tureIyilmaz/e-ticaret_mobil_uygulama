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
    apiKey: 'AIzaSyDSg8WH4ZkaXwKoV97v0q2MuXb-Au3OpIU',
    appId: '1:1044186853929:web:9e572027e15259eac7a238',
    messagingSenderId: '1044186853929',
    projectId: 'login-app-f3f19',
    authDomain: 'login-app-f3f19.firebaseapp.com',
    storageBucket: 'login-app-f3f19.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoKEju_b27g4FGl9c1wXKlCFNaSh2PNUI',
    appId: '1:1044186853929:android:a0a2b349133119e8c7a238',
    messagingSenderId: '1044186853929',
    projectId: 'login-app-f3f19',
    storageBucket: 'login-app-f3f19.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzywZolAM60sPp-k6JlUqW15puYST_Vao',
    appId: '1:1044186853929:ios:e9803f2bd5e01627c7a238',
    messagingSenderId: '1044186853929',
    projectId: 'login-app-f3f19',
    storageBucket: 'login-app-f3f19.appspot.com',
    iosBundleId: 'com.example.eTicaretMobilUygulama',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzywZolAM60sPp-k6JlUqW15puYST_Vao',
    appId: '1:1044186853929:ios:e9803f2bd5e01627c7a238',
    messagingSenderId: '1044186853929',
    projectId: 'login-app-f3f19',
    storageBucket: 'login-app-f3f19.appspot.com',
    iosBundleId: 'com.example.eTicaretMobilUygulama',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDSg8WH4ZkaXwKoV97v0q2MuXb-Au3OpIU',
    appId: '1:1044186853929:web:2fcde597478a4deac7a238',
    messagingSenderId: '1044186853929',
    projectId: 'login-app-f3f19',
    authDomain: 'login-app-f3f19.firebaseapp.com',
    storageBucket: 'login-app-f3f19.appspot.com',
  );

}