## Activities 

### Day 12

Create a Twitter Social Media App using Firebase Firestore. 

#### Usage
1. Git clone

```
git clone https://github.com/flutter-campers/activities
```

2. Open the project in VSCode or Android Studio, or simply run

```
cd activities/day-012/bootcamp_todos
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
2. Download the `google-services.json` and replace the existing `google-services.json` in `android/app`
3. Set up a Firestore database
4. Add [firebase_core](https://pub.dev/packages/firebase_core) and [cloud_firestore](https://pub.dev/packages/cloud_firestore) to your Flutter project
5. Create a Firestore collection named `tweets`
6. Load and read the documents from the collection in the `TweetPage` page
7. Create a new data in the collection
8. Delete an existing data in the collection
9. Create a new Github repository named `activities`
10. Push the changes to your repo