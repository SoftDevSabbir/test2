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
    apiKey: 'AIzaSyCRTpmnGtFw1DM5JofyiLlOuCh-2kyLTBA',
    appId: '1:74935724775:web:d1c961f982249d49db5042',
    messagingSenderId: '74935724775',
    projectId: 'test2-ae1a0',
    authDomain: 'test2-ae1a0.firebaseapp.com',
    storageBucket: 'test2-ae1a0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIHeOtyrdZdg_8fIR4NRhLd1kBJAwr42I',
    appId: '1:74935724775:android:db0e3958b6cf2051db5042',
    messagingSenderId: '74935724775',
    projectId: 'test2-ae1a0',
    storageBucket: 'test2-ae1a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdpdCuobmRgWZ2_TsUOjA8Vm09bNtJtO4',
    appId: '1:74935724775:ios:4026d07ed55192f6db5042',
    messagingSenderId: '74935724775',
    projectId: 'test2-ae1a0',
    storageBucket: 'test2-ae1a0.appspot.com',
    iosBundleId: 'com.example.test2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdpdCuobmRgWZ2_TsUOjA8Vm09bNtJtO4',
    appId: '1:74935724775:ios:e5f6cfd8f55d6e8fdb5042',
    messagingSenderId: '74935724775',
    projectId: 'test2-ae1a0',
    storageBucket: 'test2-ae1a0.appspot.com',
    iosBundleId: 'com.example.test2.RunnerTests',
  );
}
