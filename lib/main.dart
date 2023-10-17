import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/welcome.dart';

import 'package:myapp/firebase_options.dart';
import 'package:myapp/pages/custom_widgets.dart';
import 'package:myapp/pages/wrapper.dart';
import 'pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future <void> main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseFirestore.instance.settings( // Initialize Firestore
  //   persistenceEnabled: true, // Enable local persistence
  // );

   // Initialize Firestore with settings
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.settings = const Settings(
    persistenceEnabled: true, // Enable local persistence
    // Add more settings as needed
  );
  runApp(const MyApp());
}

class UploadPic extends StatefulWidget {
  const UploadPic({Key? key}) : super(key: key);

  @override
  State<UploadPic> createState() => uploadpic();
}

class uploadpic extends State<UploadPic> {

  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }

  void getImage({required ImageSource source}) async {

    final file = await ImagePicker().pickImage(
        source: source,
        maxWidth: 640,
        maxHeight: 480,
        imageQuality: 70 //0 - 100
    );

    if(file?.path != null){
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
//   void getImage({required ImageSource source}) async {
//   final file = await ImagePicker().pickImage(
//     source: source,
//     maxWidth: 640,
//     maxHeight: 480,
//     imageQuality: 70,
//   );

//   if (file?.path != null) {
//     setState(() {
//       imageFile = File(file!.path);
//     });

//     if (imageFile != null) {
//       final Uint8List imageBytes = await imageFile!.readAsBytes();
//       final String uid = '3NKynT1nH0jmfJvcn50N'; // Replace with the user's unique ID

//       try {
//         final String imageUrl = await uploadImage(imageBytes, uid);
//         // You can use imageUrl for further processing or storage reference.
//       } catch (error) {
//         // Handle any errors that occur during image upload.
//         print('Error uploading image: $error');
//       }
//     }
//   }
// }

}