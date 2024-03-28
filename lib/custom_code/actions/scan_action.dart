// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> scanAction(
    String currentUserPhone, String scannedUserPhone) async {
  final instance = FirebaseFirestore.instance;
  QuerySnapshot snapshot = await instance
      .collection('kontakt')
      .where('phone', isEqualTo: scannedUserPhone)
      .get();
  String endId = snapshot.docs[0].id;

  snapshot = await instance
      .collection('kontakt')
      .where('phone', isEqualTo: currentUserPhone)
      .get();
  String startId = snapshot.docs[0].id;

  CollectionReference konnektsCollection = instance.collection('konnekts');

  List<List<String>> paths = [];

  Future<void> searchPath(
      List<String> currentPath, String currentNode, int depth) async {
    if (depth > 5) {
      return;
    }

    if (currentNode == endId) {
      paths.add(currentPath);
      return;
    }

    QuerySnapshot konnektQuery = await konnektsCollection
        .where('FromKontakt', isEqualTo: currentNode)
        .get();

    for (var doc in konnektQuery.docs) {
      String nextNode = doc.get('ToKontakt');
      if (!currentPath.contains(nextNode)) {
        List<String> newPath = List.from(currentPath)..add(nextNode);
        await searchPath(newPath, nextNode, depth + 1);
      }
    }
  }

  await searchPath([startId], startId, 0);

  // Sort the paths by length, so the shorter paths have higher intimacy value
  paths.sort((a, b) => a.length.compareTo(b.length));

  // Create a JSON object with the paths array
  Map<String, dynamic> jsonResult = {"paths": paths};

  // Save the JSON result to the app-wide widget state

  FFAppState().scanResult = jsonResult;
}
