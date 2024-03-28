import '/backend/api_requests/api_calls.dart';
import '/bounty/empty_bounty/empty_bounty_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'all_bounty_widget.dart' show AllBountyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AllBountyModel extends FlutterFlowModel<AllBountyWidget> {
  ///  Local state fields for this page.

  dynamic getBountyFiltered;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getBounty)] action in allBounty widget.
  ApiCallResponse? apiResultoby;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (getBounty)] action in DropDown widget.
  ApiCallResponse? apiResultoby1;
  // Stores action output result for [Backend Call - API (getBounty)] action in DropDown widget.
  ApiCallResponse? apiResultoby2;
  // Stores action output result for [Backend Call - API (getBounty)] action in DropDown widget.
  ApiCallResponse? apiResultoby3;

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
