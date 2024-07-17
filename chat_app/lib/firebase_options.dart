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
    apiKey: 'AIzaSyCvVUCaQ0k-WZTYfIJ4EhxkR9PjQpGG0iI',
    appId: '1:680796777557:web:f0280c17570532ede838dc',
    messagingSenderId: '680796777557',
    projectId: 'flutter-chat-app-e1204',
    authDomain: 'flutter-chat-app-e1204.firebaseapp.com',
    storageBucket: 'flutter-chat-app-e1204.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSwlWV4Tx-yqXWADFWzBUaQN2-6NEedz4',
    appId: '1:680796777557:android:53f52cf75cba44e2e838dc',
    messagingSenderId: '680796777557',
    projectId: 'flutter-chat-app-e1204',
    storageBucket: 'flutter-chat-app-e1204.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLowbBCTQQTPRT0KgKl4YoOPAfd2x3awU',
    appId: '1:680796777557:ios:ecca8866d3b842d7e838dc',
    messagingSenderId: '680796777557',
    projectId: 'flutter-chat-app-e1204',
    storageBucket: 'flutter-chat-app-e1204.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLowbBCTQQTPRT0KgKl4YoOPAfd2x3awU',
    appId: '1:680796777557:ios:ecca8866d3b842d7e838dc',
    messagingSenderId: '680796777557',
    projectId: 'flutter-chat-app-e1204',
    storageBucket: 'flutter-chat-app-e1204.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCvVUCaQ0k-WZTYfIJ4EhxkR9PjQpGG0iI',
    appId: '1:680796777557:web:d93aca4fd126b895e838dc',
    messagingSenderId: '680796777557',
    projectId: 'flutter-chat-app-e1204',
    authDomain: 'flutter-chat-app-e1204.firebaseapp.com',
    storageBucket: 'flutter-chat-app-e1204.appspot.com',
  );

}