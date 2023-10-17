//function for uploading an image to firebase storage
// import 'package:firebase_storage/firebase_storage.dart';
// import { ref, uploadBytes } from 'firebase/storage';


// // Create a storage reference from our app
// StorageReference storageRef = storage.getReference();

// // Create a reference to "mountains.jpg"
// StorageReference mountainsRef = storageRef.child("mountains.jpg");

// // Create a reference to 'images/mountains.jpg'
// StorageReference mountainImagesRef = storageRef.child("images/mountains.jpg");

// // While the file names are the same, the references point to different files
// mountainsRef.getName().equals(mountainImagesRef.getName());    // true
// mountainsRef.getPath().equals(mountainImagesRef.getPath());    // false



// import 'package:firebase_storage/firebase_storage.dart';
// //Initialize Firebase Storage
//   final storage = FirebaseStorage.instance;
//   final storageRef = storage.ref('gs://flutter-sharesched.appspot.com');

// //const BUCKET_URL = "gs://flutter-sharesched.appspot.com";

// export async function uploadImage(image, uid){

//   const bucket = '${BUCKET_URL}/${uid}.jpg';
//   const storageRef = ref(storage,bucket);
//   await uploadBytes(storageRef, image);
//   return bucket;
// }

// import the necessary Firebase Storage library.
//initialize Firebase Storage using FirebaseStorage.instance.
//The function uploadImage now accepts a Uint8List for the image data and a String for the user ID.
//The bucket is constructed using string interpolation.
//create a StorageReference using storage.refFromURL.
//use await with putData to upload the image.
//The function returns the bucket URL as a String

// import 'dart:typed_data';

// import 'package:firebase_storage/firebase_storage.dart';

// // // Initialize Firebase Storage
// // final storage = FirebaseStorage.instance;

// // Future<String> uploadImage(Uint8List image, String uid) async {
// //   final bucket = 'gs://flutter-sharesched.appspot.com/$uid.jpg';
// //   final storageRef = storage.refFromURL(bucket);
// //   await storageRef.putData(image);
// //   return bucket;
// // }

// // Create a storage reference from our app
// final storageRef = FirebaseStorage.instance.ref();

// // Create a reference to "mountains.jpg"
// final schedulesRef = storageRef.child("schedules.jpg");

// // Create a reference to 'images/schedules.jpg'
// final scheduleImagesRef = storageRef.child("images/schedules.jpg");

// // While the file names are the same, the references point to different files
// assert(schedulesRef.name == scheduleImagesRef.name);
// assert(schedulesRef.fullPath != scheduleImagesRef.fullPath);


//newest method
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// // import 'package:firebase_core/firebase_core';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart' as path;




// Future<String?> uploadImageToFirebaseStorage(File imageFile) async {
//   try {
//     FirebaseStorage storage = FirebaseStorage.instance;
//     Reference storageReference = storage.ref().child('images/${path.basename(imageFile.path)}');
    
//     // Upload the image to Firebase Storage
//     await storageReference.putFile(imageFile);

//     // Get the download URL for the uploaded image
//     String downloadURL = await storageReference.getDownloadURL();
    
//     return downloadURL; // Return the download URL of the uploaded image
//   } catch (e) {
//     print('Error uploading image to Firebase Storage: $e');
//     return null; // Return null in case of an error
//   }
// }
//new code based on doc
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

Future<String?> uploadImageToFirebaseStorage(File imageFile) async {
  try {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageRef = storage.ref().child('3NKynT1nH0jmfJvcn50N'); // Create a reference to the root of the storage bucket
    String fileName = 'nadeeba_sched.jpg'; // Replace with your desired file name
    Reference fileRef = storageRef.child('3NKynT1nH0jmfJvcn50N/$fileName'); // Create a reference to the file in Cloud Storage

    // Create metadata for the file
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');

    // Upload the image and metadata to the specified reference
    await fileRef.putFile(imageFile, metadata);

    // Get the download URL for the uploaded image
    String downloadURL = await fileRef.getDownloadURL();
    
    return downloadURL; // Return the download URL of the uploaded image
  } catch (e) {
    print('Error uploading image to Firebase Storage: $e');
    return null; // Return null in case of an error
  }
}
