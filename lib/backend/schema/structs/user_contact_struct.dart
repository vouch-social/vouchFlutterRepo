// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserContactStruct extends FFFirebaseStruct {
  UserContactStruct({
    String? hashedPhone,
    String? contactName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _hashedPhone = hashedPhone,
        _contactName = contactName,
        super(firestoreUtilData);

  // "hashedPhone" field.
  String? _hashedPhone;
  String get hashedPhone => _hashedPhone ?? '';
  set hashedPhone(String? val) => _hashedPhone = val;
  bool hasHashedPhone() => _hashedPhone != null;

  // "contactName" field.
  String? _contactName;
  String get contactName => _contactName ?? '';
  set contactName(String? val) => _contactName = val;
  bool hasContactName() => _contactName != null;

  static UserContactStruct fromMap(Map<String, dynamic> data) =>
      UserContactStruct(
        hashedPhone: data['hashedPhone'] as String?,
        contactName: data['contactName'] as String?,
      );

  static UserContactStruct? maybeFromMap(dynamic data) => data is Map
      ? UserContactStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'hashedPhone': _hashedPhone,
        'contactName': _contactName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'hashedPhone': serializeParam(
          _hashedPhone,
          ParamType.String,
        ),
        'contactName': serializeParam(
          _contactName,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserContactStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserContactStruct(
        hashedPhone: deserializeParam(
          data['hashedPhone'],
          ParamType.String,
          false,
        ),
        contactName: deserializeParam(
          data['contactName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserContactStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserContactStruct &&
        hashedPhone == other.hashedPhone &&
        contactName == other.contactName;
  }

  @override
  int get hashCode => const ListEquality().hash([hashedPhone, contactName]);
}

UserContactStruct createUserContactStruct({
  String? hashedPhone,
  String? contactName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserContactStruct(
      hashedPhone: hashedPhone,
      contactName: contactName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserContactStruct? updateUserContactStruct(
  UserContactStruct? userContact, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userContact
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserContactStructData(
  Map<String, dynamic> firestoreData,
  UserContactStruct? userContact,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userContact == null) {
    return;
  }
  if (userContact.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userContact.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userContactData =
      getUserContactFirestoreData(userContact, forFieldValue);
  final nestedData =
      userContactData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userContact.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserContactFirestoreData(
  UserContactStruct? userContact, [
  bool forFieldValue = false,
]) {
  if (userContact == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userContact.toMap());

  // Add any Firestore field values
  userContact.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserContactListFirestoreData(
  List<UserContactStruct>? userContacts,
) =>
    userContacts?.map((e) => getUserContactFirestoreData(e, true)).toList() ??
    [];
