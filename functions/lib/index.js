"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.onMessageCreateCharles = void 0;
const admin = require("firebase-admin");
const functions = require("firebase-functions");
// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
// import {database, firestore, messaging} from "firebase-admin";
const database = admin.initializeApp().firestore();
exports.onMessageCreateCharles = functions.
    firestore.document("chatrooms/{chatroomId}/messages/{messageId}")
    .onCreate(async (snapshot, context) => {
    const chatroomId = context.params.chatroomId;
    await database
        .collection("chatrooms")
        .doc(chatroomId)
        .update({
        latestMessage: Object.assign(Object.assign({}, snapshot.data()), { id: snapshot.id }),
    });
});
//# sourceMappingURL=index.js.map