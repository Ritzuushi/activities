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

[TODO] Add steps for Firebase Auth