## Activities 

### Day 12

**Learning Objective**: Learn how to setup Cloud Firestore project from scratch.

**Project**: Create a Twitter Social Media App using Firebase Firestore. 

#### Setup project

1. Git clone

```
git clone https://github.com/flutter-campers/activities
```

2. Open the project in VSCode or Android Studio, run the following to enter the directory:

```
cd day-012/bootcamp_todos
```

3. Download the dependencies of the project

```
flutter pub get
```

4. Run the Flutter project

```
flutter run
```

#### Activity
1. Create a new [Firebase project](https://firebase.google.com/)
2. Download the `google-services.json` and replace the existing `google-services.json` in `android/app

Also, in `firebase_options.dart`, replace the following:

```
static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDs5ww_mCkh7TPaYp1bUxx20ZEXw2QpPyI',
    appId: '1:455855695322:android:35c8689b4a5dd7da13cce3',
    messagingSenderId: '455855695322',
    projectId: 'dict-firebase-todo',
    storageBucket: 'dict-firebase-todo.appspot.com',
);
```

3. Set up a Firestore database
4. Add [firebase_core](https://pub.dev/packages/firebase_core) and [cloud_firestore](https://pub.dev/packages/cloud_firestore) to your Flutter project
5. Create a Firestore collection named `tweets`
6. Load and read the documents from the collection in the `TweetPage` page
7. Create a new data in the collection
8. Delete an existing data in the collection
9. Create a new Github repository named `activities`
10. Push the changes to your repo

### Day 13

**Learning Objective**: Learn how to setup Firebase Auth project from scratch.

**Project**: Create a Twitter Social Media App using Firebase Firestore. 

#### Setup project

1. Git clone

```
git clone https://github.com/flutter-campers/activities
```

2. Open the project in VSCode or Android Studio, run the following to enter the directory:

```
cd day-013/bootcamp_todos
```

3. Download the dependencies of the project

```
flutter pub get
```

4. Run the Flutter project

```
flutter run
```

#### Activity

1. Create a new [Firebase project](https://firebase.google.com/)

2. Click **Project Overview**, then create a new **Android** appp

3. From the project menu (left side), click **Build**, then click **Authentication**, last tap **Get Started**

4. Tap **Anonymous**, then toggle switch to Enable, and click **Save**

5. Tap **Add New Provider**, then toggle switch to Enable, update the details and click **Save** 

![Google Provider](.github/screenshots/google_provider.png)

6. Download the `google-services.json` and replace the existing `google-services.json` in `android/app

Also, in `firebase_options.dart`, replace the following:

```
static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDs5ww_mCkh7TPaYp1bUxx20ZEXw2QpPyI',
    appId: '1:455855695322:android:35c8689b4a5dd7da13cce3',
    messagingSenderId: '455855695322',
    projectId: 'dict-firebase-todo',
    storageBucket: 'dict-firebase-todo.appspot.com',
);
```

7. Configure keytool for [Windows](https://stackoverflow.com/questions/5488339/how-can-i-find-and-run-the-keytool) or [macOS](https://dabeen.medium.com/use-keytool-on-mac-for-cert-valida-9f5572a0ebd8)

8. Obtaining SHA-1 fingerprint for debug

Run signing report task:
```
cd android
./gradlew signingReport
```

NOTE: For Windows, you may need to install [Gradle](https://gradle.org/install/) for Windows

Output:

```
----------

> Task :firebase_auth:signingReport
Variant: debugAndroidTest
Config: debug
Store: /Users/joshuadeguzman/.android/debug.keystore
Alias: AndroidDebugKey
MD5: EF:6C:BB:A5:EE:9D:48:0D:2C:15:E7:0B:99:FF:2B:B9
SHA1: 45:27:14:23:F6:BA:62:68:11:77:D7:C5:A6:98:AF:C0:95:B6:4D:D0
SHA-256: 70:48:8C:5D:BB:2D:01:56:48:BD:B6:7E:9B:D8:C8:33:96:06:F2:82:16:45:F0:35:1D:44:C7:E8:69:10:EC:0A
Valid until: Saturday, 28 May 2050
----------
```

Get the SHA1 property:
```
SHA1: 45:27:14:23:F6:BA:62:68:11:77:D7:C5:A6:98:AF:C0:95:B6:4D:D0
```
9. Add the `SHA-1` fingerprint on the Android app of your Firebase project.

10. Add firebase_auth dependency

```
flutter pub add firebase_auth
```

8. Make sure to initialize Flutter project in the `main.dart` file:

```
Future<void> main() async {
    // Previous changes we made
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();

    // Initialize Firebase Auth emulator
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
}
```

**Helpful Resources**
- https://www.techotopia.com/index.php?title=Google_Sign-In_Authentication_using_FirebaseUI_Auth&mobileaction=toggle_view_mobile
- https://firebase.flutter.dev/docs/auth/usage/
- https://firebase.google.com/docs/auth/flutter/start