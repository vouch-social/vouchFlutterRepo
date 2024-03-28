import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'home_widget.dart' show HomeWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  dynamic getRandomPageState;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getRandom)] action in Home widget.
  ApiCallResponse? apiResultbs0;
  var scannedQR = '';
  // Stores action output result for [Custom Action - splitUserShare] action in Container widget.
  String? qRscannedHashedPhone;
  // Stores action output result for [Backend Call - API (getUserFromHashedPhone)] action in Container widget.
  ApiCallResponse? userFromHashedPhone;
  // Stores action output result for [Backend Call - API (getRandom)] action in Icon widget.
  ApiCallResponse? getRandomRefresh;

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
