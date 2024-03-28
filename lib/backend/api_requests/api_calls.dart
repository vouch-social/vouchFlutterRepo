import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class StartVouchCall {
  static Future<ApiCallResponse> call({
    String? message = '',
    dynamic? pathDetailsJson,
  }) async {
    final pathDetails = _serializeJson(pathDetailsJson);
    final ffApiRequestBody = '''
{
  "message": "${message}",
  "pathNodes": ${pathDetails}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'startVouch',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/vouch',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].createdAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchUserCall {
  static Future<ApiCallResponse> call({
    String? searchName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchUser',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/user?searchName=${searchName}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? photoURL(dynamic response) => (getJsonField(
        response,
        r'''$[:].photoURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static String? searchHashedPhone(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].hashedPhone''',
      ));
  static String? vanityName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].vanityName''',
      ));
  static String? localizedHeadLine(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].localizedHeadLine''',
      ));
}

class UpdateContactsCall {
  static Future<ApiCallResponse> call({
    dynamic? contactListJson,
    String? hashedPhone = '',
  }) async {
    final contactList = _serializeJson(contactListJson, true);
    final ffApiRequestBody = '''
{
  "contactList": ${contactList},
  "hashedPhone": "${hashedPhone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateContacts',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/contactList',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
    String? name = '',
    String? firebaseUserId = '',
    String? photoURL = '',
    String? userID = '',
    String? hashedPhone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "phone": "${phone}",
  "name": "${name}",
  "firebaseID": "${firebaseUserId}",
  "photoURL": "${photoURL}",
  "userID": "${userID}",
  "hashedPhone": "${hashedPhone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateUser',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/user',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserFromIDCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserFromID',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/user?userID=${userID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? photoURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.photoURL''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
}

class GetUserFromHashedPhoneCall {
  static Future<ApiCallResponse> call({
    String? hashedPhone = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserFromHashedPhone',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/userFromHash?hashedPhone=${hashedPhone}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? photoURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.photoURL''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static int? createdat(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created_at''',
      ));
  static int? phone(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.phone''',
      ));
  static String? firebaseID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.firebaseID''',
      ));
  static String? hashedPhone(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hashedPhone''',
      ));
  static String? linkedInSub(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.linkedInSub''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  static String? vanityName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.vanityName''',
      ));
  static String? localizedHeadline(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.localizedHeadLine''',
      ));
}

class GetMessagesCall {
  static Future<ApiCallResponse> call({
    String? currentUserHashedPhone = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMessages',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/getMessages',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'currentUserHashedPhone': currentUserHashedPhone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? nextNodeName(dynamic response) => (getJsonField(
        response,
        r'''$[:].nextPathNodeName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? prevNodeName(dynamic response) => (getJsonField(
        response,
        r'''$[:].prevPathNodeName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? createdDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nodeType(dynamic response) => (getJsonField(
        response,
        r'''$[:].nodeType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? message(dynamic response) => (getJsonField(
        response,
        r'''$[:].message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetPathsCall {
  static Future<ApiCallResponse> call({
    String? scannedHashedPhone = '',
    String? currentHashedPhone = '',
  }) async {
    final ffApiRequestBody = '''
{"scannedHashedPhone":"${scannedHashedPhone}",
"currentHashedPhone":"${currentHashedPhone}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getPaths',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/getPaths',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? pathsJSON(dynamic response) => getJsonField(
        response,
        r'''$.paths''',
        true,
      ) as List?;
  static List? individualPath(dynamic response) => getJsonField(
        response,
        r'''$.paths[:].path''',
        true,
      ) as List?;
  static List<int>? noOfPaths(dynamic response) => (getJsonField(
        response,
        r'''$.paths[:].length''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? nameInSinglePath(dynamic response) => (getJsonField(
        response,
        r'''$.paths[:].path[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? hashedPhoneInSinglePath(dynamic response) =>
      (getJsonField(
        response,
        r'''$.paths[:].path[:].contactHashedPhone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? totalStrength(dynamic response) => (getJsonField(
        response,
        r'''$.paths[:].strength''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? strengthToNext(dynamic response) => (getJsonField(
        response,
        r'''$.paths[:].path[:].strengthToNext''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static int? numPaths(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.numPaths''',
      ));
}

class GetContactNameCall {
  static Future<ApiCallResponse> call({
    String? contactHashedPhone = '',
  }) async {
    final ffApiRequestBody = '''
{"contactHashedPhone":"${contactHashedPhone}" }''';
    return ApiManager.instance.makeApiCall(
      callName: 'getContactName',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/getContact',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].name''',
      ));
  static String? contactHashedPhone(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].contactHashedPhone''',
      ));
  static int? userID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].user_id''',
      ));
}

class GetRandomCall {
  static Future<ApiCallResponse> call({
    String? hashedPhone = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getRandom',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/getRandom',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'hashedPhone': hashedPhone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].contactName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? hashedPhone(dynamic response) => (getJsonField(
        response,
        r'''$[:].hashedPhone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? isRegistered(dynamic response) => (getJsonField(
        response,
        r'''$[:].isRegistered''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? photoURL(dynamic response) => (getJsonField(
        response,
        r'''$[:].photoURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PostBountyCall {
  static Future<ApiCallResponse> call({
    String? linkedInURL = '',
    String? message = '',
    List<String>? contextList,
    String? urgency = '',
    String? startNodeHashedPhone = '',
    bool? isLinkedIn,
  }) async {
    final context = _serializeList(contextList);

    final ffApiRequestBody = '''
{
  "linkedInURL": "${linkedInURL}",
  "message": "${message}",
  "context": ${context},
  "urgency": "${urgency}",
  "startNodeHashedPhone": "${startNodeHashedPhone}",
  "isLinkedIn": ${isLinkedIn}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postBounty',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/bounty',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static int? createdAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created_at''',
      ));
  static String? linkedInURL(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.linkedInURL''',
      ));
  static List<String>? context(dynamic response) => (getJsonField(
        response,
        r'''$.context''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? urgency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.urgency''',
      ));
  static int? startNode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.startNode''',
      ));
  static int? expectedEndAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.expectedEnd_at''',
      ));
}

class GetBountyCall {
  static Future<ApiCallResponse> call({
    String? hashedPhone = '',
    String? filter = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBounty',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/bounty',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'hashedPhone': hashedPhone,
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? linkedInURL(dynamic response) => (getJsonField(
        response,
        r'''$[:].linkedInURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? message(dynamic response) => (getJsonField(
        response,
        r'''$[:].message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? context(dynamic response) => getJsonField(
        response,
        r'''$[:].context''',
        true,
      ) as List?;
  static List<String>? urgency(dynamic response) => (getJsonField(
        response,
        r'''$[:].urgency''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? startNode(dynamic response) => (getJsonField(
        response,
        r'''$[:].startNode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class PostBountyHuntCall {
  static Future<ApiCallResponse> call({
    String? bountyId = '',
    String? currentHashedPhone = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'postBountyHunt',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/bountyhunters',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBountyHuntersCall {
  static Future<ApiCallResponse> call({
    int? bountyId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBountyHunters',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/bountyhunters',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'bounty_id': bountyId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? bountyHunterListId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? bountyHunterListCreatedAt(dynamic response) =>
      (getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? bountyId(dynamic response) => (getJsonField(
        response,
        r'''$[:].bounty_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? bountyHunterId(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? bountyHunter(dynamic response) => getJsonField(
        response,
        r'''$[:].bountyHunterUser''',
        true,
      ) as List?;
  static List<int>? bountyHunterUserId(dynamic response) => (getJsonField(
        response,
        r'''$[:].bountyHunterUser.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? bountyHunterUserCreatedAt(dynamic response) =>
      (getJsonField(
        response,
        r'''$[:].bountyHunterUser.created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? bountyHunterUserName(dynamic response) => (getJsonField(
        response,
        r'''$[:].bountyHunterUser.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? bountyHunterUserPhone(dynamic response) => (getJsonField(
        response,
        r'''$[:].bountyHunterUser.phone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? bountyHunterUserFBID(dynamic response) => (getJsonField(
        response,
        r'''$[:].bountyHunterUser.firebaseID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? bountyHunterUserPhotoURL(dynamic response) =>
      (getJsonField(
        response,
        r'''$[:].bountyHunterUser.photoURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? as(dynamic response) => (getJsonField(
        response,
        r'''$[:].bountyHunterUser.graphID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? df(dynamic response) => (getJsonField(
        response,
        r'''$[:].bountyHunterUser.hashedPhone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? gh(dynamic response) => (getJsonField(
        response,
        r'''$[:].bountyHunterUser.vanityName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? bountyHunterUserHeadline(dynamic response) =>
      (getJsonField(
        response,
        r'''$[:].bountyHunterUser.localizedHeadLine''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? po(dynamic response) => (getJsonField(
        response,
        r'''$[:].bountyHunterUser.email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lk(dynamic response) => (getJsonField(
        response,
        r'''$[:].bountyHunterUser.linkedInSub''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic bountyHunterList(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
      );
}

class CloseBountyCall {
  static Future<ApiCallResponse> call({
    int? bountyId,
    int? expectedAt,
  }) async {
    final ffApiRequestBody = '''
{"expectedEnd_at":${expectedAt},
"bounty_id":${bountyId}}''';
    return ApiManager.instance.makeApiCall(
      callName: 'closeBounty',
      apiUrl:
          'https://x8ki-letl-twmt.n7.xano.io/api:hIXAhZL0/bounty/${bountyId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
