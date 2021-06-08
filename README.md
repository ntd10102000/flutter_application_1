# flutter_application_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Demo Screenshot

1. Login screen
![193578670_479050993308705_3299066360673782462_n](https://user-images.githubusercontent.com/52647821/121268573-6d7fec00-c8e8-11eb-87ac-6f2e5af35bf4.png)
2. Home
![192680969_1932163010294738_5908222029883317155_n](https://user-images.githubusercontent.com/52647821/121268763-bcc61c80-c8e8-11eb-9187-71247991f8f6.png)
3. Drawer
![193767370_1008097779934009_7949199224489142248_n](https://user-images.githubusercontent.com/52647821/121268819-e121f900-c8e8-11eb-861b-e733372c6ee6.png)
4. Search
![195019569_1252139271885243_5625288297240539963_n](https://user-images.githubusercontent.com/52647821/121268868-fbf46d80-c8e8-11eb-82ca-bf13d7cf3256.png)
5. Photo detail
![194734626_2239828566148136_6554330748387916513_n](https://user-images.githubusercontent.com/52647821/121268919-11699780-c8e9-11eb-8dd8-9a808e1a7324.png)

## Getting Started

1: Call `WidgetsFlutterBinding.ensureInitialized();` in main() before calling `runApp()`:

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
```

2: Create a function that connects to Firebase:
First need to import the following 2 packages:
`import 'package:firebase_auth/firebase_auth.dart';`
`import 'package:firebase_core/firebase_core.dart';`

```dart
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

3: Create a variable that stores the user user in Firebase:
```dart
final user = FirebaseAuth.instance.currentUser;
```

4: Get user information from Firebase
```dart
final auth = FirebaseAuth.instance;
```

5: Create account password
```dart
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
```

6: Api from Flickr to get photos
```dart
final url = Uri.https(
      'www.flickr.com',
      'services/rest',
      {
        'api_key': '5a9d130758d8c0c27a501e3179ad02f4',
        'photo_id': widget.id,
        'method': 'flickr.photos.getInfo',
        'format': 'json',
        'nojsoncallback': '1',
      },
    );
```
