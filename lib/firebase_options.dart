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
    apiKey: 'AIzaSyCfkJE7elBu4y_1WzKjuzwyr7CUcyokv-Q',
    appId: '1:587285869009:web:8b0abc3e20011818d0f0f0',
    messagingSenderId: '587285869009',
    projectId: 'alraseef-a8a8c',
    authDomain: 'alraseef-a8a8c.firebaseapp.com',
    storageBucket: 'alraseef-a8a8c.appspot.com',
    measurementId: 'G-G5C9QD6WXS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_W1w_PKS0-mycx-LdYY4qmLztm-v2hKU',
    appId: '1:587285869009:android:85c7f264d4a891b1d0f0f0',
    messagingSenderId: '587285869009',
    projectId: 'alraseef-a8a8c',
    storageBucket: 'alraseef-a8a8c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmaTMseqagDQlOsncoIpjUMSzq6fVHvE4',
    appId: '1:587285869009:ios:34e81d5c73131a86d0f0f0',
    messagingSenderId: '587285869009',
    projectId: 'alraseef-a8a8c',
    storageBucket: 'alraseef-a8a8c.appspot.com',
    iosClientId: '587285869009-24rdvlmt7neq5b40ae5p40hncpfh1a7p.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectModel1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmaTMseqagDQlOsncoIpjUMSzq6fVHvE4',
    appId: '1:587285869009:ios:0737400eb49ae2d9d0f0f0',
    messagingSenderId: '587285869009',
    projectId: 'alraseef-a8a8c',
    storageBucket: 'alraseef-a8a8c.appspot.com',
    iosClientId: '587285869009-gdqqh4e9v8e7rf5msf99g00lp3ul80q9.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectModel1.RunnerTests',
  );
}