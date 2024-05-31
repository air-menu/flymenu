import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static const String apiKey = 'AIzaSyDFhDCsNck8nBptD0Xk7d1zVoUXDJmvPFA'; // check
  static const String projectId = 'airmenu-4560b'; // check
  static const String storageBucket = 'airmenu-4560b.appspot.com'; // check

  static const String webAppId = '1:101723349324:web:6faba683d265cb27a46fe9'; // check
  static const String webMessagingSenderId = '101723349324'; // check
  static const String webAuthDomain = 'airmenu-4560b.firebaseapp.com'; // check
  static const String webMeasurementId = 'G-J6132K7B0Q';

  static const String androidApiKey = 'AIzaSyBugvZ6FRSe1ItdPw5luybXoNhliUex0m4'; // check
  static const String androidAppId = '1:101723349324:android:01b39c2013556ae3a46fe9'; // check
  static const String androidMessagingSenderId = '101723349324'; // check
  static const String androidClientId = '101723349324-b7harogm1ksjp0b4rn8jm33fsqao5s0t.apps.googleusercontent.com'; // check
  
  static const String iosApiKey = "AIzaSyA5xJurenlptHC2gHRKtOoKOxjUno5zcp0";
  static const String iosAppId = '1:101723349324:ios:2e49cdc16277bf93a46fe9'; // check
  static const String iosMessagingSenderId = '101723349324'; // check
  static const String iosClientId = '101723349324-n3bj7lh5llomg8667penbrojh6b9923b.apps.googleusercontent.com';
  static const String iosBundleId = 'com.airmenu.flymenu'; // check

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
    apiKey: apiKey,
    appId: webAppId,
    messagingSenderId: webMessagingSenderId,
    projectId: projectId,
    authDomain: webAuthDomain,
    storageBucket: storageBucket,
    measurementId: webMeasurementId,
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: androidApiKey,
    appId: androidAppId,
    messagingSenderId: androidMessagingSenderId,
    projectId: projectId,
    storageBucket: storageBucket,
    androidClientId: androidClientId,
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: iosApiKey,
    appId: iosAppId,
    messagingSenderId: iosMessagingSenderId,
    projectId: projectId,
    storageBucket: storageBucket,
    iosClientId: iosClientId,
    iosBundleId: iosBundleId,
  );
}
