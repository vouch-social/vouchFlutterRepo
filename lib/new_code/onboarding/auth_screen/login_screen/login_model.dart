import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_model.dart';
import 'login_screen.dart';


class LoginModel extends FlutterFlowModel<LoginScreen> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode1;
  TextEditingController? phoneNumberController1;
  String? Function(BuildContext, String?)? phoneNumberController1Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode2;
  TextEditingController? phoneNumberController2;
  TextEditingController? phoneNumberController3;
  String? Function(BuildContext, String?)? phoneNumberController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    phoneNumberFocusNode1?.dispose();
    phoneNumberController1?.dispose();

    phoneNumberFocusNode2?.dispose();
    phoneNumberController2?.dispose();
    phoneNumberController3?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
