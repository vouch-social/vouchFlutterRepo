import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'name_widget.dart' show NameWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NameModel extends FlutterFlowModel<NameWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for userName widget.
  FocusNode? userNameFocusNode1;
  TextEditingController? userNameController1;
  String? Function(BuildContext, String?)? userNameController1Validator;
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode2;
  TextEditingController? userNameController2;
  String? Function(BuildContext, String?)? userNameController2Validator;
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode3;
  TextEditingController? userNameController3;
  String? Function(BuildContext, String?)? userNameController3Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    userNameFocusNode1?.dispose();
    userNameController1?.dispose();

    userNameFocusNode2?.dispose();
    userNameController2?.dispose();

    userNameFocusNode3?.dispose();
    userNameController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
