<<<<<<< HEAD
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:myapp/firebase_options.dart';
// import 'package:myapp/pages/custom_widgets.dart';
// import 'package:myapp/pages/wrapper.dart';
// import 'pages/login.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// Future <void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   // await FirebaseFirestore.instance.settings( // Initialize Firestore
//   //   persistenceEnabled: true, // Enable local persistence
//   // );

//    // Initialize Firestore with settings
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   firestore.settings = const Settings(
//     persistenceEnabled: true, // Enable local persistence
//     // Add more settings as needed
//   );

//   //Initialize Firebase Storage
//   final storage = FirebaseStorage.instance;

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Wrapper(),
//     );
//   }
// }

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       appBar: CustomAppBar(),
//       body: Center(
//         child: LoginForm(),
//       ),
//     );
//   }
// }



//FAIZAN CODE
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as storage;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/services/storage.dart';


void main() {
  runApp(const MaterialApp(
    home: UploadPic(),
  ));
=======
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
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
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
<<<<<<< HEAD
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Upload Your Schedule',
            style: GoogleFonts.exo(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          centerTitle: true, backgroundColor: Colors.blue[800]

      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(imageFile != null)
              Container(
                width: 640,
                height: 480,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: FileImage(imageFile!),
                      fit: BoxFit.cover
                  ),
                  border: Border.all(width: 8, color: Colors.black),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              )
            else
              Container(
                  width: 640,
                  height: 480,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    border: Border.all(width: 8, color: Colors.black12),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text('Image', style: GoogleFonts.exo(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,),)
              ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: ()=> getImage(source: ImageSource.camera),
                      child: Text('Capture Image', style: GoogleFonts.exo(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,),)
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: ElevatedButton(
                      onPressed: ()=> getImage(source: ImageSource.gallery),
                      child: Text('Select Image', style: GoogleFonts.exo(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,))
                  ),
                )
              ],
            ),
          ],
        ),
      ),
=======
    return MaterialApp(
      home: WelcomeScreen(),
>>>>>>> f3637b8ca2db05dd4824a99ba1c271a4747821a9
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