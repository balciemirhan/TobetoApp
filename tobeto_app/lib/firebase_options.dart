import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.

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
    apiKey: 'AIzaSyAeQFPSxoX7zW35V8ZEhqqNBraNayPN6Is',
    appId: '1:238720851965:web:3059351e2e3cdf2375c394',
    messagingSenderId: '238720851965',
    projectId: 'tobetoapp-c22c7',
    authDomain: 'tobetoapp-c22c7.firebaseapp.com',
    storageBucket: 'tobetoapp-c22c7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxg_jAKFUNaka0QL2QKvr2fZDiJha8718',
    appId: '1:238720851965:android:983143fee75732c975c394',
    messagingSenderId: '238720851965',
    projectId: 'tobetoapp-c22c7',
    storageBucket: 'tobetoapp-c22c7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8zlE0NKGfsf89_BJgro3dhwz2PDFBvfA',
    appId: '1:238720851965:ios:473635bafe7329e675c394',
    messagingSenderId: '238720851965',
    projectId: 'tobetoapp-c22c7',
    storageBucket: 'tobetoapp-c22c7.appspot.com',
    androidClientId:
        '238720851965-4avsnr6ntaflj28h1o3h211u195okpvp.apps.googleusercontent.com',
    iosClientId:
        '238720851965-umkmmmim87ou6t8il3e2c8vchfclu77a.apps.googleusercontent.com',
    iosBundleId: 'com.example.tobetoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8zlE0NKGfsf89_BJgro3dhwz2PDFBvfA',
    appId: '1:238720851965:ios:2e918481133091f275c394',
    messagingSenderId: '238720851965',
    projectId: 'tobetoapp-c22c7',
    storageBucket: 'tobetoapp-c22c7.appspot.com',
    androidClientId:
        '238720851965-4avsnr6ntaflj28h1o3h211u195okpvp.apps.googleusercontent.com',
    iosClientId:
        '238720851965-r541ro0l5l6jvb3vdl8vp0m9oij4qc1g.apps.googleusercontent.com',
    iosBundleId: 'com.example.tobetoApp.RunnerTests',
  );
}
