// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PathsStruct extends FFFirebaseStruct {
  PathsStruct({
    List<UserContactStruct>? pathNodes,
    int? length,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pathNodes = pathNodes,
        _length = length,
        super(firestoreUtilData);

  // "pathNodes" field.
  List<UserContactStruct>? _pathNodes;
  List<UserContactStruct> get pathNodes => _pathNodes ?? const [];
  set pathNodes(List<UserContactStruct>? val) => _pathNodes = val;
  void updatePathNodes(Function(List<UserContactStruct>) updateFn) =>
      updateFn(_pathNodes ??= []);
  bool hasPathNodes() => _pathNodes != null;

  // "length" field.
  int? _length;
  int get length => _length ?? 0;
  set length(int? val) => _length = val;
  void incrementLength(int amount) => _length = length + amount;
  bool hasLength() => _length != null;

  static PathsStruct fromMap(Map<String, dynamic> data) => PathsStruct(
        pathNodes: getStructList(
          data['pathNodes'],
          UserContactStruct.fromMap,
        ),
        length: castToType<int>(data['length']),
      );

  static PathsStruct? maybeFromMap(dynamic data) =>
      data is Map ? PathsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pathNodes': _pathNodes?.map((e) => e.toMap()).toList(),
        'length': _length,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pathNodes': serializeParam(
          _pathNodes,
          ParamType.DataStruct,
          true,
        ),
        'length': serializeParam(
          _length,
          ParamType.int,
        ),
      }.withoutNulls;

  static PathsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PathsStruct(
        pathNodes: deserializeStructParam<UserContactStruct>(
          data['pathNodes'],
          ParamType.DataStruct,
          true,
          structBuilder: UserContactStruct.fromSerializableMap,
        ),
        length: deserializeParam(
          data['length'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PathsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PathsStruct &&
        listEquality.equals(pathNodes, other.pathNodes) &&
        length == other.length;
  }

  @override
  int get hashCode => const ListEquality().hash([pathNodes, length]);
}

PathsStruct createPathsStruct({
  int? length,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PathsStruct(
      length: length,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PathsStruct? updatePathsStruct(
  PathsStruct? paths, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paths
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPathsStructData(
  Map<String, dynamic> firestoreData,
  PathsStruct? paths,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paths == null) {
    return;
  }
  if (paths.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paths.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pathsData = getPathsFirestoreData(paths, forFieldValue);
  final nestedData = pathsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paths.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPathsFirestoreData(
  PathsStruct? paths, [
  bool forFieldValue = false,
]) {
  if (paths == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paths.toMap());

  // Add any Firestore field values
  paths.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPathsListFirestoreData(
  List<PathsStruct>? pathss,
) =>
    pathss?.map((e) => getPathsFirestoreData(e, true)).toList() ?? [];
