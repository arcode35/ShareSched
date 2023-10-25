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


import functions, { logger } from 'firebase-functions';
import vision from '@google-cloud/vision';
import admin from 'firebase-admin';

export const RECEIPT_COLLECTION = 'receipts';

admin.initializeApp();
export const readReceiptDetails = functions.storage.object().onFinalize(async (object) => {
  const imageBucket = `gs://${object.bucket}/${object.name}`;
  const client = new vision.ImageAnnotatorClient();

  const [textDetections] = await client.textDetection(imageBucket);
  const [annotation] = textDetections.textAnnotations;
  const text = annotation ? annotation.description : '';
  logger.log(text);
  
  // Parse text

  // Get user ID
  // object.name is userID/timestamp
//   const re = /(.*)\//;
//   const uid = re.exec(object.name)[1];

  // Going to hardcode returned text for relevant fields
//   const receipt = {
//     address: '123 Happy St, Bestcity, World 67890', 
//     amount: '23.45',
//     date: new Date(),
//     imageBucket,
//     items: 'best appetizer, best main dish, best dessert',
//     locationName: 'Best Restaurant',
//     uid
//   };

 // admin.firestore().collection(RECEIPT_COLLECTION).add(receipt);
});
