const functions = require("firebase-functions");
const admin = require("firebase-admin");
const neo4j = require("neo4j-driver");
admin.initializeApp();
const db = admin.firestore();
const cleanPhoneNumber = (phoneNumber) => {
  let formPNo = phoneNumber.replace(/\D/g, "");
  if (formPNo.length > 10 && formPNo.startsWith("91")) {
    formPNo = formPNo.substring(2);
  }
  if (formPNo.length > 10) {
    formPNo = formPNo.substring(formPNo.length - 10);
  }
  return formPNo;
};
exports.newCloudFunction2 = functions.https.onCall(async (phoneNumberDoc) => {
  const rawPhoneNumber = phoneNumberDoc.phoneNumber;
  const phoneNumber2 = cleanPhoneNumber(rawPhoneNumber);

  const querySnapshot = await db
    .collection("users")
    .where("phone", "==", phoneNumber)
    .get();

  if (querySnapshot.empty) {
    console.log("No matching documents.");
    return null;
  }

  // Assuming phone numbers are unique and only one document will match
  const userDocRef = querySnapshot.docs[0].ref;

  // const userDocRef = db.collection("users").doc(phoneNumber2);

  const userDoc = await userDocRef.get();
  if (!userDoc.exists) {
    throw new functions.https.HttpsError("not-found", "User not found");
  }
  const kontaktsCollectionRef = userDocRef.collection("Kontakts");
  const kontaktsSnapshot = await kontaktsCollectionRef.get();
  const allKontakts = kontaktsSnapshot.docs.map((doc) =>
    cleanPhoneNumber(doc.data().phone),
  );
  const batchSize = 100;
  const processBatch = async (batch, startIndex) => {
    let batchQuery = `MERGE (primary:kontakt{phone:'${phoneNumber2}'}) `;
    batch.forEach((kontaktPhoneNumber, index) => {
      const contactAlias = "contact_" + (startIndex + index);
      batchQuery +=
        `MERGE (${contactAlias}:kontakt{phone:'${kontaktPhoneNumber}'}) ` +
        `MERGE (primary)-[:konnekt{strength:10}]->(${contactAlias})`;
    });
    const session = driver.session();
    try {
      await session.run(batchQuery);
    } finally {
      session.close();
    }
  };
  for (let i = 0; i < allKontakts.length; i += batchSize) {
    const batch = allKontakts.slice(i, i + batchSize);
    await processBatch(batch, i);
  }
  driver.close();
});
