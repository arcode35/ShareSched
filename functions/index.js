// /**
//  * Import function triggers from their respective submodules:
//  *
//  * const {onCall} = require("firebase-functions/v2/https");
//  * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
//  *
//  * See a full list of supported triggers at https://firebase.google.com/docs/functions
//  */

// const {onRequest} = require("firebase-functions/v2/https");
// const logger = require("firebase-functions/logger");

// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started

// // exports.helloWorld = onRequest((request, response) => {
// //   logger.info("Hello logs!", {structuredData: true});
// //   response.send("Hello from Firebase!");
// // });

//export const RECEIPT_COLLECTION = 'receipts';

import functions, { logger } from 'firebase-functions';
import vision from '@google-cloud/vision';
import admin from 'firebase-admin';


//console.log("Hello World");

//admin.initializeApp();

export const uploadstudentsched = functions.storage.object().onFinalize(async (object) => {

  const imageBucket = `gs://${object.bucket}/${object.name}`;
  const client = new vision.ImageAnnotatorClient();

  const [textDetections] = await client.textDetection(imageBucket);
  const [annotation] = textDetections.textAnnotations;
  const text = annotation ? annotation.description: '';

  
  logger.log("hello world");
  logger.log(text);
  logger.log("new line");
//parse text in the form XX-XXXX-XXX
const regex = /([A-Za-z]+)-(\d+)-(\d+)/; 

const lines = text.split('\n');

for (const line of lines) {
  const match = line.match(regex);
  if (match) {
    console.log(match[1]); // Prefix
    console.log(match[2]); // First code number
    console.log(match[3]); // Second code number
  }
}
   
 
});




