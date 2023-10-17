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

import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

// // Initialize Firebase Storage
// final storage = FirebaseStorage.instance;

// Future<String> uploadImage(Uint8List image, String uid) async {
//   final bucket = 'gs://flutter-sharesched.appspot.com/$uid.jpg';
//   final storageRef = storage.refFromURL(bucket);
//   await storageRef.putData(image);
//   return bucket;
// }

// Create a storage reference from our app
final storageRef = FirebaseStorage.instance.ref();

// Create a reference to "mountains.jpg"
final schedulesRef = storageRef.child("schedules.jpg");

// Create a reference to 'images/schedules.jpg'
final scheduleImagesRef = storageRef.child("images/schedules.jpg");

// While the file names are the same, the references point to different files
assert(schedulesRef.name == scheduleImagesRef.name);
assert(schedulesRef.fullPath != scheduleImagesRef.fullPath);