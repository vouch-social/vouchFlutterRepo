import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "hashedPhone" field.
  String? _hashedPhone;
  String get hashedPhone => _hashedPhone ?? '';
  bool hasHashedPhone() => _hashedPhone != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "linkedInvanityName" field.
  String? _linkedInvanityName;
  String get linkedInvanityName => _linkedInvanityName ?? '';
  bool hasLinkedInvanityName() => _linkedInvanityName != null;

  // "linkedInHeadLine" field.
  String? _linkedInHeadLine;
  String get linkedInHeadLine => _linkedInHeadLine ?? '';
  bool hasLinkedInHeadLine() => _linkedInHeadLine != null;

  // "linkedInSub" field.
  String? _linkedInSub;
  String get linkedInSub => _linkedInSub ?? '';
  bool hasLinkedInSub() => _linkedInSub != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phone = snapshotData['phone'] as String?;
    _userName = snapshotData['userName'] as String?;
    _hashedPhone = snapshotData['hashedPhone'] as String?;
    _uid = snapshotData['uid'] as String?;
    _linkedInvanityName = snapshotData['linkedInvanityName'] as String?;
    _linkedInHeadLine = snapshotData['linkedInHeadLine'] as String?;
    _linkedInSub = snapshotData['linkedInSub'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  DateTime? createdTime,
  String? phone,
  String? userName,
  String? hashedPhone,
  String? uid,
  String? linkedInvanityName,
  String? linkedInHeadLine,
  String? linkedInSub,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'phone': phone,
      'userName': userName,
      'hashedPhone': hashedPhone,
      'uid': uid,
      'linkedInvanityName': linkedInvanityName,
      'linkedInHeadLine': linkedInHeadLine,
      'linkedInSub': linkedInSub,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phone == e2?.phone &&
        e1?.userName == e2?.userName &&
        e1?.hashedPhone == e2?.hashedPhone &&
        e1?.uid == e2?.uid &&
        e1?.linkedInvanityName == e2?.linkedInvanityName &&
        e1?.linkedInHeadLine == e2?.linkedInHeadLine &&
        e1?.linkedInSub == e2?.linkedInSub;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.phoneNumber,
        e?.createdTime,
        e?.phone,
        e?.userName,
        e?.hashedPhone,
        e?.uid,
        e?.linkedInvanityName,
        e?.linkedInHeadLine,
        e?.linkedInSub
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
