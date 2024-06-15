import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 're_sync_permissions_screen.dart' show ReSyncPermissionsScreen;
import 'package:flutter/material.dart';

class ContactsModel extends FlutterFlowModel<ReSyncPermissionsScreen> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (updateUser)] action in Permissions widget.
  // ApiCallResponse? newUserID;
  //late SharedPreferences prefs;


  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
