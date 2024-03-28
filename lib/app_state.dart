import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _loginPhone = prefs.getString('ff_loginPhone') ?? _loginPhone;
    });
    _safeInit(() {
      _hashedPhone = prefs.getString('ff_hashedPhone') ?? _hashedPhone;
    });
    _safeInit(() {
      _contactCount = prefs.getInt('ff_contactCount') ?? _contactCount;
    });
    _safeInit(() {
      _linkedInClientId =
          prefs.getString('ff_linkedInClientId') ?? _linkedInClientId;
    });
    _safeInit(() {
      _redirecturi = prefs.getString('ff_redirecturi') ?? _redirecturi;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _scanResult;
  dynamic get scanResult => _scanResult;
  set scanResult(dynamic _value) {
    _scanResult = _value;
  }

  bool _ContactListIterable = false;
  bool get ContactListIterable => _ContactListIterable;
  set ContactListIterable(bool _value) {
    _ContactListIterable = _value;
  }

  int _hashedContactCount = 0;
  int get hashedContactCount => _hashedContactCount;
  set hashedContactCount(int _value) {
    _hashedContactCount = _value;
  }

  String _scannedUserPhotoURL = '';
  String get scannedUserPhotoURL => _scannedUserPhotoURL;
  set scannedUserPhotoURL(String _value) {
    _scannedUserPhotoURL = _value;
  }

  String _scannedUserName = '';
  String get scannedUserName => _scannedUserName;
  set scannedUserName(String _value) {
    _scannedUserName = _value;
  }

  String _scannedUserMessage = '';
  String get scannedUserMessage => _scannedUserMessage;
  set scannedUserMessage(String _value) {
    _scannedUserMessage = _value;
  }

  String _loginPhone = '';
  String get loginPhone => _loginPhone;
  set loginPhone(String _value) {
    _loginPhone = _value;
    prefs.setString('ff_loginPhone', _value);
  }

  String _hashedPhone =
      '501ffdb122a1e51ef0926828d0ad093144c07e7ed4906a85d9e1b033cad947c1';
  String get hashedPhone => _hashedPhone;
  set hashedPhone(String _value) {
    _hashedPhone = _value;
    prefs.setString('ff_hashedPhone', _value);
  }

  String _scannedHashedPhone =
      '432ee9f15bcd397b099ba359f1059edf769871cf87d2c0be98d2dce01dc167ed';
  String get scannedHashedPhone => _scannedHashedPhone;
  set scannedHashedPhone(String _value) {
    _scannedHashedPhone = _value;
  }

  List<PathsStruct> _getPathsResponse = [];
  List<PathsStruct> get getPathsResponse => _getPathsResponse;
  set getPathsResponse(List<PathsStruct> _value) {
    _getPathsResponse = _value;
  }

  void addToGetPathsResponse(PathsStruct _value) {
    _getPathsResponse.add(_value);
  }

  void removeFromGetPathsResponse(PathsStruct _value) {
    _getPathsResponse.remove(_value);
  }

  void removeAtIndexFromGetPathsResponse(int _index) {
    _getPathsResponse.removeAt(_index);
  }

  void updateGetPathsResponseAtIndex(
    int _index,
    PathsStruct Function(PathsStruct) updateFn,
  ) {
    _getPathsResponse[_index] = updateFn(_getPathsResponse[_index]);
  }

  void insertAtIndexInGetPathsResponse(int _index, PathsStruct _value) {
    _getPathsResponse.insert(_index, _value);
  }

  dynamic _getPathsJSON;
  dynamic get getPathsJSON => _getPathsJSON;
  set getPathsJSON(dynamic _value) {
    _getPathsJSON = _value;
  }

  int _contactCount = 0;
  int get contactCount => _contactCount;
  set contactCount(int _value) {
    _contactCount = _value;
    prefs.setInt('ff_contactCount', _value);
  }

  String _linkedInClientId = '86s8a2pvd36qob';
  String get linkedInClientId => _linkedInClientId;
  set linkedInClientId(String _value) {
    _linkedInClientId = _value;
    prefs.setString('ff_linkedInClientId', _value);
  }

  String _redirecturi = 'https://dev5747.d3ccozniz1kwv7.amplifyapp.com';
  String get redirecturi => _redirecturi;
  set redirecturi(String _value) {
    _redirecturi = _value;
    prefs.setString('ff_redirecturi', _value);
  }

  int _getPathsLength = 0;
  int get getPathsLength => _getPathsLength;
  set getPathsLength(int _value) {
    _getPathsLength = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
