// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BackEndUserStruct extends FFFirebaseStruct {
  BackEndUserStruct({
    String? backendId,
    String? name,
    String? photoURL,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _backendId = backendId,
        _name = name,
        _photoURL = photoURL,
        super(firestoreUtilData);

  // "backendId" field.
  String? _backendId;
  String get backendId => _backendId ?? '';
  set backendId(String? val) => _backendId = val;
  bool hasBackendId() => _backendId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "photoURL" field.
  String? _photoURL;
  String get photoURL => _photoURL ?? '';
  set photoURL(String? val) => _photoURL = val;
  bool hasPhotoURL() => _photoURL != null;

  static BackEndUserStruct fromMap(Map<String, dynamic> data) =>
      BackEndUserStruct(
        backendId: data['backendId'] as String?,
        name: data['name'] as String?,
        photoURL: data['photoURL'] as String?,
      );

  static BackEndUserStruct? maybeFromMap(dynamic data) => data is Map
      ? BackEndUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'backendId': _backendId,
        'name': _name,
        'photoURL': _photoURL,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'backendId': serializeParam(
          _backendId,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'photoURL': serializeParam(
          _photoURL,
          ParamType.String,
        ),
      }.withoutNulls;

  static BackEndUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      BackEndUserStruct(
        backendId: deserializeParam(
          data['backendId'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        photoURL: deserializeParam(
          data['photoURL'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BackEndUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BackEndUserStruct &&
        backendId == other.backendId &&
        name == other.name &&
        photoURL == other.photoURL;
  }

  @override
  int get hashCode => const ListEquality().hash([backendId, name, photoURL]);
}

BackEndUserStruct createBackEndUserStruct({
  String? backendId,
  String? name,
  String? photoURL,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BackEndUserStruct(
      backendId: backendId,
      name: name,
      photoURL: photoURL,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BackEndUserStruct? updateBackEndUserStruct(
  BackEndUserStruct? backEndUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    backEndUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBackEndUserStructData(
  Map<String, dynamic> firestoreData,
  BackEndUserStruct? backEndUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (backEndUser == null) {
    return;
  }
  if (backEndUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && backEndUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final backEndUserData =
      getBackEndUserFirestoreData(backEndUser, forFieldValue);
  final nestedData =
      backEndUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = backEndUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBackEndUserFirestoreData(
  BackEndUserStruct? backEndUser, [
  bool forFieldValue = false,
]) {
  if (backEndUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(backEndUser.toMap());

  // Add any Firestore field values
  backEndUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBackEndUserListFirestoreData(
  List<BackEndUserStruct>? backEndUsers,
) =>
    backEndUsers?.map((e) => getBackEndUserFirestoreData(e, true)).toList() ??
    [];
